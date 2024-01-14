WITH
    subtable AS (
        SELECT
            t1.name,
            t1.ID,
            p1.Salary AS Salary,
            t2.Friend_ID,
            p2.Salary AS Friend_salary
        FROM
            Students AS t1
            LEFT JOIN Friends AS t2 ON t2.ID = t1.ID
            LEFT JOIN Packages AS p1 ON p1.ID = t1.ID
            LEFT JOIN Packages AS p2 ON p2.ID = Friend_ID
    )
SELECT
    name
FROM
    subtable
WHERE
    Friend_salary > Salary
ORDER BY
    Friend_salary ASC;