
-- All these queries are only applicable to AdventureWords database
-- List all the products whose Price is more than the average Price
-- Use SubQuery

SELECT * FROM Production.ProductListPriceHistory

SELECT ProductID, ListPrice
FROM Production.ProductListPriceHistory
WHERE ListPrice > (SELECT AVG(ListPrice) AS 'Avg List Price'
				   FROM Production.ProductListPriceHistory)


-- Find the Average List Price of every Product.
-- Find out the Variance of List Price of each occurence of that product

SELECT ProductID, ListPrice - (SELECT AVG(p.ListPrice) 
					FROM Production.ProductListPriceHistory AS p 
					WHERE p.ProductID = ph.ProductID
					GROUP BY p.ProductID) AS Variance
FROM Production.ProductListPriceHistory ph

-- Find all the Employees and their Managers
-- Use co-related subquery - Every sub-query would use require outer query

SELECT emp.Title, emp.EmployeeID, emp.ManagerID 
FROM HumanResources.Employee emp
WHERE EXISTS(
				SELECT * 
				FROM HumanResources.Employee mngr
				WHERE mngr.EmployeeID = emp.ManagerID
			)



					