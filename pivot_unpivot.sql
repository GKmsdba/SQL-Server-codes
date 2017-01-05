
-- It uses AdventureWorks Database to perform the following commands
-- It will display the Average List Price 
-- of Product 707, 708, 711

Select * 
from Production.Product

SELECT *
FROM PRODUCTION.PRODUCTLISTPRICEHISTORY

SELECT 'Average List Price' AS ProductId,
	[707] AS 'PRODUCT 707',
	[708] AS 'PRODUCT 708',
	[711] AS 'PRODUCT 711'
FROM(
	SELECT productid, listprice
	FROM production.productlistpricehistory
)AS SOURCETABLE
PIVOT(
	AVG(listprice) 
	FOR 
	productid IN ([707],[708],[711])
)AS PIVOTTABLE