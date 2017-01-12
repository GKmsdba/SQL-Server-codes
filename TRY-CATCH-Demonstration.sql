
-- Demonstrate the use of TRY-CATCH Block

DECLARE @DBID INT
SET @DBID = DB_ID();

DECLARE @DBNAME NVARCHAR(128);
SET @DBNAME = DB_NAME();

BEGIN TRY
	BEGIN TRANSACTION MY_TRAN

	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(31, 20, 'New Department 100', 'Mr Suranjan Mukesh')

	BEGIN TRANSACTION MY_TRAN_INTERNAL

	DELETE FROM Production.Product WHERE ProductID = 777
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(103, 20, 'New Department 201', 'Mr Yukti Mukharjee')

	
	INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(97, 20, 'New Department 105', 'Mr Ankan Chaudhary')
	
	COMMIT TRANSACTION

COMMIT TRANSACTION
END TRY

BEGIN CATCH

	RAISERROR
    (N'The current database ID is:%d, the database name is: %s.',
    16, -- Severity.
    1, -- State.
	@DBID, -- First substitution argument.
    @DBNAME); -- Second substitution argument.);
	THROW
	
	SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;   
	
	IF XACT_STATE() = -1
	BEGIN 
		ROLLBACK TRAN
	END
	COMMIT TRANSACTION
END CATCH