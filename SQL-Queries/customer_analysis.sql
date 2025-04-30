--Customer Analysis
--🔹 Total and Unique Customers
 
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_orders;

--Insight:
--7,334 unique customers.

--🔹 Repeat Customers
 
SELECT 
    COUNT(*) AS repeat_customer_count
FROM (
    SELECT customer_id
    FROM customer_orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS repeat_customers;

--Insight:
--4,402 repeat customers (≈60% retention rate).

--🔹 Customer Segmentation
 
WITH cust_orders AS (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM customer_orders
    GROUP BY customer_id
),
segmented AS (
    SELECT 
        CASE 
            WHEN order_count = 1 THEN 'One-time'
            WHEN order_count BETWEEN 2 AND 3 THEN 'Occasional'
            ELSE 'Frequent'
        END AS segment
    FROM cust_orders
)
SELECT segment, COUNT(*) AS customer_count
FROM segmented
GROUP BY segment;

--Insight:

--One-time: 2,932

--Occasional: 3,586

--Frequent: 816

--🔹 Avg Orders per Customer
 
SELECT 
    AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_order_counts;

--Insight:
--Average orders per customer ≈ 2.

--🔹 Avg Time Between Orders
 
WITH customer_orders_ranked AS (
    SELECT 
        customer_id,
        order_date,
        LEAD(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_date
    FROM customer_orders
)
SELECT 
    AVG(DATEDIFF(day, order_date, next_order_date)) AS Avg_days_between_orders
FROM customer_orders_ranked
WHERE next_order_date IS NOT NULL;

--Insight:
--Average time between orders = 479 days.
