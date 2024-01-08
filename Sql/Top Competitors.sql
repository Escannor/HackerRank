SELECT
    HA.hacker_id
    , HA.name
FROM SUBMISSIONS SU
LEFT JOIN CHALLENGES CH
    ON CH.challenge_id = SU.challenge_id
LEFT JOIN DIFFICULTY DI
    ON DI.difficulty_level = CH.difficulty_level
LEFT JOIN HACKERS HA
    ON HA.hacker_id = SU.hacker_id
WHERE SU.score = DI.score
GROUP BY HA.hacker_id, HA.name
HAVING COUNT(HA.hacker_id)>1
ORDER BY COUNT(HA.hacker_id) DESC, HA.hacker_id ASC;