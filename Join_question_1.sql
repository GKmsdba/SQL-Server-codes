
-- All these queries work on AdventureWorks Database 
-- Select all Customers with their Sales information

SELECT * FROM Sales.Customer -- 19185

SELECT * FROM Sales.SalesTerritory

SELECT * FROM Sales.SalesOrderHeader

SELECT * 
FROM Sales.SalesOrderHeader soh
LEFT OUTER JOIN Sales.Customer c
ON soh.CustomerID = c.CustomerID
LEFT OUTER JOIN Sales.SalesTerritory st
ON c.TerritoryID = st.TerritoryID

-- Changing the order of tables in a JOIN on multiple tables doesn't 
-- make a difference.

SELECT * 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID
LEFT OUTER JOIN Sales.SalesTerritory st
ON c.TerritoryID = st.TerritoryID

-- List all the customers without sales in year 2012
 
SELECT DISTINCT c.CustomerID 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID AND soh.OrderDate BETWEEN '1/1/2002' AND '12/31/2002'
WHERE soh.SalesOrderID IS NOT NULL  -- 3094
 

SELECT DISTINCT c.CustomerID 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID AND soh.OrderDate BETWEEN '1/1/2002' AND '12/31/2002'
WHERE soh.SalesOrderID IS NULL  --16091

-- Wrong Implementation : Moving an argument from Join condition to where clause
-- This would rather bring back those customers that don't have a Sales Record and 
-- that had a sale in year in year '2002' 

SELECT DISTINCT c.CustomerID 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID 
WHERE soh.SalesOrderID IS NULL AND soh.OrderDate BETWEEN '1/1/2002' AND '12/31/2002'

-- Wrong implementation : Moving where clause argument to Join condition
-- The reason its wrong is because we are trying to look for null CustomerID in Sales Records from the join condition
-- Howerver, there cannot be null values in CustomerID field of Sales Records table as its the Foreign Key of the table
-- The correct implementation tries to find out null CustomerID in WHERE clause as WHERE executes after JOIN.
-- So, the unmatching records from the first table would have null against them from the second table.

SELECT DISTINCT c.CustomerID 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID AND soh.SalesOrderID IS NULL AND soh.OrderDate BETWEEN '1/1/2002' AND '12/31/2002'
 

-- Wrong implementation ??

SELECT DISTINCT c.CustomerID 
FROM  Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON soh.CustomerID = c.CustomerID AND YEAR(soh.OrderDate) != '2002'
WHERE soh.SalesOrderID IS NOT NULL
