SELECT
    C.hacker_id,
    H.name,
    COUNT(*)
FROM
    CHALLENGES C
    LEFT JOIN HACKERS H ON H.hacker_id = C.hacker_id
GROUP BY
    C.hacker_id,
    H.name
HAVING
    COUNT(*) IN (
        SELECT
            n_challenges
        FROM
            (
                SELECT
                    hacker_id,
                    COUNT(*) AS n_challenges
                FROM
                    CHALLENGES
                GROUP BY
                    hacker_id
            ) AS t
        GROUP BY
            n_challenges
        HAVING
            COUNT(*) = 1
    )
    OR COUNT(*) = (
        SELECT
            MAX(n_challenges)
        FROM
            (
                SELECT
                    hacker_id,
                    COUNT(*) AS n_challenges
                FROM
                    CHALLENGES
                GROUP BY
                    hacker_id
            ) AS t
    )
ORDER BY
    COUNT(*) DESC,
    C.hacker_id ASC;