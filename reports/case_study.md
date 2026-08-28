# On Time, On Point: Delivery Performance and Customer Satisfaction in E-Commerce

## Executive summary
This case study examines delivery performance in a large public Brazilian e-commerce dataset and explores how delivery delays are associated with customer review scores. The fictional company **ShipRight** is used only as a portfolio scenario; the underlying data is real and publicly available.

Among 96,476 delivered orders, 93.2% were delivered on or before the estimated date and 6.8% were late. Average delivery variance was -11.9 days, meaning orders were early on average; therefore, the on-time/late rate is used as the clearest operational KPI. Delivery delay showed a negative Pearson correlation with review score (r = -0.267), indicating that longer delays were associated with lower reviews in this dataset. This is an association, not proof of causation.

The analysis also found that late deliveries were not evenly distributed across customer states or sellers. For state comparisons, only states with at least 100 delivered orders were used to reduce instability from very small samples. Seller analysis uses unique order-seller pairs because some orders contain multiple sellers.

## 1. Ask
### Business problem
ShipRight needs to understand where delivery performance is weakest and whether delivery delays are associated with customer satisfaction, so operations leaders can prioritize improvement work.

### Objective
Identify geographic, seller, category, and time-based patterns in delivery performance and measure the association between delivery delay and customer review scores.

### Stakeholders
- VP of Operations
- Logistics/Fulfillment Team
- Customer Experience Team

### Key questions
1. Which customer states have the highest late-delivery rates?
2. Is delivery delay associated with customer review scores?
3. Do product categories differ in delivery performance?
4. Are late deliveries concentrated among a small number of sellers?
5. How does delivery performance change over time?

## 2. Prepare
### Dataset
The project uses the **Brazilian E-Commerce Public Dataset by Olist**, a public dataset containing orders, customers, sellers, products, order items, reviews, payments, and geolocation information.

Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### Relevant tables
- Orders: order dates, status, estimated delivery, actual customer delivery
- Customers: customer state
- Order items: seller and product relationships
- Products: product category
- Sellers: seller information
- Reviews: review score
- Category translation: English category labels where available

### Data quality observations
- Orders: 99,441 rows; 2,965 missing customer-delivery dates.
- Products: 610 missing category names.
- Reviews: 87,656 missing review titles and 58,247 missing review messages; these text fields are not required for the core analysis.
- Geolocation contains 261,831 duplicate rows; it is not required for the core analysis and was not used.
- No negative prices or freight values were found in the order-items data.
- Four product rows contain non-positive weight values; product dimensions are not required for the core analysis, so these fields were not used.

### Relationship considerations
There are 1,278 orders with more than one seller. Seller analysis therefore uses unique order-seller pairs rather than treating every item row as a separate seller event. There are also 547 orders with multiple review rows; reviews are aggregated to one mean score per order before the delay-to-review analysis.

## 3. Process
### Cleaning and transformation rules
1. Convert relevant order date columns to datetime.
2. Restrict delivery-performance analysis to orders with an actual customer-delivery date.
3. Calculate `delay_days = actual_delivery_date - estimated_delivery_date` in calendar days.
4. Define `on_time = delay_days <= 0`.
5. Aggregate multiple review records to one mean review score per order.
6. For category analysis, create unique order-category pairs to avoid repeated item rows within the same order.
7. For seller analysis, create unique order-seller pairs.
8. Keep missing category as `Unknown` rather than inventing a category; exclude/flag it when interpreting category-specific results.
9. Do not use nonessential geolocation duplicates in the core analysis.

## 4. Analyze
### Overall delivery performance
| Metric | Result |
|---|---:|
| Total orders | 99,441 |
| Delivered orders analyzed | 96,476 |
| On-time rate | 93.2% |
| Late-delivery rate | 6.8% |
| Average delivery variance | -11.9 days |
| Median delivery variance | -12 days |
| Delivered orders with review | 95,830 |
| Average review score | 4.16/5 |
| Pearson delay/review correlation | -0.267 |
| Spearman delay/review correlation | -0.176 |

### Finding 1 — Geographic differences
Among states with at least 100 delivered orders, **Alagoas (AL)** had the highest late-delivery rate at **21.4%**, followed by **Maranhão (MA) at 17.4%** and **Sergipe (SE) at 15.2%**. These figures identify where operations teams could investigate first; they do not by themselves identify the cause.

### Finding 2 — Delivery delays and satisfaction move in opposite directions
The Pearson correlation between delivery delay and average order review score was **-0.267** (Spearman **-0.176**). Orders delivered on time or early had an average review score of **4.29**, compared with **3.29** for orders 1–3 days late, **2.11** for orders 4–7 days late, **1.67** for orders 8–14 days late, and **1.73** for orders 15+ days late. This is a clear association in the dataset, but it does not establish that delivery delay alone caused the lower scores.

### Finding 3 — Category differences are smaller than geographic/satisfaction differences
Using unique order-category pairs and focusing on categories with at least 500 pairs, **office furniture** had an 8.1% late-delivery rate and **baby** had an 8.0% rate. Several high-volume categories were close to the overall late rate. Category patterns therefore look useful for prioritization, but they should be interpreted alongside seller and geographic effects.

### Finding 4 — Late deliveries are spread across sellers, with some concentration
Using unique order-seller pairs, the top 10 sellers by late-order count accounted for about **16.0%** of late order-seller pairs. This suggests the problem is not limited to a tiny handful of sellers, although individual high-volume sellers can still be useful targets for operational review.

### Finding 5 — Performance fluctuates over time
Monthly performance varies considerably rather than following a simple steadily improving or worsening pattern. Late-delivery rates were notably higher in parts of late 2017 and early 2018, including November 2017, February 2018, and March 2018. The earliest months have very small order volumes and should not be used as strong trend evidence.

## 5. Share
### Recommended dashboard
Create a one-page Power BI dashboard titled **“Delivery Performance & Customer Satisfaction”**.

Recommended components:
- KPI cards: Delivered Orders, On-Time Rate, Late Rate, Average Review Score
- Line chart: Monthly late-delivery rate
- Bar chart: Late-delivery rate by customer state
- Bar chart: Late-delivery rate by category (minimum-volume filter)
- Bar chart/table: Top sellers by late-order count
- Column chart: Average review score by delay bucket
- Slicers: Month, customer state, category

Keep the dashboard focused on decisions rather than displaying every available field.

## 6. Act
### Recommendation 1 — Investigate high-risk states first
Operations should investigate states with consistently high late-delivery rates and adequate order volume, beginning with AL, MA, and SE. Review carrier coverage, fulfillment handoffs, and delivery-estimate accuracy in those markets before making network-wide changes.

### Recommendation 2 — Use delay monitoring as a customer-experience signal
Because late delivery is associated with lower review scores, ShipRight should monitor late-delivery rate alongside customer satisfaction rather than treating logistics and customer experience as separate problems.

### Recommendation 3 — Create seller-level exception monitoring
Use seller performance to identify high-volume sellers with unusually high late rates. The goal should be targeted operational support or investigation, not automatic punishment, because seller performance can also reflect geography, product mix, and other factors not captured here.

## Limitations
- The fictional ShipRight scenario is not a real company; it is used to frame the public Olist data as a portfolio case study.
- Review scores measure overall order satisfaction, not delivery satisfaction alone.
- Observational data cannot prove that delivery delay causes lower review scores.
- Customer state is used as the geographic comparison field; it is not a custom logistics-region variable.
- Category analysis is based on order-category pairs and may still reflect differences in product mix.
- Seller analysis uses order-seller pairs because multi-seller orders exist.
- Very small state/category/seller groups can produce unstable rates, so minimum-volume thresholds are used where appropriate.

## Conclusion
The analysis shows that delivery performance varies meaningfully across the marketplace and that longer delivery delays are associated with lower customer review scores. The strongest practical opportunity is to combine geographic monitoring, seller-level exception reporting, and customer-satisfaction tracking. The results provide a focused starting point for operational investigation while avoiding unsupported claims about causation.
