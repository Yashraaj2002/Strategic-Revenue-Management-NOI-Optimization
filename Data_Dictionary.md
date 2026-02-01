# 📖 Project Documentation & Data Dictionary

## 🏘️ Project Overview

This project analyzes a multifamily real estate portfolio to identify "Revenue Leakage"—capital left on the table due to internal pricing trailing current market capabilities. The goal is to provide actionable intelligence for weekly pricing cycles and renewal strategies to maximize Net Operating Income (NOI).

## 📂 Data Architecture 
The analysis is built on a relational star schema consisting of three primary data sources:

1. Fact_Rent_Roll (Internal Data): A unit-by-unit list of current residents, what they pay, and when their leases end.

2. Dim_Market_Comps (External Data): Pricing and performance data for competitor properties (Comps) in the same neighborhood.

3. Dim_Properties (Mapping): The master list that connects internal assets to their respective cities and total unit counts.

## 📊 Key Performance Indicators (KPIs) Explained

### Financial Metrics

1. Loss to Lease (L2L): The variance between Market Rent (target) and Actual Rent (current). A high L2L indicates an opportunity for aggressive renewal increases.

2. PSF (Price Per Square Foot): Calculated as Rent / Square Footage. This is the industry-standard metric for "apples-to-apples" comparison across different unit sizes.

3. Recovery %: A dynamic "What-If" metric allowing executives to simulate the bottom-line impact of reclaiming a portion of the current Loss to Lease.

### Operational Metrics
1. Occupancy %: The percentage of total portfolio units currently occupied by residents.

2. Vacancy %: The inverse of occupancy; essential for identifying underperforming assets that may require marketing intervention or price drops.

3. Lease Expiration Ladder: A chronological view of when leases end, used to forecast turnover risk and manage leasing staff capacity.
