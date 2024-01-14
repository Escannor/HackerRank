WITH Subtable AS (SELECT
    ROW_NUMBER() OVER (ORDER BY X, Y) AS id,
    *
FROM
    Functions)
SELECT
    DISTINCT t1.X,
    t1.Y
FROM
    Subtable AS t1
    LEFT JOIN Subtable AS t2 ON t1.X = t2.Y
    AND t1.Y = t2.X
    AND t1.id != t2.id
WHERE
    t2.X IS NOT NULL
    AND t2.Y IS NOT NULL
    AND t1.X <= t1.Y
ORDER BY
    t1.X;