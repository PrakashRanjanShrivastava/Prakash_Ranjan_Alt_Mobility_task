# Prakash_Ranjan_Alt_Mobility_task
# 🧠 ALT Mobility Case Study – Data Analyst Project

This case study analyzes sales, customer behavior, and payment patterns for ALT Mobility, an EV leasing company. The objective is to derive key business insights and improve customer retention and revenue.

---

## 📦 Project Structure

- **SQL/** – All raw queries used for analysis.
- **PowerBI/** – Power BI dashboard and data files.
- **Reports/** – PDF summary reports with insights and recommendations.

 
**Data Description**

  There is two datasets:

customer_orders.csv (visualized as customer_order.png)

Fields: order_id, customer_id, order_date, order_amount, shipping_address, order_status

payments.csv (visualized as payments.png)

Fields: payment_id, order_id, payment_date, payment_amount, payment_method, payment_status


---



## 📊 Tools Used

- **SQL Server**
- **Power BI**
- **Excel / CSV**

---


 

## SQL Code For Analysing the data 

*** 1. Order and Sales Analysis***

--- KPIs:

Total number of orders

Order status distribution (pending, shipped, delivered)

Total revenue (SUM(order_amount))

Revenue by order status

Monthly revenue trend

Highest order amount

 

**Order and Sales Analysis**

-----Total Order and Total Revenue 


 Total odres 15000 and Total revnue  -3808899.1915102**

-- Order status distribution


Almost Equal amount of distribution in order satuts .i.e almost 33% and around  5000 order count , althogu shipped order cunt little  .i.e 4874**
 

---- Monthly Revenue Trend

 
There is no such change or trend in montly sales , or sale in year , there is almost same around 210-240 order each mnoth every year**


--- Highest Order Amount

 
The  highest order amount is 499.9**

--  Average order value by status


Same  average for all order status** 

**2. Customer Analysis***

 KPIs:
 
Total unique customers

Repeat customers

Avg. order per customer

Order frequency trend by customer

Customer lifetime value (CLV proxy)

 

 **Customer Analysis**

----Total and Unique Customers

 

There are almost 7334 customers** 

--  Customer order frequency

 
The most  no of order repeated is 8**

--  Repeat customers (customers with >1 order)
 

There are 4402 repeated customer out of 7334 customer  , Means good customer retention.***


-----Average Orders per Customer
 
AVG orders per customer is 2**


--  Time between orders for repeat customers

 
 Average  time between order repeated is 479** 

 
-----Monthly Unique Customers

 
Around 220-240 unique customer each month each year**

 
There is less frequent coustomer .i.e. 816 than there is  one time (2932) and Occasional customers (3586)*******

**Payment Status Analysis**
   
 KPIs:
 
Payment status distribution (completed, pending, failed)

Payment method performance

Failure rate by method

Total paid vs unpaid orders

 
 
 **Payment Status Analysis**
 
----Payment Status Summary


Around same distribution of payment status (pending failed completed) .i.e 33% or  5000  transactional _count ******

***Payment Method vs Status***
 

For every payemnt method and every payment stauts the count is in b/w 1650-1750**

----- Payment Failure Rate by Method

 Almost same failure reate for every Payment method .i.e almost 33%**

--  Orders with payment issues
 

 There is around  5500  orders with missing  payments or null value**
 

***Delivered Orders with Failed Payments****

 
 There is around 1650 delivered orders with failed payment*** 

***4. Order Details Report***

  
  
Full view of orders with payment

 

 SQL Queries:

 ----Combined Order-Payment Report

SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_amount,
    o.order_status,
    p.payment_id,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    p.payment_status
    
FROM customer_orders o

LEFT JOIN payments p ON o.order_id = p.order_id;

 
 ***-- 4 Comprehensive order report***

 
SELECT 

    co.order_id, co.customer_id,
    co.order_date,
    co.order_amount,
    co.order_status,
    co.shipping_address,
    p.payment_id,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    p.payment_status,
    
    CASE 
    
        WHEN p.payment_status = 'completed' AND p.payment_amount >= co.order_amount THEN 'Fully Paid'
        
        WHEN p.payment_status = 'completed' AND p.payment_amount < co.order_amount THEN 'Partially Paid'
        
        WHEN p.payment_status = 'failed' THEN 'Payment Failed'
        
        WHEN p.payment_id IS NULL THEN 'No Payment Record'
        
        ELSE 'Payment Pending'
        
    END AS payment_summary
    
FROM customer_orders co

LEFT JOIN payments p ON co.order_id = p.order_id

ORDER BY co.order_date DESC;`

<a href = " ">Comprehensive order report</a>


 ## Customer Retention Analysis:

 GOAL:-

 Track how many customers:

Placed their first order in Month X

Returned and placed additional orders in subsequent months

**SQL Query to Extract Cohort Retention Data:**

Identify cohort month (first purchase month for each customer)

WITH cohort AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(MIN(order_date)), MONTH(MIN(order_date)), 1) AS cohort_month
    FROM customer_orders
    GROUP BY customer_id
),

--  Get all order months for every order

orders_by_month AS (
    SELECT 
        customer_id,
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS order_month
    FROM customer_orders
),

--  Join to match cohort month and all order months for each customer

cohort_analysis AS (
    SELECT 
        c.customer_id,
        c.cohort_month,
        o.order_month
    FROM cohort c
    JOIN orders_by_month o ON c.customer_id = o.customer_id
)

-- Count how many customers from each cohort ordered in subsequent months

SELECT 
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_id) AS retained_customers
FROM cohort_analysis
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;

Quesry Rseult - 

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Alt_Mobility_/blob/main/Cohort%20Retention.csv">veiw cohort retentaion table </a>


**Visualize in Power BI**





 ![Customer_retention](https://github.com/user-attachments/assets/a8b39bfc-1538-4c75-aca7-5f74092d461b)


 




 

**DashBoard**

 

 ## 🔍 Analysis Summary

### 1. Order & Sales Analysis
- Steady monthly sales (210–240 orders/month)
- Balanced status distribution: pending/shipped/delivered
- Max order value: $499.90

### 2. Customer Insights
- 60% repeat customer rate
- Avg. 479 days between orders
- Segments: One-time (40%), Occasional (49%), Frequent (11%)

### 3. Payment Insights
- 33% failure rate across all methods
- 5,500 missing payments
- 1,650 delivered orders unpaid

### 4. Retention Insights (Power BI)
- Retention Rate: **61.41%**
- Drop-off sharp after first month
- Cohorts from 2020 retained better than newer cohorts

---

## 📈 Recommendations

- Recover unpaid orders (1,650)
- Reduce payment failure via retry logic
- Launch loyalty + reactivation campaigns
- Improve order status resolution workflows


## 🔗 Author

**Prakash Ranjan**  
[LinkedIn](https://www.linkedin.com/in/prakash-ranjan22)  
[GitHub](https://github.com/PrakashRanjanShrivastava)






 












