SELECT
    N
    , CASE WHEN BST.P IS NULL THEN 'Root'
        WHEN B2.P IS NOT NULL THEN 'Inner'
        ELSE 'Leaf'
    END AS NODE
FROM BST
LEFT JOIN 
    (SELECT P
     FROM BST
     GROUP BY 1) AS B2
ON BST.N = B2.P
ORDER BY N
;