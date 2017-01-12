
-- Demonstrate the concept of Foreign Key. 
-- Also demonstrate the use of CASCADE to be used in Child Table

-- Parent Table
IF EXISTS(SELECT 1 FROM sys.Objects 
    WHERE  Object_id = OBJECT_ID(N'dbo.Departments') 
               AND Type = N'U')
BEGIN
   DROP TABLE Departments
END
CREATE TABLE Departments
(
	DeptID INT PRIMARY KEY,
	DeptName VARCHAR(100) NOT NULL,
	DeptDirector VARCHAR(100),
	DeptEmployeeCount INT NOT NULL,

)

ALTER TABLE Departments ADD CONSTRAINT unique_key UNIQUE(DeptName)
ALTER TABLE Departments ADD CONSTRAINT unique_key_comb UNIQUE(DeptID, DeptName)
-- Child Table
IF EXISTS(SELECT 1 FROM sys.Objects 
    WHERE  Object_id = OBJECT_ID(N'Employees') 
               AND Type = N'U')
BEGIN
   DROP TABLE Employees
END
CREATE TABLE Employees
(
	EmpID INT PRIMARY KEY,
	DeptID INT FOREIGN KEY(DeptID) REFERENCES Departments(DeptID),
	EmpName VARCHAR(100) NOT NULL,
	EmpSal MONEY NOT NULL
)

ALTER TABLE Employees ADD DeptName VARCHAR(100)
ALTER TABLE Employees ADD CONSTRAINT fk_constraint FOREIGN KEY(DeptName) REFERENCES Departments(DeptName)


ALTER TABLE Employees DROP CONSTRAINT fk_constraint
ALTER TABLE Employees DROP CONSTRAINT FK__Employees__DeptI__2BE97B0D

-- Adding composite foreign Key on two columns from the same Parent Table. 
-- The composite Foreign Key should also be either a composite Primary Key or Unique Key in the Parent Table.
-- In this case putting constraints separately on two columns in Parent Table wouldn't help
ALTER TABLE Employees ADD CONSTRAINT fk_constraint FOREIGN KEY(DeptID, DeptName) REFERENCES Departments(DeptID, DeptName)
ALTER TABLE Employees DROP CONSTRAINT fk_constraint

--ALTER TABLE Employees ADD CONSTRAINT fk_constraint_on_update FOREIGN KEY(DeptID) REFERENCES Departments(DeptID) ON DELETE CASCADE  ON UPDATE CASCADE
ALTER TABLE Employees ADD CONSTRAINT fk_constraint_on_update FOREIGN KEY(DeptID) REFERENCES Departments(DeptID) ON DELETE SET DEFAULT
ALTER TABLE Employees DROP CONSTRAINT fk_constraint_on_update

ALTER TABLE Employees ADD CONSTRAINT default_dept DEFAULT 100 FOR DeptID

INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(1, 100, 'Human Resources', 'Mr Nick Verma')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(2, 101, 'Marketing', 'Mr Sachin Juneja')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(3, 103, 'IT', 'Ms Sunidhi Khan')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(4, 104, 'People Relation', 'Mr Sandeep Patel')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(5, 105, 'Recreation', 'Mrs Ashwini Ravi')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(100, 0, 'Deleted Employees', 'None')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(35, 0, 'Consumer Support', 'Mr Ashutosh Phogat')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(50, 20, 'Help Desk', 'Mrs Sanjana Rana')
INSERT INTO Departments(DeptID, DeptEmployeeCount, DeptName, DeptDirector) VALUES(51, 20, 'Support', 'Ms Stuti Arora')

INSERT INTO Employees(EmpID, DeptID, DeptName, EmpName, EmpSal) VALUES(27, 1, 'Human Resources', 'Puneet Chugh', 50)
INSERT INTO Employees(EmpID, DeptID, DeptName, EmpName, EmpSal) VALUES(38, 2, 'Marketing', 'Kaku Chugh', 60)
INSERT INTO Employees(EmpID, DeptID, DeptName, EmpName, EmpSal) VALUES(98, 1, 'Human Resources', 'Kaku Chugh', 70)
INSERT INTO Employees(EmpID, DeptID, DeptName, EmpName, EmpSal) VALUES(78, 2, 'Marketing', 'Shiv Chugh', 65)
INSERT INTO Employees(EmpID, DeptID, DeptName, EmpName, EmpSal) VALUES(68, 10, 'Marketing', 'Shiv Chugh', 65)

SELECT * FROM Departments
SELECT * FROM Employees

DELETE FROM Departments
WHERE DeptID = '2'

UPDATE Departments
SET DeptID = 22
WHERE DeptID = '1'

ALTER TABLE Departments ADD SerialNumber INT IDENTITY(0, 2)

DBCC CHECKIDENT (Departments, reseed, 34)
