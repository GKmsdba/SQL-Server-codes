
-- DEMONSTRATION OF AGGREGATE FUNCTIONS

-- Find out how much a SalesOrder Revenue is more/less than average SalesOrder Revenue
-- for every SalesOrderDetailID

SELECT * FROM Sales.SalesOrderDetail

WITH CTE_AvgRevCal
AS(
	SELECT SalesOrderID,SUM(LineTotal) 'Total Revenue', 
						AVG(LineTotal) 'Average Revenue',
						COUNT(LineTotal) 'Number Of Sales Order',
						MIN(Linetotal) 'Minimum Sales Order',
						MAX(LineTotal) 'Maximum Sales Order'
	FROM Sales.SalesOrderDetail
	GROUP BY SalesOrderID
) 
SELECT soh.SalesOrderDetailID, soh.LineTotal - cte.[Average Revenue] 'Variance'
FROM CTE_AvgRevCal cte
LEFT OUTER JOIN Sales.SalesOrderDetail soh
ON cte.SalesOrderID = soh.SalesOrderID

