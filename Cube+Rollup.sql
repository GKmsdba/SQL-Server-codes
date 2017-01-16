-- Demonstrate the usage of cube

CREATE TABLE MY_TABLE
(
	RecordID INT,
	[Name] VARCHAR(20)
)

INSERT INTO MY_TABLE VALUES(1, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(11, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(2, 'Kevin Chugh')
INSERT INTO	MY_TABLE VALUES(3, 'Sahil Oberoi')
INSERT INTO MY_TABLE VALUES(4, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(10, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(41, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(2, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(11, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(1, 'Nishesh Mathur')
INSERT INTO MY_TABLE VALUES(1, 'Shivani Rana')
INSERT INTO MY_TABLE VALUES(16, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(14, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(12, 'Puneet Chugh')
INSERT INTO MY_TABLE VALUES(12, 'Raman Singh')
INSERT INTO MY_TABLE VALUES(41, 'Patrick Shah')

--CUBE will bring all following combinations:
-- RecordID, Name
-- RecordID
-- Name
-- ()
SELECT DISTINCT RecordID, [Name], COUNT(*) 
FROM MY_TABLE
GROUP BY RecordID, [Name]
WITH CUBE

-- ROLLUP will bring all the following combination:
-- RecordID, Name
-- RecordID
-- ()
SELECT DISTINCT RecordID, [Name], COUNT(*) 
FROM MY_TABLE
GROUP BY RecordID, [Name]
WITH ROLLUP

