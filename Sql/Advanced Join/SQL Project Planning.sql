WITH
    INIT_DATE AS (
        SELECT
            P1.Task_ID,
            P1.Start_Date
        FROM
            PROJECTS AS P1
            LEFT JOIN PROJECTS AS P2 ON P1.Start_Date = P2.End_Date
        WHERE
            P2.Task_ID IS NULL
    ),
    END_DATE AS (
        SELECT
            P1.Task_ID,
            P1.End_Date
        FROM
            PROJECTS AS P1
            LEFT JOIN PROJECTS AS P2 ON P1.End_Date = P2.Start_Date
        WHERE
            P2.Task_ID IS NULL
    )
SELECT
    INIT_DATE.Start_Date,
    END_DATE.End_Date
FROM
    INIT_DATE
    LEFT JOIN END_DATE ON END_DATE.End_Date = (
        SELECT
            MIN(End_Date)
        FROM
            END_DATE
        WHERE
            End_Date >= INIT_DATE.Start_Date
    )
ORDER BY
    DATEDIFF (END_DATE.End_Date, INIT_DATE.Start_Date) ASC,
    INIT_DATE.Start_Date ASC;