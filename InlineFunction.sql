
-- Wrtie an Inline-Table Value Function that returns Person's Full Name, ContactID and Phone Number 
-- of all the People whose last name starts with a given alphabet.

CREATE FUNCTION dbo.PeopleInfo(@varLastName as nvarchar(90))
RETURNS TABLE
AS
RETURN
(
	SELECT ContactId, 
		   FirstName + LastName as FullName,
		   Phone
	FROM Person.Contact
	WHERE LastName Like(@varLastName+'%')
)

SELECT * 
FROM dbo.PeopleInfo('a')