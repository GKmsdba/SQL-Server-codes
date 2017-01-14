
SELECT ProductID, ListPrice,
	   --ROW_NUMBER() OVER(ORDER BY ListPrice) AS 'Row Number',
	   --RANK() OVER ( PARTITION BY ListPrice ORDER BY ProductID) AS 'Rank',
	   --DENSE_RANK() OVER (PARTITION BY ListPrice ORDER BY ProductID) AS 'Dense Rank'
	   NTILE(100) OVER (ORDER BY ListPrice)
FROM Production.Product

-- Find out the top SalesPerson from every Territory

SELECT * FROM Sales.SalesTerritory
SELECT * FROM Sales.SalesPerson

WITH CTE_SalesPersonRank AS
(
	SELECT  sp.SalesPersonID, sp.TerritoryID,
			st.[Name], st. [Group], sp.SalesYTD,
			ROW_NUMBER() OVER(PARTITION BY sp.TerritoryID ORDER BY sp.SalesYTD DESC) AS 'RANK'
	FROM Sales.SalesTerritory st
	JOIN Sales.SalesPerson sp
	ON st.TerritoryID = sp.TerritoryID
)
SELECT * 
FROM CTE_SalesPersonRank
WHERE [RANK] = 1


-- ISNULL() checks the first argument and
-- sets the value as the second parameter
SELECT ISNULL(Color, 'NO COLOR') 
FROM Production.Product

-- Compares the two arguments in NULLIF()
-- If they are equal, it produces NULL result
SELECT NULLIF(ProductID, ProductID)
FROM Production.Product 

SELECT ProductID, LAG(ProductID) OVER (ORDER BY ProductID) AS [Last Item],
	   LEAD(ProductID) OVER (ORDER BY ProductID) AS [Next Item]
FROM Production.Product