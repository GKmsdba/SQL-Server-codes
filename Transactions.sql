

-- If SET XACT_ABORT ON is run before starting a transaction, then the whole transaction will rollback 
-- if there's an runtime error 
SET XACT_ABORT ON

BEGIN TRANSACTION 

	SELECT ProductID FROM Production.Product WHERE ProductID BETWEEN 10 AND 300
	DELETE FROM Production.Product WHERE ProductID = 777
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(66, 20, 'Engineering', 'Ms Tanya Knox')
COMMIT TRANSACTION

SET XACT_ABORT OFF


BEGIN TRANSACTION MY_TRAN

	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(79, 20, 'New Department 1', 'Ms Ananya Bansal')

	SAVE TRAN MY_TRAN_INTERMEDIATE

	DELETE FROM Production.Product WHERE ProductID = 777
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(68, 20, 'New Department 2', 'Ms Rashi Chauhan')
	
	ROLLBACK TRAN MY_TRAN_INTERMEDIATE
COMMIT TRANSACTION

SET XACT_ABORT OFF

SELECT * FROM Departments

-- You can rollback to a Savepoint but you cannot rollback to the start of transaction.

BEGIN TRANSACTION MY_TRAN

	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(110, 20, 'New Department 44', 'Mr Suranjan Mukesh')

	BEGIN TRANSACTION MY_TRAN_INTERNAL

	DELETE FROM Production.Product WHERE ProductID = 777
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(103, 20, 'New Department 40', 'Mr Yukti Mukharjee')

	ROLLBACK TRANSACTION 
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(99, 20, 'New Department 20', 'Mr Ankan Chaudhary')
	
	COMMIT TRANSACTION

COMMIT TRANSACTION