/* Question 2 Transaction Frequency Analysis  */
WITH monthly_transactions AS (
    SELECT 
        owner_id,
        COUNT(*) AS transaction_count,
        DATEDIFF(MONTH, MIN(created_on), MAX(created_on)) + 1 AS months_active
    FROM 
        plans_plan
    WHERE 
        is_deleted = 0
    GROUP BY 
        owner_id
),
frequency_metrics AS (
    SELECT 
        owner_id,
        transaction_count / months_active AS avg_transactions_per_month,
        CASE 
            WHEN transaction_count / months_active >= 10 THEN 'High Frequency'
            WHEN transaction_count / months_active >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category
    FROM 
        monthly_transactions
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 1) AS avg_transactions_per_month
FROM 
    frequency_metrics
GROUP BY 
    frequency_category
ORDER BY 
    customer_count DESC;
