# Strategic Revenue Management & NOI Optimization

## 📊 Executive Summary
This project showcases a comprehensive **Revenue Management System** designed for a US-based Multifamily client with assets across New York, Connecticut, and Massachusetts. By integrating internal Rent Roll data with external market benchmarks (HelloData), 

I identified a **$0.65M annualized revenue leakage** (Loss to Lease). The system provides actionable insights for weekly pricing adjustments, renewal strategies, and operational risk mitigation to protect and grow the portfolio's **Net Operating Income (NOI)**.

## 📂 Project Structure
* 📁 **Documentation**: Features a comprehensive **Data Dictionary** explaining real estate KPIs and technical definitions.
* 📁 **SQL_Analysis**: Contains optimized **PostgreSQL scripts** used for data cleaning, schema design, and complex revenue queries.
* 📁 **Dashboards**: Includes the **Power BI Executive Summary (PDF)** showcasing interactive visualizations and "What-If" recovery simulations.

## 🏢 Business Context: The "Why"
In the Multifamily vertical, the primary objective is the consistent growth of **NOI** to increase asset valuation.
* **The Problem**: A significant gap existed between current effective rents and market potential, threatening the balance sheet if left unaddressed.
* **The Solution**: I developed a data pipeline and interactive dashboard to monitor KPIs (Occupancy, Availability, L2L) and automate the identification of underperforming units.

## 🛠️ Tools & Technologies
* **Database**: PostgreSQL (Data cleaning, normalization, and relational schema design).
* **BI Tool**: Power BI (Executive storytelling and "What-If" modeling).
* **Data Sources**: Internal Rent Rolls & External Market Comps (HelloData).

## 🔍 Deep-Dive Analysis

### 1. Revenue Gap Analysis (Loss to Lease)
* **Insight**: Identified an average **$627K gap** between actual collected rent and internal market targets.
* **Impact**: Targeted property **"Abb"** ($184K L2L) for immediate weekly pricing re-evaluation to capture missing revenue.

### 2. Market Benchmarking (PSF Variance)
* **Insight**: Portfolio average PSF stands at **$2.17** compared to a market average of **$3.09**.
* **Impact**: Validated that the portfolio is underpriced by nearly **30%**, providing a data-backed roadmap for aggressive renewal increases.

### 3. Operational Risk: The Expiration Ladder
* **Insight**: Mapped **1,123 leases** expiring in the next 90 days, with a significant peak in **July (619 units)**.
* **Impact**: Implemented a **90-day lead time** for renewal offers to maximize negotiation headroom and minimize vacancy loss during peak turnover months.

## 📈 Key Findings & Strategic Insights

### 💡 The $0.65M Revenue Opportunity
The portfolio is currently losing **$627,079 annually** due to the gap between actual and market rents. Property **"Abb"** is the single largest contributor to this loss, accounting for **$183,540 (approx. 29%)** of total portfolio leakage, despite maintaining a stable vacancy rate.

### 💡 Competitive Pricing Deficit
Our **Avg PSF of $2.17** is trailing the **Avg Comp PSF of $3.09** by nearly **30%**. This confirms the portfolio is significantly underpriced and can support higher weekly pricing increases without risking occupancy loss.

### 💡 Operational Peak Risk
The "Expirations by Month" trend indicates a massive surge in the summer, peaking at **619 units expiring in July**. The leasing team must prioritize **90-day-lead** renewal offers immediately to secure residents before this peak window.

## 🚀 Strategic Recommendations
* **Dynamic Weekly Pricing**: Adjust individual Bedroom-type pricing based on seasonality and the 30/60-day availability window.
* **Renewal Optimization**: Prioritize properties with **<5% vacancy** and **>$50 Loss to Lease** for maximum renewal rate increases.
* **Capacity Planning**: Increase leasing support during the Q3 expiration surge (July-August) to maintain a **95.7% portfolio occupancy**.

## 📊 Dashboard Preview
<img width="1408" height="820" alt="image" src="https://github.com/user-attachments/assets/22aa8b1d-fe67-4014-a5e5-bbd1a2ab6be8" />
*Visualizing key real estate KPIs (Occupancy %, Vacancy %, Loss-to-Lease, Avg PSF), property breakdowns, and lease-expiry trends*.
