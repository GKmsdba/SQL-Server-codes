

-- Demonstrate the use of Views 
-- A view is a persistent object that fetches the data in real time.

CREATE VIEW vProducts
WITH SCHEMABINDING
AS 
	SELECT ProductID,
		   [Name],
		   ListPrice
	FROM Production.Product


DROP VIEW vProducts

-- Fetching data using View

SELECT * FROM vProducts

SELECT * FROM Production.ProductInventory

-- View that includes a join statement

CREATE VIEW vProductInventory
AS 
	SELECT p.ProductID,
		   p.[Name],
		   COUNT([pi].Quantity) AS 'Total Quantity'
	FROM Production.Product p
	LEFT OUTER JOIN Production.ProductInventory [pi]
	ON p.ProductID = [pi].ProductID 
	WHERE [pi].ProductID IS NOT NULL
	GROUP BY p.ProductID, p.[Name]
	--ORDER BY p.ProductID   : 'ORDER BY' is invalid in a View in objects that are created in memory

DROP VIEW vProductInventory

SELECT * FROM vProductInventory


CREATE TABLE tabProducts
(
	ProductID INT PRIMARY KEY,
	Productname VARCHAR(20)
)

CREATE TABLE tabProductInventory
(
	ProdID INT FOREIGN KEY (ProdID) REFERENCES tabProducts(ProductID),
	ProductInventory INT
)

INSERT INTO tabProducts VALUES(1,'Oil')
INSERT INTO tabProducts VALUES(2,'Fruits')
INSERT INTO tabProducts VALUES(3,'Vegetables')
INSERT INTO tabProducts VALUES(4,'Moisturising cream')
INSERT INTO tabProducts VALUES(5,'Bread')
INSERT INTO tabProducts VALUES(6,'Water')

INSERT INTO tabProductInventory VALUES(1, 10)
INSERT INTO tabProductINVENTORY VALUES(1, 20)
INSERT INTO tabProductINVENTORY VALUES(2, 20)
INSERT INTO tabProductINVENTORY VALUES(6, 60)
INSERT INTO tabProductINVENTORY VALUES(5, 20)

SELECT * FROM tabProducts
SELECT * FROM tabProductInventory

-- CREATE A VIEW TO INSERT DATA INTO TABLE

-- Cannot use SCHEMABINDING on a view that joins two tables.

CREATE VIEW vInsertData
AS
	SELECT p.ProductID, p.Productname, [pi].ProdID, [pi].ProductInventory 
	FROM tabProducts p
	LEFT OUTER JOIN tabProductInventory [pi]
	ON p.ProductID = [pi].ProdID
	WHERE [pi].ProdID IS NOT NULL

SELECT * FROM vInsertData

-- You can update one table through a view but not multiple tables
INSERT INTO vInsertData(ProductID, ProductName) VALUES(10, 'Fish')

-- This statement won't execute because View cannot update more than one base tables
INSERT INTO vInsertData(ProductID, ProductName, ProdID, ProductInventory) VALUES(20, 'Ice-Cream', 20, 100)

-- Similarly, DELETE won't execute because its trying to delete the records from 2 base tables.
-- Its not possible to update two base tables from Views
DELETE FROM vInsertData
WHERE ProductID = 1

DROP TABLE tabProducts
DROP TABLE tabProductInventory
DROP VIEW vInsertData

-- Indexed view -- Prequisite is View should be SCHEMABINDED
-- Views can only be indexed if the they bring data back from only one table.

CREATE UNIQUE CLUSTERED INDEX clus_index on vProductInventory(ProductID)

CREATE UNIQUE CLUSTERED INDEX clus_index on vProducts(ProductID)
