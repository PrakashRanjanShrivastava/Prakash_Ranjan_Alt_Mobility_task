# Prakash_Ranjan_Alt_Mobility_task
# 🧠 ALT Mobility Case Study – Data Analyst Project

This case study analyzes sales, customer behavior, and payment patterns for ALT Mobility, an EV leasing company. The objective is to derive key business insights and improve customer retention and revenue.

---

## 📦 Project Structure

- **SQL/** – All raw queries used for analysis.
- **PowerBI/** – Power BI dashboard and data files.
- **Reports/** – PDF summary reports with insights and recommendations.

 
**Data Description**

  -There is two datasets/:

customer_orders.csv 

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Data/payments.csv">payments.csv</a>


Fields: order_id, customer_id, order_date, order_amount, shipping_address, order_status

payments.csv  

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Data/customer_orders.csv">customer_orders.csv</a>

Fields: payment_id, order_id, payment_date, payment_amount, payment_method, payment_status


---



## 📊 Tools Used

- **SQL Server**
- **Power BI**
- **Excel / CSV**

---


 

## SQL Code For Analysing the data 

ALL SQL QUERIES

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/_SQL_QURIES.pdf">ALL_SQL_QUERIES</a>

***1. Order and Sales Analysis***

--- KPIs:

Total number of orders

Order status distribution (pending, shipped, delivered)

Total revenue (SUM(order_amount))

Revenue by order status

Monthly revenue trend

Highest order amount


**Order and Sales Analysis**

SQL QUERIES

 <a href ="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/orders-sales-analysis.sql">Orders_Sales.sql</a>
 

**2. Customer Analysis***

 KPIs:
 
Total unique customers

Repeat customers

Avg. order per customer

Order frequency trend by customer

Customer lifetime value (CLV proxy)

 

 **Customer Analysis**
 
SQL QUERIES
 
 <a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/customer_analysis.sql">Customer_Analysis.sql</a>
 

**3.Payment Status Analysis**
   
 KPIs:
 
Payment status distribution (completed, pending, failed)

Payment method performance

Failure rate by method

Total paid vs unpaid orders

**--Payment Status Analysis**

 SQL QUERIES
 
 <a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/payment_analysis.sql">Payments_Status.sql</a>
 

***4. Order Details Report***

SQL QUERIES
  
  <a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/order_details_report.sql">Order_Details.sql</a>
 


 
 ***Comprehensive order report***

   Table File

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Data/Combined_Order_Payment_Report_Table.csv">Comprehensive order payment report</a>


 ## Customer Retention Analysis:

 GOAL:-

 Track how many customers:

Placed their first order in Month X

Returned and placed additional orders in subsequent months

**SQL Query to Extract Cohort Retention Data:**

 <a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/SQL-Queries/retention_analysis.sql">Customer_Retention_Analysis.sql</a>
 

Quesry Rseult - 

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Alt_Mobility_/blob/main/Cohort%20Retention.csv">veiw cohort retentaion table </a>


**Visualize in Power BI**





 ![Customer_retention](https://github.com/user-attachments/assets/a8b39bfc-1538-4c75-aca7-5f74092d461b)





 

**DashBoard**

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Data_Visualization_Power%20BI/Customer_retention.pbit">Power_BI_Dashboard</a>
 

 ## 🔍 Analysis and Insights Summary

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

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Reports/Recommendation">Recommendations</a>


## Report

<a href="https://github.com/PrakashRanjanShrivastava/Prakash_Ranjan_Alt_Mobility_task/blob/main/Reports/Final_Report_Alt_Mobility.pdf">Final_Report.pdf</a>

## 🔗 Author

**Prakash Ranjan**  
[LinkedIn](https://www.linkedin.com/in/prakash-ranjan22)  
[GitHub](https://github.com/PrakashRanjanShrivastava)






 












