SELECT
    HA.hacker_id,
    name,
    SUM(score) AS total_score
FROM
    HACKERS AS HA
    LEFT JOIN (
        SELECT
            hacker_id,
            challenge_id,
            MAX(score) AS score
        FROM
            SUBMISSIONS
        GROUP BY
            hacker_id,
            challenge_id
    ) AS SU ON SU.hacker_id = HA.hacker_id
GROUP BY
    hacker_id,
    name
HAVING
    total_score > 0
ORDER BY
    total_score DESC,
    hacker_id ASC;