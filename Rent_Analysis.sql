SQL Development & Analytical Documentation
Phase 1: Database Schema Definition
I designed a relational schema to centralize property metadata, internal operational data (Rent Rolls), and external market intelligence (Comps).

SQL

-- 1. Master Property Table
CREATE TABLE Dim_Properties (
    Property_ID   INT PRIMARY KEY,
    Property_Name VARCHAR(100),
    Market_City   VARCHAR(100),
    Total_Units   INT
);

-- 2. Master Rent Roll Table (Internal Fact Table)
CREATE TABLE Fact_Rent_Roll (
    Unit_ID          SERIAL PRIMARY KEY,
    Property_ID      INT REFERENCES Dim_Properties(Property_ID),
    Property_Name    VARCHAR(100),
    Unit_Number      VARCHAR(20),
    Sq_Ft            INT,
    Resident_Name    VARCHAR(255),
    Market_Rent      DECIMAL(10,2),
    Actual_Rent      DECIMAL(10,2),
    Move_In_Date     DATE,
    Lease_Expiration DATE,
    Move_Out_Date    DATE
);

-- 3. Master Market Comps Table (External Reference Table)
CREATE TABLE Dim_Market_Comps (
    Comp_ID            SERIAL PRIMARY KEY,
    Property_ID        INT REFERENCES Dim_Properties(Property_ID),
    Property           VARCHAR(100),
    Comp_Property_Name VARCHAR(255),
    Bedrooms           INT,
    Bathrooms          INT,
    Days_on_Market     INT,
    Applications       INT,
    Cancellations      INT,
    SF                 INT,
    Rent               DECIMAL(10,2)
);
Phase 2: Analytical Queries & Business Logic
Q1: Portfolio-Wide Loss to Lease (L2L) Analysis
Question: What is the total monthly dollar difference between our internal Market Rent targets and the Actual Rent currently being paid?

SQL

SELECT 
    property_id,
    Property_name,
    SUM(market_rent) - SUM(actual_rent) AS loss_to_lease
FROM Fact_Rent_Roll
GROUP BY 1, 2
ORDER BY 1;
Explanation: This query quantifies the "revenue leakage" occurring within the portfolio. By identifying which properties have the highest gap between current and target rents, we can prioritize these assets for more aggressive renewal increases or immediate weekly pricing adjustments to capture missing NOI.

Extra Q: Internal Rent vs. Competitor Benchmarking
Question: How does our current Average Actual Rent compare directly to the Average Rent of our neighborhood competitors?

SQL

SELECT 
    f.property_id,
    f.property_name,
    ROUND(AVG(f.actual_rent), 2) AS avg_internal_rent,
    ROUND(AVG(c.rent), 2) AS avg_comp_rent
FROM Fact_Rent_Roll f 
JOIN Dim_Market_Comps c ON f.property_id = c.property_id
GROUP BY 1, 2
ORDER BY 1;
Explanation: This provides a direct competitive benchmark. If our average rent is significantly lower than the competitor average ($2.17 vs. $3.09), it serves as a data-backed justification for raising our "Gross Potential Rent" during the next pricing cycle.

Q2: Market Penetration Index (PSF Variance)
Question: What is our Average Price per Square Foot (PSF) compared to the Average Market PSF of the competitor set?

SQL

WITH Internal_PSF AS (
    SELECT 
        property_id, 
        property_name,
        SUM(actual_rent) / SUM(sq_ft) AS actual_psf
    FROM Fact_Rent_Roll
    GROUP BY 1, 2
),
Market_PSF AS (
    SELECT 
        property_id,
        SUM(rent) / SUM(sf) AS market_psf
    FROM Dim_Market_Comps
    GROUP BY 1
)
SELECT 
    i.property_id,
    i.property_name,
    ROUND(i.actual_psf, 2) AS avg_actual_psf,
    ROUND(m.market_psf, 2) AS avg_market_psf,
    ROUND(m.market_psf - i.actual_psf, 2) AS psf_gap
FROM Internal_PSF i
JOIN Market_PSF m ON i.property_id = m.property_id
ORDER BY 1;
Explanation: PSF is the "great equalizer" in real estate analytics. This query removes the bias of unit size and tells us if we are maximizing the value of our square footage relative to the market. A large positive gap indicates that the market is willing to pay more, highlighting a significant opportunity for revenue growth.

Q3: 2026 Lease Expiration "Risk Ladder"
Question: Which months in 2026 have the highest volume of expirations, representing the greatest risk to portfolio occupancy?

SQL

SELECT
    EXTRACT(MONTH FROM lease_expiration) AS month,
    ROUND(SUM(actual_rent), 0) AS total_rent_at_risk,
    COUNT(*) AS total_units_expiring
FROM Fact_Rent_Roll
WHERE lease_expiration IS NOT NULL 
  AND EXTRACT(YEAR FROM lease_expiration) = 2026
GROUP BY 1
ORDER BY 1;
Explanation: This query serves as an early-warning system for the leasing team. By identifying high-turnover months—like the surge in July and August (619 units)—we can initiate the renewal process 90 days in advance to secure residents and maintain our 95.7% occupancy target.

Q4: Competitor Operational Efficiency (Cancellation Rates)
Question: Which competitor properties have a cancellation rate higher than 20%, and what is their current rent position?

SQL

SELECT
    property,
    ROUND(SUM(cancellations)::NUMERIC / COUNT(*) * 100, 2) AS cancellation_rate,
    ROUND(AVG(rent), 2) AS avg_rent
FROM Dim_Market_Comps
GROUP BY 1
HAVING ROUND(SUM(cancellations)::NUMERIC / COUNT(*) * 100, 2) > 20;
Explanation: High cancellation rates at competitor properties can indicate pricing friction, poor application processes, or "bait-and-switch" marketing. Monitoring this allows us to position our properties as more reliable alternatives to frustrated prospective tenants in the same sub-market.

Q5: "The Sweet Spot" Identification
Question: Which properties have high occupancy (>95%) but are still priced below the market average?

SQL

WITH property_stats AS (
    SELECT 
        property_id,
        property_name,
        COUNT(*) AS total_units,
        SUM(CASE WHEN resident_name = 'VACANT' THEN 1 ELSE 0 END) AS vacant_units,
        AVG(actual_rent) AS avg_actual_rent
    FROM Fact_Rent_Roll
    GROUP BY 1, 2
),
market_stats AS (
    SELECT 
        property_id,
        AVG(rent) AS avg_market_rent
    FROM Dim_Market_Comps
    GROUP BY 1
)
SELECT 
    p.property_name,
    ROUND((p.vacant_units::NUMERIC / p.total_units) * 100, 2) AS vacancy_rate,
    ROUND(p.avg_actual_rent, 2) AS avg_actual_rent,
    ROUND(m.avg_market_rent, 2) AS avg_market_rent,
    ROUND(m.avg_market_rent - p.avg_actual_rent, 2) AS rent_gap
FROM property_stats p
JOIN market_stats m ON p.property_id = m.property_id
WHERE (p.vacant_units::NUMERIC / p.total_units) < 0.05 
ORDER BY rent_gap DESC;

Explanation: This identifies our highest-priority assets for rent hikes. If a property is full (low vacancy) but its rent is still significantly below the market, we are essentially giving away value. These 13 "Sweet Spot" properties represent our fastest path to increasing Net Operating Income (NOI).
