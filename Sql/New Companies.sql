SELECT 
    E.company_code
    , MIN(C.founder)
    , COUNT(DISTINCT lead_manager_code)
    , COUNT(DISTINCT senior_manager_code)
    , COUNT(DISTINCT manager_code)
    , COUNT(DISTINCT employee_code)
FROM Employee E
LEFT JOIN Company C
    USING(company_code)
GROUP BY company_code;