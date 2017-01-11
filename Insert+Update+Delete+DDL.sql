

CREATE TABLE Departments
(
	DeptID INT PRIMARY KEY,
	EmployeeCount INT,
	Responsibilities VARCHAR(100),
	Director VARCHAR(100)
)

INSERT INTO Departments(DeptID, EmployeeCount, Responsibilities, Director) VALUES(1, 100, 'Human Resources', 'Mr Nick Verma')
INSERT INTO Departments(DeptID, EmployeeCount, Responsibilities, Director) VALUES(2, 101, 'Marketing', 'Mr Sachin Juneja')
INSERT INTO Departments(DeptID, EmployeeCount, Responsibilities, Director) VALUES(3, 103, 'IT', 'Ms Sunidhi Khan')
INSERT INTO Departments(DeptID, EmployeeCount, Responsibilities, Director) VALUES(4, 104, 'People Relation', 'Mr Sandeep Patel')
INSERT INTO Departments(DeptID, EmployeeCount, Responsibilities, Director) VALUES(5, 105, 'Recreation', 'Mrs Ashwini Ravi')

SELECT * FROM Departments

DELETE FROM Departments

ALTER TABLE Departments ADD DepartmentName VARCHAR(100) NOT NULL 

ALTER TABLE Departments DROP COLUMN DepartmentName

ALTER TABLE Departments ADD CONSTRAINT DeptName_const_def DEFAULT '' FOR DepartmentName
ALTER TABLE Departments	ADD CONSTRAINT DeptName_const_check CHECK( DepartmentName IS NOT NULL) 
ALTER TABLE Departments	ADD CHECK (DepartmentName IS NOT NULL)
ALTER TABLE Departments DROP CONSTRAINT DeptName_const_def
ALTER TABLE Departments DROP CONSTRAINT CK__Departmen__Depar__15FA39EE

-- You cannot drop a column if the column has constraints

ALTER TABLE Departments DROP COLUMN DeptID

--Dropping Primary Key constraint before Dropping Column
ALTER TABLE Departments DROP CONSTRAINT PK__Departme__0148818E8BB6551B


ALTER TABLE Departments ADD DeptID INT

-- NOT NULL check on a table is applicable only if the table is empty.
ALTER TABLE Departments ADD CONSTRAINT check_not_null CHECK (DeptID IS NOT NULL)
ALTER TABLE Departments ADD PRIMARY KEY (DeptID)
UPDATE Departments 
SET DepartmentName = ''