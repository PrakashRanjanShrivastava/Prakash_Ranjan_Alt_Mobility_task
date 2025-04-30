 
--Payment Status Analysis
--🔹 Payment Summary
 
SELECT 
    payment_status,
    COUNT(*) AS transaction_count,
    SUM(payment_amount) AS total_amount
FROM payments
GROUP BY payment_status;

----Insight:
--~33% each for completed, pending, and failed.

--🔹 Payment Failure Rate by Method
 
SELECT 
    payment_method,
    SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) AS failed_txn,
    COUNT(*) AS total_txn,
    ROUND(100.0 * SUM(CASE WHEN payment_status = 'failed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS failure_rate_pct
FROM payments
GROUP BY payment_method;

--Insight:
--All payment methods have ≈33% failure rate.
