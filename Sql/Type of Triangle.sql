SELECT 
    A,B,C,
    CASE 
        WHEN ((A=B) AND (A=C)) THEN 'Equilateral'
        WHEN ((A+B<=C) OR (A+C<=B) OR (B+C<=A)) THEN 'Not A Triangle'  -- Less or equal
        WHEN ((A=B) OR (A=C) OR (B=C)) THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM TRIANGLES;


-- 10 10 10 Equilateral
-- 11 11 11 Equilateral
-- 30 32 30 Isosceles
-- 40 40 40 Equilateral
-- 20 20 21 Isosceles
-- 21 21 21 Equilateral
-- 20 22 21 Scalene
-- 20 20 40 Isosceles
-- 20 22 21 Scalene
-- 30 32 41 Scalene
-- 50 22 51 Scalene
-- 20 12 61 Not A Triangle
-- 20 22 50 Not A Triangle
-- 50 52 51 Scalene
-- 80 80 80 Equilateral