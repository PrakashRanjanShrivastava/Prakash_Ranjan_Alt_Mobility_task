---Customer Retention Cohort Analysis
 
WITH cohort AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(MIN(order_date)), MONTH(MIN(order_date)), 1) AS cohort_month
    FROM customer_orders
    GROUP BY customer_id
),
orders_by_month AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS order_month
    FROM customer_orders
),
cohort_analysis AS (
    SELECT 
        c.customer_id,
        c.cohort_month,
        o.order_month
    FROM cohort c
    JOIN orders_by_month o ON c.customer_id = o.customer_id
)
SELECT 
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM cohort_analysis
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;
