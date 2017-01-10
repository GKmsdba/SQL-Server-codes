
-- All these queries would only work on AdventureWorks Database

-- Demonstrate the use of Common Table Expression
-- Find variance of ListPrice of every occurence of Product from average List Price of itself

SELECT * FROM HumanResources.Employee

SELECT * FROM HumanResources.EmployeePayHistory

WITH CTE_ListPrice(ProdID, AvgListPrice) 
AS(
	SELECT ProductID, AVG(ListPrice)
	FROM Production.ProductListPriceHistory p
	GROUP BY ProductID
  )

SELECT p.ProductID, p.ListPrice - cte.AvgListPrice AS Variance
FROM Production.ProductListPriceHistory p
LEFT OUTER JOIN CTE_ListPrice cte
ON p.ProductID = cte.ProdID

