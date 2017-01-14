

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

ALTER TABLE tabProductInventory ADD CONSTRAINT FK_ProdID FOREIGN KEY(ProdID) REFERENCES tabProducts(ProductID)

-- This trigger would run after Insert in table 'tabProductInventory'
-- But before committing of the transaction

CREATE TRIGGER tr_INSERT ON tabProductInventory 
AFTER INSERT
AS
BEGIN
	DECLARE @ProductID INT;
	SELECT @ProductID = ProdID FROM INSERTED
	--SET @ProductID = SELECT ProdID FROM INSERTED

	IF(@ProductID IS NOT NULL)
	BEGIN
		IF NOT EXISTS (SELECT * FROM tabProducts WHERE ProductID = @ProductID )
		BEGIN
			INSERT INTO tabProducts(ProductID) VALUES(@ProductID)
		END
		
	END
END

DECLARE @PRODuCTID INT 
SELECT @ProductID = ProductID FROM Production.Product

INSERT INTO tabProductInventory VALUES(100, 10)

SELECT * FROM tabProducts

-- This trigger would run after an Insert inserting a record on table 'tabProducts', 
-- But before committing of the transaction

CREATE TRIGGER tr_insert_prod
ON tabProductInventory
INSTEAD OF INSERT
AS
	DECLARE @ProductID INT
	SELECT @ProductID = ProdID FROM INSERTED
	
	IF NOT EXISTS (SELECT * FROM tabProducts WHERE ProductID = @ProductID) 
	BEGIN 
		INSERT INTO tabProducts(ProductID) VALUES(@ProductID)
	END
	INSERT INTO tabProductInventory VALUES(@ProductID, (SELECT ProductInventory FROM INSERTED))


INSERT INTO tabProductInventory VALUES(105, 70)

SELECT * FROM tabProducts
SELECT * FROM tabProductInventory