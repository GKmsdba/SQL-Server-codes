
-- Create a multi-statement Table Value UDF

CREATE FUNCTION dbo.LotsOfPeople()
RETURNS @ManyPeople TABLE
	(
		PersonID int,
		FullName nVarchar(101),
		PhoneNumber nVarchar(25)
	)
AS
BEGIN
	INSERT INTO @ManyPeople VALUES(1, 'Puneet Chugh', '999-888-7777')
	INSERT INTO @ManyPeople VALUES(2, 'Patrick Kroll', '555-333-1111')
	INSERT INTO @ManyPeople VALUES(3, 'Peter Baig', '111-222-3333')
	
	RETURN
END

SELECT *
FROM dbo.LotsOfPeople()