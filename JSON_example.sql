
-- All these queries are applicable to AdventureWorks Database
-- Demonstrate 

SELECT FirstName AS 'Person.FirstName', LastName AS 'Person.LastName'
FROM Person.Contact
FOR JSON PATH, ROOT('Names')



SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.EmployeePayHistory

-- Given below is an example to convert JSON data to table format. JSON string was obtained as the result of example after this.
DECLARE @jsonObject nVARCHAR(1000)
SET @jsonObject = N'{"Employees":[{"IndividualEmployee":{"EmployeeID":2,"LoginID":"adventure-works\\kevin0","Title":"Marketing Assistant","Gender":"M","PayHistory":[{"Rate":13.4615,"RateChangeDate":"1997-02-26T00:00:00","PayFrequency":2}]}}]}"'

SELECT *  
FROM OPENJSON(@jsonObject, '$.Employees')
WITH(
		EmplID INT '$.IndividualEmployee.EmployeeID',
		LoginID VARCHAR(100) '$.IndividualEmployee.LoginID',
		Title VARCHAR(100) '$.IndividualEmployee.Title',
		Gender CHAR(1) '$.IndividualEmployee.Gender',
		PayHistory VARCHAR(100) '$.IndividualEmployee.PayHistory'
	)


-- This example shows how to convert table data into JSON format

SELECT e.EmployeeID AS 'IndividualEmployee.EmployeeID',
	   e.LoginID AS 'IndividualEmployee.LoginID',
	   e.Title AS 'IndividualEmployee.Title',
	   e.Gender AS 'IndividualEmployee.Gender',
	   (
			SELECT h.Rate AS 'Rate',
				   h.RateChangedate AS 'RateChangeDate',
				   h.PayFrequency AS 'PayFrequency'
			FROM HumanResources.EmployeePayHistory h
			WHERE h.EmployeeID = e.EmployeeID 
			FOR JSON PATH
	   ) AS 'IndividualEmployee.PayHistory'
FROM HumanResources.Employee e
WHERE e.EmployeeID = 2
FOR JSON PATH, ROOT('Employees')

ALTER DATABASE [AdventureWorks] SET COMPATIBILITY_LEVEL = 130

DECLARE @json VARCHAR(1000)
set @json =   
N'{  
     "path": {  
           "to":{  
                "sub-object":["en-GB", "en-UK","de-AT","es-AR","sr-Cyrl"]  
                }  
             }  
}';  
  
SELECT [key], value  
FROM OPENJSON( @json, '$.path.to."sub-object"') 
