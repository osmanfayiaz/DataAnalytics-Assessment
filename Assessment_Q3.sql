/* Question 3 Account Inactivity Alert  */
SELECT 
    p.id AS plan_id,
    p.owner_id,
    CASE 
        WHEN p.plan_type_id IN (1, 4) THEN 'Savings'
        ELSE 'Investment'
    END AS type,
    MAX(COALESCE(p.last_charge_date, p.created_on)) AS last_transaction_date,
    DATEDIFF(CURRENT_DATE, MAX(COALESCE(p.last_charge_date, p.created_on))) AS inactivity_days
FROM 
    plans_plan p
WHERE 
    p.is_deleted = 0 
    AND p.is_archived = 0
    AND DATEDIFF(CURRENT_DATE, COALESCE(p.last_charge_date, p.created_on)) > 365
GROUP BY 
    p.id, p.owner_id, p.plan_type_id
ORDER BY 
    inactivity_days DESC;
