# Strategic Revenue Management & NOI Optimization

📊 Executive Summary
This project showcases a comprehensive Revenue Management System designed for a US-based Multifamily client with assets across New York, Connecticut, and Massachusetts. By integrating internal Rent Roll data with external market benchmarks (HelloData), I identified a $0.65M annualized revenue leakage (Loss to Lease). The system provides actionable insights for weekly pricing adjustments, renewal strategies, and operational risk mitigation to protect and grow the portfolio's Net Operating Income (NOI).

🏢 Business Context & "The Why"
In the Multifamily vertical, the primary objective is the consistent growth of NOI to increase asset valuation.

The Problem: A significant gap existed between current effective rents and market potential, threatening the balance sheet if left unaddressed.

The Solution: I developed a data pipeline and interactive dashboard to monitor KPIs (Occupancy, Availability, L2L) and automate the identification of underperforming units.

🛠️ Tech Stack
Database: PostgreSQL (Data cleaning, normalization, and relational schema design).

BI Tool: Power BI (Executive storytelling and "What-If" modeling).

Data Sources: Internal Rent Rolls & External Market Comps (HelloData).

🔍 Deep-Dive Analysis
1. Revenue Gap Analysis (Loss to Lease)
Insight: Identified an average $627K gap between actual collected rent and internal market targets.

Impact: Targeted the property "Abb" ($184K L2L) for immediate weekly pricing re-evaluation.

2. Market Benchmarking (PSF Variance)
Insight: Portfolio average PSF stands at $2.17 compared to a market average of $3.09.

Impact: Validated that the portfolio is currently underpriced by nearly 30%, providing a clear roadmap for aggressive renewal increases.

3. Operational Risk: The Expiration Ladder
Insight: Mapped 1,123 leases expiring in the next 90 days, with a significant peak in July (619 units).

Impact: Implemented a 90-day lead time for renewal offers to maximize negotiation headroom and minimize vacancy loss during peak turnover months.

📈 Interactive Features
What-If Recovery Simulator: Allows stakeholders to toggle "Recovery %" to see the direct impact on the bottom line (e.g., a 50% recovery yields $326.5K in additional NOI).

Price/Occupancy Scatter Plot: Instantly identifies properties with high occupancy (>95%) but high L2L—the "Sweet Spot" for immediate rent hikes.

💡 Strategic Recommendations
Dynamic Weekly Pricing: Adjust individual Bedroom-type pricing based on seasonality and the 30/60-day availability window identified in the dashboard.

Renewal Optimization: Prioritize properties with <5% vacancy and >$50 Loss to Lease for maximum renewal rate increases.

Capacity Planning: Increase leasing support during the Q3 expiration surge (July-August) to maintain a 95.7% portfolio occupancy.
