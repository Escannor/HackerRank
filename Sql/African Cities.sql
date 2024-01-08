SELECT
    C1.NAME
FROM CITY C1
LEFT JOIN COUNTRY C2
    ON C2.CODE = C1.COUNTRYCODE
WHERE C2.CONTINENT = 'Africa';