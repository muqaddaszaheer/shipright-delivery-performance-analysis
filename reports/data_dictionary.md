# Data Dictionary

| Field | Meaning | Used for |
|---|---|---|
| `order_id` | Unique identifier for an order | Joins and order-level analysis |
| `customer_id` | Unique identifier for a customer record | Joining customer information |
| `order_purchase_timestamp` | Date and time when the order was placed | Time-based analysis |
| `order_delivered_customer_date` | Date and time when the order was delivered to the customer | Delivery performance analysis |
| `order_estimated_delivery_date` | Estimated delivery date for the order | Delivery performance analysis |
| `delay_days` | Difference between the actual delivery date and estimated delivery date, measured in calendar days | Delay and delivery-status analysis |
| `on_time` | Indicates whether an order was delivered on or before the estimated date (`delay_days <= 0`) | On-time delivery KPI |
| `customer_state` | Brazilian state associated with the customer | Geographic analysis |
| `seller_id` | Unique identifier for a seller | Seller-level analysis |
| `product_id` | Unique identifier for a product | Product and category joins |
| `category` | English product category where a translation is available; otherwise the original category name. Missing categories are labeled `Unknown` | Category analysis |
| `review_score` | Customer review score from 1 to 5; multiple reviews for an order are aggregated using the mean | Customer satisfaction analysis |
