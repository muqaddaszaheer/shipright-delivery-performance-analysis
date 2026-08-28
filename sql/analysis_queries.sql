-- ShipRight Capstone: core SQL analysis examples
-- Adapt table names to your SQL environment.

-- 1. Delivery delay and on-time flag
SELECT
  order_id,
  DATEDIFF(day, CAST(order_estimated_delivery_date AS date), CAST(order_delivered_customer_date AS date)) AS delay_days,
  CASE WHEN CAST(order_delivered_customer_date AS date) <= CAST(order_estimated_delivery_date AS date) THEN 1 ELSE 0 END AS on_time
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- 2. Overall on-time rate
SELECT
  AVG(CASE WHEN CAST(order_delivered_customer_date AS date) <= CAST(order_estimated_delivery_date AS date) THEN 1.0 ELSE 0.0 END) AS on_time_rate
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- 3. Delivery performance by customer state
SELECT
  c.customer_state,
  COUNT(*) AS delivered_orders,
  AVG(CASE WHEN CAST(o.order_delivered_customer_date AS date) <= CAST(o.order_estimated_delivery_date AS date) THEN 1.0 ELSE 0.0 END) AS on_time_rate
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY on_time_rate ASC;

-- 4. Product category performance
-- Use DISTINCT order_id + category before aggregation when an order has repeated items.
SELECT
  p.product_category_name,
  COUNT(DISTINCT oi.order_id) AS orders,
  AVG(CASE WHEN CAST(o.order_delivered_customer_date AS date) > CAST(o.order_estimated_delivery_date AS date) THEN 1.0 ELSE 0.0 END) AS late_rate
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT oi.order_id) >= 500
ORDER BY late_rate DESC;

-- 5. Seller performance
-- DISTINCT order_id + seller_id prevents repeated items from overweighting a seller.
SELECT
  oi.seller_id,
  COUNT(DISTINCT oi.order_id) AS orders,
  SUM(CASE WHEN CAST(o.order_delivered_customer_date AS date) > CAST(o.order_estimated_delivery_date AS date) THEN 1 ELSE 0 END) AS late_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY oi.seller_id
ORDER BY late_orders DESC;
