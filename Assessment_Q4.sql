WITH customer_stats AS (
    SELECT 
        p.owner_id AS customer_id,
        u.name,
        DATEDIFF(MONTH, MIN(p.created_on), CURRENT_DATE) AS tenure_months,
        COUNT(*) AS total_transactions,
        SUM(p.amount) AS total_amount
    FROM 
        plans_plan p
    JOIN 
        users_customuser u ON p.owner_id = u.id
    WHERE 
        p.is_deleted = 0
    GROUP BY 
        p.owner_id, u.name
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / tenure_months) * 12 * (total_amount / total_transactions * 0.001), 2) AS estimated_clv
FROM 
    customer_stats
WHERE 
    tenure_months > 0
ORDER BY 
    estimated_clv DESC;