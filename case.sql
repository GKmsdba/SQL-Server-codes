-- This code works on AdventureWorks Sample database

SELECT * 
FROM HumanResources.Employee

SELECT *
FROM Person.Contact

-- The two parameters

SELECT ContactID, FirstName+' '+COALESCE(MiddleName, ' ')+' '+LastName as FullName
FROM Person.Contact

-- [HumanResource].[EmployeePayHistory] table has some employees with PayFrequency as 1 and 
-- others as 2. If its 1, then double the PayRate and then if the PayRate is above 25, then print 'Above Average' against it
-- Otherwise, print 'Below Average' against it
SELECT *
FROM HumanResources.EmployeePayHistory

WITH cte_EmployeePayRate (EmployeeId, Pay)
AS(
	SELECT EmployeeID, PayRate = 
	CASE
		WHEN PayFrequency = 1 THEN (Rate*2)
		ELSE Rate
	END
FROM HumanResources.EmployeePayHistory
)

SELECT EmployeeId, Pay, Comment = 
CASE 
	WHEN Pay > 25.0 THEN 'Above Average'
	ELSE 'Below Average'
END
FROM cte_EmployeePayRate