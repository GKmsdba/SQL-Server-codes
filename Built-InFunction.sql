
-- All these queries are applicable only to AdventureWorks Database

-- CHARINDEX
-- PATINDEX
-- STUFF
-- REPLACE


SELECT CHARINDEX('Puneet', 'Puneet Chugh The Great')

SELECT PATINDEX('%hu', 'Puneet Chugh the Great. Puneet is the greatest.')

SELECT STUFF('Puneet Chugh the Great.', 1, 12, 'Raghav')

SELECT REPLACE('Puneet Chugh the Great', '%pune%', 'Raghav')

SELECT 'gur'+ CAST((CAST(RIGHT('gur32562', 5) AS INT)+2) AS VARCHAR(10))


-- Use of LEFT, RIGHT function, CAST.
-- You are given a string 'gur32562'. Increment the integer part by two and display the entire string

DECLARE @MY_STRING VARCHAR(20)
SET @MY_STRING = 'gur32562'

DECLARE @CHAR VARCHAR(10) 
SET @CHAR = LEFT(@My_STRING, 3)
DECLARE @INT INT
SET @INT = CAST(RIGHT(@MY_STRING, 5) AS INT)

SET @MY_STRING = @CHAR + CAST( (@INT+2) AS VARCHAR(10))
SELECT @MY_STRING