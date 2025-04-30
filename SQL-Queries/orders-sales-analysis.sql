--Order and Sales Analysis
--🔹 Total Orders and Revenue
 
SELECT 
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM customer_orders;


--/-Insight:
--There are 14,668 total orders, with a significant total revenue (amount hidden in the dataset).

--🔹 Order Status Distribution
sql
Copy
Edit
SELECT 
    order_status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage,
    SUM(order_amount) AS total_amount
FROM customer_orders
GROUP BY order_status
ORDER BY order_count DESC;
  
Insight:

--Orders are almost evenly distributed across statuses:

--Shipped: 4,897 (33.39%)

--Delivered: 4,874 (33.24%)

--Pending: 4,897 (33.39%)

--🔹 Monthly Revenue Trend
 
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS order_count,
    SUM(order_amount) AS total_sales
FROM customer_orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

Insight:
--Order volumes per month are consistently between 210-240 with no clear growth trend.

--🔹 Highest Order Amount
 
SELECT TOP 1 WITH TIES
    order_id,
    customer_id,
    order_amount
FROM customer_orders
ORDER BY order_amount DESC;

--Insight:
--Highest order amount is $499.90.

--🔹 Average Order Value by Status
 
SELECT 
    order_status,
    AVG(order_amount) AS avg_order_value,
    MIN(order_amount) AS min_order_value,
    MAX(order_amount) AS max_order_value
FROM customer_orders
GROUP BY order_status;
--Insight:
--Order values are fairly consistent across statuses.
