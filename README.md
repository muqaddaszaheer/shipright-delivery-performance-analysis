# On Time, On Point — Delivery Performance & Customer Satisfaction

A portfolio-ready **Google Data Analytics Capstone** case study analyzing delivery performance and customer satisfaction using the public **Brazilian E-Commerce Public Dataset by Olist**.

> **Scenario note:** ShipRight is a fictional company created for this portfolio case study. The underlying dataset is real and publicly available. This project does not represent actual ShipRight business performance.

## Project Goal

Identify where delivery performance is weakest and examine how delivery delays are associated with customer satisfaction.

## Business Questions

This project focuses on five key questions:

1. Which customer states have the highest late-delivery rates?
2. Is delivery delay associated with customer review scores?
3. Do product categories differ in delivery performance?
4. Are late deliveries concentrated among a small number of sellers?
5. How does delivery performance change over time?

## Framework

The analysis follows the **Google Data Analytics six-phase framework**:

**Ask → Prepare → Process → Analyze → Share → Act**

## Key Results

* **93.2%** on-time delivery rate among **96,476 delivered orders**
* **6.8%** late-delivery rate
* Pearson correlation between delivery delay and review score: **-0.267**
* **Alagoas (AL)** had the highest late-delivery rate among states with at least 100 delivered orders: **21.4%**
* The top 10 sellers accounted for approximately **16.0% of late order-seller pairs**

> **Interpretation note:** The negative correlation indicates that longer delivery delays were associated with lower review scores in this dataset. It does not prove that delivery delays caused lower review scores.

## Tools & Technologies

* **Python** — data preparation, cleaning, transformation, and analysis
* **pandas** — data manipulation and analysis
* **NumPy** — numerical calculations
* **Matplotlib** — data visualization
* **SQL** — querying and aggregation
* **Power BI** — dashboard development
* **GitHub** — project documentation and portfolio presentation

## Dataset

This project uses the **Brazilian E-Commerce Public Dataset by Olist**, a publicly available dataset containing information about orders, customers, sellers, products, reviews, payments, and other e-commerce activity.

**Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

The original dataset should be downloaded directly from Kaggle and kept separate from the processed portfolio outputs.

No private or restricted information is included in this project.

## Methodology

The analysis applies the following rules and data-preparation decisions:

* Delivery performance uses delivered orders with a non-missing customer-delivery date.
* `delay_days` is calculated as the actual delivery date minus the estimated delivery date.
* `delay_days <= 0` is classified as **on time or early**.
* Multiple review records for the same order are aggregated into one mean review score.
* Category analysis uses unique order-category pairs to reduce repeated-item weighting.
* Seller analysis uses unique order-seller pairs because some orders contain multiple sellers.
* Small groups are treated cautiously when comparing performance.
* Missing category values are retained as `Unknown` rather than assigned an unsupported category.
* The Geolocation table is not used in the core analysis because it is not required to answer the five business questions.

## Data Quality Considerations

The raw dataset was reviewed before analysis. Key considerations include:

* The Orders table contains **99,441 rows**, including **2,965 missing customer-delivery dates**.
* The Products table contains **610 missing category names**.
* The Reviews table contains missing review titles and messages. These text fields are not required for the core analysis.
* The Geolocation table contains duplicate records and is not required for the core analysis.
* Four product records contain non-positive weight values. Product weight is not required for the core analysis and was therefore not used.
* Some orders contain multiple sellers or multiple products, so appropriate unique combinations are used to reduce duplicate weighting.

## Analysis Highlights

### Geographic Performance

Delivery performance varies across customer states.

Among states with at least 100 delivered orders, **Alagoas (AL)** had the highest late-delivery rate at **21.4%**, followed by **Maranhão (MA)** at **17.4%** and **Sergipe (SE)** at **15.2%**.

These results identify states that may deserve further operational investigation, but they do not by themselves identify the causes of delays.

### Delivery Delays & Customer Satisfaction

The Pearson correlation between delivery delay and review score was **-0.267**.

This indicates an association between longer delivery delays and lower customer review scores in the dataset. Because the analysis is observational, this relationship should not be interpreted as proof of causation.

### Product Category Performance

Category performance varies across the marketplace.

Using unique order-category pairs and focusing on categories with at least 500 pairs:

* **Office Furniture:** **8.1%** late-delivery rate
* **Baby:** **8.0%** late-delivery rate

Category results should be considered alongside geography, seller performance, and order volume.

### Seller Performance

Seller analysis uses unique order-seller pairs because an order can contain multiple sellers.

The top 10 sellers by late-order count accounted for approximately **16.0% of late order-seller pairs**.

This suggests that late deliveries are distributed across the seller network rather than being limited to a very small group of sellers.

### Performance Over Time

Monthly delivery performance fluctuates throughout the dataset rather than following a simple continuous improvement or decline.

Some months in late 2017 and early 2018 show higher late-delivery rates. The earliest months have relatively small order volumes and should therefore be interpreted cautiously.

## Recommendations

### 1. Investigate High-Risk States

Operations teams should investigate states with consistently high late-delivery rates and sufficient order volume.

The investigation could include carrier coverage, fulfillment handoffs, and delivery-estimate accuracy before broader operational changes are introduced.

### 2. Monitor Delivery Performance Alongside Customer Satisfaction

Because longer delivery delays are associated with lower review scores, delivery performance and customer satisfaction should be monitored together.

Tracking these measures side by side can help identify potential customer-experience risks earlier.

### 3. Monitor Seller-Level Exceptions

Seller-level reporting can help identify high-volume sellers with unusually high late-delivery rates.

The purpose should be targeted investigation and operational support rather than automatic penalties, because seller performance can also be influenced by geography, product mix, and order volume.

## Dashboard

A decision-focused **Power BI dashboard** can present the main findings using:

* **KPI cards:** Delivered Orders, On-Time Rate, Late Rate, Average Review Score
* **Line chart:** Monthly late-delivery rate
* **Bar chart:** Late-delivery rate by customer state
* **Bar chart:** Late-delivery rate by product category
* **Bar chart or table:** Seller late-order performance
* **Column chart:** Average review score by delivery-delay group
* **Filters:** Month, customer state, and product category

The dashboard should focus on the most important findings and support practical decision-making.

## Limitations

* ShipRight is a fictional scenario created for portfolio purposes.
* The Olist dataset is historical and observational.
* Customer review scores represent overall order satisfaction, not delivery satisfaction alone.
* Correlation does not prove causation.
* Customer state is used as the geographic comparison field.
* Category results may be influenced by differences in product mix.
* Seller results may be influenced by geography, product mix, and order volume.
* Small groups can produce unstable rates, so minimum-volume thresholds are used where appropriate.
* The analysis focuses on the variables needed to answer the five business questions rather than explaining every possible cause of delivery delays.

## Repository Structure

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
    ├── case_study.md
    ├── methodology.md
    └── data_dictionary.md
```

## Portfolio Skills Demonstrated

This project demonstrates practical skills in:

* Data cleaning and preparation
* Data quality assessment
* Relational data joins
* KPI development
* Exploratory data analysis
* Statistical analysis and correlation
* Data visualization
* SQL querying
* Power BI dashboard development
* Business-focused analysis
* Evidence-based recommendations
* GitHub documentation
* Communicating technical findings to a non-technical audience

## Conclusion

The analysis shows that delivery performance varies across the marketplace and that longer delivery delays are associated with lower customer review scores.

The strongest practical opportunities are to monitor high-risk geographic areas, investigate seller-level exceptions, and track delivery performance alongside customer satisfaction.

These findings provide a data-driven starting point for further operational investigation while avoiding unsupported claims about causation.

## Disclaimer

This project was created as a portfolio case study for learning and demonstration purposes.

**ShipRight is fictional. The underlying Olist dataset is real and publicly available. The findings presented in this repository are based on analysis of that public dataset and should not be interpreted as actual performance information for ShipRight or Olist.**
