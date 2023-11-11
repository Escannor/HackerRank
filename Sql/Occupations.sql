SELECT  
    MAX(CASE WHEN OCCUPATION = "DOCTOR" THEN NAME END),
    MAX(CASE WHEN OCCUPATION = "PROFESSOR" THEN NAME END),
    MAX(CASE WHEN OCCUPATION = "SINGER" THEN NAME END),
    MAX(CASE WHEN OCCUPATION = "ACTOR" THEN NAME END) 
FROM 
    (SELECT NAME, OCCUPATION, 
     ROW_NUMBER() 
     OVER(
     PARTITION BY OCCUPATION 
     ORDER BY NAME
     ) AS RNK
     FROM OCCUPATIONS
    )
AS TABLE_WITH_RANKS
GROUP BY RNK;