CREATE DATABASE TASK1;
USE TASK1;

CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Department VARCHAR(30),
Salary DECIMAL(10,2));

INSERT INTO  Employee VALUES
(1,'Gokul','Das','IT',700000),
(2,'Akhil','Philip','Finance',500000),
(3,'Sangeeth','Kumar','HR',600000);

-- QUERY TO PRINT ALL DATA
SELECT *FROM Employee;

-- QUERY TO SELECT A COLUMN
SELECT Department FROM Employee;

-- QUERY TO FILTER WITH WHERE RESULT
SELECT * FROM Employee WHERE Salary>500000;

-- WHAT IS THE PURPOSE OF THE 'IDENTITY' KEYWORD IN THE CREATE TABLE STATEMENT?
-- IDENTITY Keyword can be used to auto-increment in a column mainly PRIMARY KEY.

-- QUERY TO SELECT FirstName and Salary ONLY
SELECT Firstname,Salary FROM Employee;

-- HOW WOULD YOU MODIFY THE EXISTING UPDATE STATEMENT TO GIVE ALL EMPLOYEES IN THE IT DEPARTMENT A 10% RAISE
UPDATE Employee
SET Salary = Salary * 1.10
WHERE Department = 'IT';

-- WRITE A SELECT STATEMENT TO FIND THE HIGHEST SALARY IN THE EMPLOYEES TABLE.
SELECT MAX(Salary) as HighestSalary
FROM Employee;

-- HOW WOULD YOU ADD A NEW COLUMN NAMED "HIREDATE" OF TYPE DATE TO THE EMPLOYEES TABLE?
ALTER TABLE Employee
ADD HireDate DATE;

-- WRITE AN INSERT STATEMENT TO ADD A NEW EMPLOYEE NAMED “SARAH BROWN” IN THE “MARKETING” DEPARTMENT WITH A SALARY OF 72000.00.
INSERT INTO Employee (EmployeeId,FirstName, LastName, Department, Salary) 
VALUES (4,'Sarah', 'Brown', 'Marketing', 72000.00);

-- HOW WOULD YOU MODIFY THE TABLE TO ENSURE THAT THE SALARY COLUMN CANNOT CONTAIN NEGATIVE VALUES?
ALTER TABLE Employee
ADD CONSTRAINT check_Salary_NonNegative CHECK (Salary >= 0);

/* HOW WOULD YOU ADD A UNIQUE CONSTRAINT TO THE EMPLOYEES TABLE TO ENSURE THAT NO TWO EMPLOYEES CAN HAVE THE SAME EMAIL ADDRESS.
WRITE AN ALTER TABLE STATEMENT TO ADD AN "EMAIL" COLUMN TO THE EMPLOYEES TABLE WITH A UNIQUE CONSTRAINT THAT ALLOWS NULL VALUES.ALTER */

ALTER TABLE Employee
ADD Email VARCHAR(100);

CREATE UNIQUE INDEX unique_Email_Filtered
ON Employee (Email)
WHERE Email IS NOT NULL;






