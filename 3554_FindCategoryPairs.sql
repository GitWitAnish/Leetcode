SELECT
    cp.category1,
    cp.category2,
    COUNT(DISTINCT cp.user_id) AS customer_count
FROM (
    SELECT 
        uc1.user_id,
        uc1.category AS category1,
        uc2.category AS category2
    FROM (
        SELECT DISTINCT
            pp.user_id,
            pi.category
        FROM ProductPurchases pp
        JOIN ProductInfo pi
            ON pp.product_id = pi.product_id
    ) AS uc1
    JOIN (
        SELECT DISTINCT
            pp.user_id,
            pi.category
        FROM ProductPurchases pp
        JOIN ProductInfo pi
            ON pp.product_id = pi.product_id
    ) AS uc2
    ON uc1.user_id = uc2.user_id AND uc1.category < uc2.category
) AS cp
GROUP BY cp.category1, cp.category2
HAVING COUNT(DISTINCT cp.user_id) >= 3
ORDER BY customer_count DESC, category1 ASC, category2 ASC;
