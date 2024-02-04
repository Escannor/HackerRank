WITH base AS (
    SELECT
        submission_date
        , hacker_id
        , COUNT(*) AS submissions
        , ROW_NUMBER() OVER (PARTITION BY hacker_id ORDER BY hacker_id, submission_date ASC) AS days_with_submissions
    FROM Submissions
    GROUP BY 
        submission_date
        , hacker_id
    ORDER BY hacker_id, submission_date DESC
),
maximun_submissions AS (
    SELECT
        submission_date
        , submissions
        , MIN(hacker_id) AS hacker_id
        , ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY submission_date, submissions DESC) AS row_number
    FROM base
    GROUP BY 
        submission_date
        , submissions 
    ORDER BY 1,2 DESC
),
days AS (
    SELECT
        submission_date
        , ROW_NUMBER() OVER (ORDER BY submission_date) AS days_elapsed
    FROM base
    GROUP BY submission_date
    ORDER BY submission_date
),
submissions_order AS (
    SELECT
        days.submission_date
        , SUM(CASE WHEN days.days_elapsed=base.days_with_submissions THEN 1 ELSE 0 END) AS active_participants
    FROM base
    LEFT JOIN days
        ON days.submission_date = base.submission_date
    GROUP BY days.submission_date
    ORDER BY 1
)
SELECT 
    so.submission_date
    , so.active_participants
    , ms.hacker_id
    , ha.name
FROM submissions_order so
LEFT JOIN maximun_submissions ms
    ON ms.submission_date = so.submission_date
LEFT JOIN Hackers ha
    ON ha.hacker_id = ms.hacker_id
WHERE ms.row_number = 1
ORDER BY 1;