SELECT
    SUM(CITY.POPULATION)
FROM CITY
LEFT JOIN COUNTRY 
    ON COUNTRY.CODE = CITY.COUNTRYCODE
WHERE COUNTRY.CONTINENT = 'Asia';