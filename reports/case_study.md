# On Time, On Point: Analyzing Delivery Performance and Customer Satisfaction in E-Commerce

## Executive Summary

This case study analyzes delivery performance and customer satisfaction using the Brazilian E-Commerce Public Dataset by Olist. The fictional company **ShipRight** is used only as a portfolio scenario; the underlying dataset is real and publicly available.

Among 96,476 delivered orders, 93.2% were delivered on or before the estimated delivery date, while 6.8% were delivered late. The average delivery variance was -11.9 days, meaning orders were delivered earlier than their estimated dates on average. Because an average can hide differences between individual orders, the on-time and late-delivery rates provide a clearer view of delivery performance.

Delivery delay had a negative relationship with customer review scores. The Pearson correlation was **-0.267**, indicating that longer delivery delays were associated with lower review scores in this dataset. This is an association and does not prove that delivery delays caused lower review scores.

The analysis also identified differences in delivery performance across customer states, product categories, sellers, and time periods. Because some orders contain multiple sellers or products, unique order-seller and order-category pairs were used where appropriate to reduce duplicate counting.

---

## 1. Ask

### Business Problem

ShipRight needs to understand where delivery performance is weakest and whether delivery delays are associated with customer satisfaction. Without this information, the company may invest in operational improvements without knowing where they are most needed.

### Business Objective

Identify geographic, seller, category, and time-based patterns in delivery performance and measure the relationship between delivery delay and customer review scores.

### Stakeholders

- **VP of Operations** — responsible for operational improvement decisions
- **Logistics/Fulfillment Team** — responsible for investigating and improving delivery performance
- **Customer Experience Team** — monitors customer satisfaction and reviews

### Target Audience

The primary audience is operations leadership and logistics managers. The analysis therefore focuses on clear metrics, visualizations, and practical recommendations rather than technical details alone.

### Key Business Questions

1. Which customer states have the highest late-delivery rates?
2. Is delivery delay associated with customer review scores?
3. Do product categories differ in delivery performance?
4. Are late deliveries concentrated among a small number of sellers?
5. How does delivery performance change over time?

---

## 2. Prepare

### Dataset

This project uses the **Brazilian E-Commerce Public Dataset by Olist**, a publicly available dataset containing information about orders, customers, sellers, products, reviews, payments, and other aspects of e-commerce activity.

**Dataset source:** [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### Tools

- **Python** — data preparation, cleaning, transformation, and analysis
- **SQL** — querying and aggregation
- **CSV** — analysis-ready data files
- **GitHub** — project documentation and portfolio presentation

### Relevant Data Tables

- **Orders** — order status, purchase date, estimated delivery date, and actual customer delivery date
- **Customers** — customer location, including state
- **Order Items** — seller and product relationships
- **Products** — product categories and product information
- **Sellers** — seller information
- **Reviews** — customer review scores
- **Category Translation** — English translations for product category names where available

### Data Quality Observations

The raw dataset contains several data-quality considerations:

- The Orders table contains **99,441 rows**, including **2,965 missing customer-delivery dates**.
- The Products table contains **610 missing category names**.
- The Reviews table contains **87,656 missing review titles** and **58,247 missing review messages**. These text fields are not required for the core analysis.
- The Geolocation table contains **261,831 duplicate rows**. This table is not required to answer the core business questions and was therefore excluded from the core analysis.
- No negative prices or freight values were found in the Order Items data.
- Four product records contain non-positive weight values. Product weight and dimensions are not required for the core analysis, so these fields were not used.

### Relationship Considerations

The dataset contains relationships that require careful handling during analysis.

There are **1,278 orders with more than one seller**. Therefore, seller analysis uses unique order-seller pairs rather than treating every item row as a separate seller event.

There are also **547 orders with multiple review rows**. For the delay-to-review analysis, review scores are aggregated to one mean score per order.

---

## 3. Process

### Data Cleaning and Transformation

The following steps were used to prepare the data for analysis:

1. Convert relevant order date columns to datetime format.
2. Restrict delivery-performance analysis to orders with an actual customer-delivery date.
3. Calculate `delay_days` as the difference between the actual delivery date and estimated delivery date in calendar days.
4. Define an order as **on time** when `delay_days <= 0`.
5. Aggregate multiple review records to one mean review score per order.
6. Create unique order-category pairs to reduce repeated-item weighting in category analysis.
7. Create unique order-seller pairs for seller-level analysis.
8. Keep missing category values as `Unknown` rather than assigning an unsupported category, and flag them when interpreting category-specific results.
9. Exclude the Geolocation table from the core analysis because it is not required to answer the business questions.

These steps were designed to reduce duplicate counting and make the analysis consistent with the structure of the source data.

---

## 4. Analyze

### Overall Delivery Performance

| Metric | Result |
|---|---:|
| Total orders | 99,441 |
| Delivered orders analyzed | 96,476 |
| On-time delivery rate | 93.2% |
| Late-delivery rate | 6.8% |
| Average delivery variance | -11.9 days |
| Median delivery variance | -12 days |
| Delivered orders with review | 95,830 |
| Average review score | 4.16 / 5 |
| Pearson delay/review correlation | -0.267 |
| Spearman delay/review correlation | -0.176 |

The average delivery variance was **-11.9 days**, meaning orders were delivered earlier than their estimated dates on average. Since averages can hide variation between individual orders, the on-time and late-delivery rates are used as the primary operational measures.

### Finding 1 — Delivery Performance Differs Across States

Among customer states with at least 100 delivered orders, **Alagoas (AL)** had the highest late-delivery rate at **21.4%**, followed by **Maranhão (MA)** at **17.4%** and **Sergipe (SE)** at **15.2%**.

These results identify states that may deserve further operational investigation. They do not, by themselves, identify the causes of the delays.

### Finding 2 — Longer Delays Are Associated With Lower Review Scores

The Pearson correlation between delivery delay and review score was **-0.267**, while the Spearman correlation was **-0.176**.

| Delivery status | Average review score |
|---|---:|
| On time / early | 4.29 |
| 1–3 days late | 3.29 |
| 4–7 days late | 2.11 |
| 8–14 days late | 1.67 |
| 15+ days late | 1.73 |

Review scores were generally lower as delivery delays increased. This indicates a negative relationship between delivery delay and customer review scores in the dataset. However, the analysis is observational and does not establish that delivery delay alone caused lower review scores.

### Finding 3 — Category Differences Are Smaller Than Some Geographic Differences

Using unique order-category pairs and focusing on categories with at least 500 pairs, **Office Furniture** had an **8.1%** late-delivery rate and **Baby** had an **8.0%** late-delivery rate.

Several high-volume categories were close to the overall late-delivery rate. Category differences therefore provide useful information for prioritization, but they should be considered alongside geographic and seller-level patterns.

### Finding 4 — Late Deliveries Are Distributed Across Sellers

Using unique order-seller pairs, the **top 10 sellers by late-order count accounted for approximately 16.0% of late order-seller pairs**.

This suggests that late deliveries are not limited to a very small group of sellers. However, individual high-volume sellers may still be useful targets for further operational investigation.

### Finding 5 — Delivery Performance Fluctuates Over Time

Monthly delivery performance fluctuates rather than showing a consistent improvement or decline throughout the period.

Late-delivery rates were notably higher during parts of late 2017 and early 2018, including **November 2017, February 2018, and March 2018**.

The earliest months contain very small order volumes, so they should not be treated as strong evidence of a long-term trend.

---

## 5. Share

### Portfolio Dashboard

The findings can be presented through a focused dashboard titled:

**Delivery Performance & Customer Satisfaction**

Recommended visualizations include:

- **KPI cards:** Delivered Orders, On-Time Rate, Late Rate, Average Review Score
- **Line chart:** Monthly late-delivery rate
- **Bar chart:** Late-delivery rate by customer state
- **Bar chart:** Late-delivery rate by product category
- **Bar chart or table:** Sellers with the highest number of late orders
- **Column chart:** Average review score by delivery-delay group
- **Slicers:** Month, customer state, and product category

The dashboard should focus on the findings that support business decisions and avoid unnecessary fields.

---

## 6. Act

### Recommendation 1 — Investigate High-Risk States

Operations teams should investigate states with consistently high late-delivery rates and sufficient order volume, beginning with **AL, MA, and SE**.

The investigation could examine carrier coverage, fulfillment handoffs, and the accuracy of estimated delivery dates before broader operational changes are considered.

### Recommendation 2 — Monitor Delivery Performance Alongside Customer Satisfaction

Because longer delivery delays are associated with lower review scores, ShipRight should monitor delivery performance and customer satisfaction together.

Tracking these measures side by side can help identify potential customer-experience risks and prioritize further investigation.

### Recommendation 3 — Create Seller-Level Exception Monitoring

Seller-level reporting can help identify high-volume sellers with unusually high late-delivery rates.

The goal should be targeted investigation and operational support rather than automatic penalties, because seller performance may also reflect differences in geography, product mix, and other factors not captured in this analysis.

---

## Limitations

- The **ShipRight** company scenario is fictional and is used only to frame the public Olist dataset as a portfolio case study.
- Customer review scores represent overall order satisfaction and are not specifically limited to delivery satisfaction.
- The analysis identifies associations but cannot prove that delivery delays cause lower review scores.
- Customer state is used as the geographic comparison field and does not represent a custom logistics region.
- Category analysis uses order-category pairs and may still reflect differences in product mix.
- Seller analysis uses unique order-seller pairs because some orders contain multiple sellers.
- Very small state, category, and seller groups can produce unstable rates, so minimum-volume thresholds are used where appropriate.
- The analysis focuses on the variables needed to answer the five business questions and does not attempt to explain every possible cause of delivery delays.

---

## Conclusion

The analysis shows that delivery performance varies across the marketplace and that longer delivery delays are associated with lower customer review scores.

The strongest practical opportunities are to monitor high-risk geographic areas, investigate seller-level exceptions, and track delivery performance alongside customer satisfaction.

These findings provide a data-driven starting point for further operational investigation while avoiding unsupported claims about causation. The same analytical framework could be extended with additional data to investigate carrier performance, product characteristics, or other factors that may contribute to delivery delays.
