
-- UNION will only bring distinct items
SELECT TOP 10 ProductID FROM Production.Product
UNION
SELECT TOP 10 ProductID FROM Production.ProductListPriceHistory

-- UNION ALL will bring all the 10 items from the first query and 10 items from the second query
-- irrespective of if they are distinct or not.
SELECT TOP 10 ProductID FROM Production.Product
UNION ALL
SELECT TOP 10 ProductID FROM Production.ProductListPriceHistory
