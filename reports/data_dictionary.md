# Data Dictionary

| Field | Meaning | Used for |
|---|---|---|
| order_id | Unique order identifier | Joins and order-level analysis |
| customer_id | Customer record identifier | Joining customer state |
| order_purchase_timestamp | Order purchase timestamp | Time analysis |
| order_delivered_customer_date | Actual customer delivery timestamp | Delivery performance |
| order_estimated_delivery_date | Estimated delivery date | Delivery performance |
| delay_days | Actual date minus estimated date, in calendar days | Delay KPI |
| on_time | True when delay_days <= 0 | On-time KPI |
| customer_state | Customer Brazilian state | Geographic analysis |
| seller_id | Seller identifier | Seller analysis |
| product_id | Product identifier | Product/category join |
| category | English category where translated, otherwise original category; Unknown when missing | Category analysis |
| review_score | Order review score from 1 to 5; multiple reviews aggregated by mean | Satisfaction analysis |
