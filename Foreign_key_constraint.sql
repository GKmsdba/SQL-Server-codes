-- It demonstrates the concept of Foreign Key 
-- Implementation of CASCADE in Child Table


CREATE TABLE Department(

	DeptID INT PRIMARY KEY,
	DeptName VARCHAR(50),
	DeptManager VARCHAR(50),
	EmpCount INT 
)

INSERT INTO Department(DeptId, DeptName, DeptManager, EmpCount) VALUES(1, 'Sales', 'Puneet Chugh', 50)
INSERT INTO Department(DeptId, DeptName, DeptManager, EmpCount) VALUES(2, 'Sales', 'Kamran Baig', 500)
INSERT INTO Department(DeptId, DeptName, DeptManager, EmpCount) VALUES(3, 'Sales', 'Sandeep', 300)
INSERT INTO Department(DeptId, DeptName, DeptManager, EmpCount) VALUES(4, 'Sales', 'Sagar Deo', 400)
INSERT INTO Department(DeptId, DeptName, DeptManager, EmpCount) VALUES(5, 'Sales', 'Sonia ', 450)

DROP TABLE Employee

CREATE TABLE Employee(
	
	DeptID INT FOREIGN KEY REFERENCES Department(DeptID),
	EmpID INT,
	EmpName VARCHAR(50),
	EmpAddress VARCHAR(50) 
)


ALTER TABLE Employee ALTER COLUMN EmpID INT NOT NULL
ALTER TABLE Employee ADD CONSTRAINT PK_EmpID PRIMARY KEY(EmpID)


INSERT INTO Employee(DeptID, EmpID, EmpName, EmpAddress) VALUES(1, 241, 'Amanjot', 'Paramus')
INSERT INTO Employee(DeptID, EmpID, EmpName, EmpAddress) VALUES(1, 221, 'Sandeep Randhawa', 'Jersery City')
INSERT INTO Employee(DeptID, EmpID, EmpName, EmpAddress) VALUES(2, 450, 'Shruti', 'NYC')
INSERT INTO Employee(DeptID, EmpID, EmpName, EmpAddress) VALUES(2, 410, 'Sharmila', 'NYC')
INSERT INTO Employee(DeptID, EmpID, EmpName, EmpAddress) VALUES(3, 400, 'Tanya', 'NYC')


SELECT *
FROM Employee

SELECT *
FROM Department

DELETE FROM Department 
WHERE DeptID = 3

UPDATE Department
SET DeptName = 'HR'
WHERE DeptID = 2

ALTER TABLE Employee 
ADD CONSTRAINT FK_CONSTRAINT_DeptID FOREIGN KEY(DeptID) REFERENCES Department(DeptID) ON DELETE CASCADE

ALTER TABLE Employee 
ADD CONSTRAINT FK_CONST_DeptID FOREIGN KEY(DeptID) REFERENCES Department(DeptID) ON UPDATE CASCADE

SELECT *
FROM Employee
WHERE DeptID = 1

DELETE FROM Department 
WHERE DeptID = 1

UPDATE Department
SET DeptID = 88
WHERE DeptManager = 'Kamran Baig'

CREATE TABLE EMPLOYEE_TABLE(
	
	EmpID INT FOREIGN KEY REFERENCES Department(DeptId)
)