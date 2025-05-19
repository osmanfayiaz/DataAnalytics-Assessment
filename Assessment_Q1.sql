/* Question 1 High-Value Customers with Multiple Products  */
SELECT 
    p.owner_id,
    u.name,
    SUM(CASE WHEN p.plan_type_id IN (1, 4) AND p.amount > 0 THEN 1 ELSE 0 END) AS savings_count, 
    SUM(CASE WHEN p.plan_type_id NOT IN (1, 4) AND p.amount > 0 THEN 1 ELSE 0 END) AS investment_count,
    SUM(p.amount) AS total_deposits
FROM 
    plans_plan p
JOIN 
    users_customuser u ON p.owner_id = u.id
WHERE 
    p.is_deleted = 0 AND p.is_archived = 0
GROUP BY 
    p.owner_id, u.name
HAVING 
    savings_count > 0 AND investment_count > 0
ORDER BY 
    total_deposits DESC;
