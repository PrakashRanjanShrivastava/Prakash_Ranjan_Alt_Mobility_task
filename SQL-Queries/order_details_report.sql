---Order Details Report
--🔹 Missing Payments
 
SELECT COUNT(*)  
FROM customer_orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

--Insight:
--5,500 orders have missing payment data.

--🔹 Delivered But Failed Payments
 
SELECT COUNT(*) 
FROM customer_orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered' AND p.payment_status = 'failed';


--Insight:
--1,650 delivered orders had failed payments.

--🔹 Full Order-Payment Report

 
SELECT 
    co.order_id,
    co.customer_id,
    co.order_date,
    co.order_amount,
    co.order_status,
    p.payment_status,
    p.payment_amount,
    CASE 
        WHEN p.payment_status = 'completed' AND p.payment_amount >= co.order_amount THEN 'Fully Paid'
        WHEN p.payment_status = 'completed' AND p.payment_amount < co.order_amount THEN 'Partially Paid'
        WHEN p.payment_status = 'failed' THEN 'Payment Failed'
        WHEN p.payment_id IS NULL THEN 'No Payment Record'
        ELSE 'Payment Pending'
    END AS payment_summary
FROM customer_orders co
LEFT JOIN payments p ON co.order_id = p.order_id
ORDER BY co.order_date DESC;
