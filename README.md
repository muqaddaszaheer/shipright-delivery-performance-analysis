# On Time, On Point — Delivery Performance & Customer Satisfaction

A portfolio-ready Google Data Analytics Capstone case study using the public Olist Brazilian e-commerce dataset.

> **Scenario note:** ShipRight is fictional. The dataset is real and publicly available. No company performance is being claimed.

## Project goal
Identify where delivery performance is weakest and examine how delivery delay is associated with customer satisfaction.

## Framework
**Ask → Prepare → Process → Analyze → Share → Act**

## Key results
- 93.2% on-time delivery rate among 96,476 delivered orders.
- 6.8% late-delivery rate.
- Pearson correlation between delivery delay and review score: **-0.267**.
- AL had the highest late-delivery rate among states with ≥100 delivered orders: **21.4%**.
- Top 10 sellers represented about **16.0%** of late order-seller pairs.

## Tools
Python, pandas, NumPy, Matplotlib, SQL, Power BI (dashboard-ready outputs).

## Repository structure
```text
shipright-capstone/
├── README.md
├── data/
│   ├── data_quality_summary.csv
│   ├── order_delivery_analysis.csv
│   ├── delivery_review_analysis.csv
│   ├── state_performance.csv
│   ├── category_performance.csv
│   ├── seller_performance.csv
│   └── monthly_performance.csv
├── sql/
│   └── analysis_queries.sql
├── visualizations/
│   ├── monthly_late_delivery_rate.png
│   ├── top_states_late_rate.png
│   ├── review_score_by_delay.png
│   └── top_categories_late_rate.png
└── reports/
    └── case_study.md
```

## Dataset source
Olist Brazilian E-Commerce Public Dataset: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Download the original dataset from Kaggle and keep it separate from the processed portfolio outputs. Do not upload private or restricted information.

## Important methodology choices
- Delivery performance uses delivered orders with a non-missing customer-delivery date.
- `delay_days = actual delivery date - estimated delivery date`.
- `delay_days <= 0` means on time or early.
- Multiple review rows are aggregated to one mean score per order.
- Category analysis uses unique order-category pairs.
- Seller analysis uses unique order-seller pairs to handle multi-seller orders.
- Small groups should be treated cautiously.

## Portfolio summary
This project demonstrates data cleaning, relational joins, KPI design, exploratory analysis, statistical interpretation, visualization, and evidence-based business recommendations.
