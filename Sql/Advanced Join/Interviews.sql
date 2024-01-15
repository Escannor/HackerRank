SELECT
    Contests.contest_id,
    Contests.hacker_id,
    Contests.name,
    SUM(total_submissions) AS total_submissions,
    SUM(total_accepted_submissions) AS total_accepted_submissions,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS total_unique_views
FROM
    Contests
    LEFT JOIN Colleges ON Colleges.contest_id = Contests.contest_id
    LEFT JOIN Challenges ON Challenges.college_id = Colleges.college_id
    LEFT JOIN (
        SELECT
            challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM
            View_Stats
        GROUP BY
            challenge_id
    ) Views ON Views.challenge_id = Challenges.challenge_id
    LEFT JOIN (
        SELECT
            challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM
            Submission_Stats
        GROUP BY
            challenge_id
    ) Submissions ON Submissions.challenge_id = Challenges.challenge_id
GROUP BY
    Contests.contest_id,
    Contests.hacker_id,
    Contests.name
HAVING
    (
        total_views + total_unique_views + total_submissions + total_accepted_submissions
    ) > 0
ORDER BY
    Contests.contest_id;