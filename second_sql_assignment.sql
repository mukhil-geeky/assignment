CREATE DATABASE TASK2; 

USE TASK2;

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
HireDate Date);

INSERT INTO  Employees VALUES
(1,'Gokul','Das','IT',70000,'2008-07-18'),
(2,'Akhil','Philip','Finance',50000,'2010-06-20'),
(3,'Sangeeth','Kumar','HR',45000,'2014-01-13'),
(4,'Priya','Santhosh','Marketing',85000,'2005-04-11');


-- CREATE A TABLE STUDENTS AND INSERT NAMES IN MALAYALAM.


CREATE TABLE Students(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50) NOT NULL);


ALTER TABLE Students
ALTER COLUMN StudentName NVARCHAR(50);


INSERT INTO Students (StudentID, StudentName) VALUES
(1, N'ആനന്ദ്'),
(2, N'സന്ദീപ്'),
(3, N'വിജയ്കുമാർ');


-- RETRIEVE ALL EMPLOYEES WHO WORK IN SALES, MARKETING OR IT DEPARTMENTS.


SELECT * FROM  Employees
WHERE Department IN ('Sales','Marketing','IT');

-- FIND ALL EMPLOYEES WITH SALARIES RANGING FROM $50,000 TO $75,000 (INCLUSIVE)>

SELECT * FROM  Employees
WHERE Salary BETWEEN 50000 AND 75000;

-- LIST ALL EMPLOYEES WHOSE LAST NAME STARTS WITH THE LETTER 'S'.

SELECT * FROM Employees 
WHERE LastName LIKE 'S%';

-- DISPLAY ALL EMPLOYEES WITH EXACTLY 5 LETTERS IN THEIR FIRST NAME.

SELECT * FROM Employees
WHERE LEN(FirstName) = 5;

-- FIND EMPLOYEES WHOSE LAST NAME STARTS WITH EITHER 'B','R', OR 'S'.


SELECT * FROM Employees
WHERE LEFT(LastName,1) IN ('B','R','S');

-- RETRIEVE ALL EMPLOYEES WHOSE FIRST NAME BEGINS WITH ANY LETTER FROM 'A'THROUGH 'M'.

SELECT * FROM Employees
WHERE LEFT(FirstName,1) BETWEEN 'A' AND 'M';

-- LIST EMPLOYEES WHOSE LAST NAME DOESN'T START WITH A VOWEL.

SELECT * FROM Employees
WHERE LEFT(LastName,1) NOT IN ('A','E','I','O','U');

-- IDENTIFY EMPLOYEES EARNING MORE THAN $80,000 ANNUALLY.

SELECT * FROM Employees
WHERE Salary>80000;

-- FIND EMPLOYEES WHO JOINED THE COMPANY BEFOR 2020.

SELECT * FROM Employees
WHERE HireDate < '2020-01-01';

-- LIST ALL EMPLOYEES NOT NAMED 'JOHN' IN FIRST NAME.

SELECT * FROM Employees
WHERE FirstName != 'John';

-- IDENTIFY MARKETING DEPARTMENT EMPLOYEES EARNING $60,000 OR LESS WHO WERE HORED AFTER JUNE 30,2019

SELECT * FROM Employees
WHERE Department ='Marketing'
	  AND Salary <= 60000
	  AND HireDate > '2019-06-30';

-- FIND EMPLOYEE WHOSE FIRST NAME CONTAINS THE LETTERS 'AN' ANYWHERE AND ENDS WITH 'E'.

SELECT * FROM Employees
WHERE Firstname LIKE '%an%e';


QUESTION 2


CREATE TABLE Sales(
SaleID INT PRIMARY KEY,
ProductID INT,
CustomerID INT,
SaleDate DATE,
Quantity INT,
UnitPrice DECIMAL(10,2));



INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, Quantity, UnitPrice) VALUES
(1, 101, 201, '2024-01-15', 2, 15.99),
(2, 102, 202, '2024-01-16', 1, 29.50),
(3, 103, 203, '2024-01-17', 5, 9.99),
(4, 104, 204, '2024-01-18', 3, 20.00),
(5, 105, 205, '2024-01-19', 1, 45.00),
(6, 101, 206, '2024-02-01', 4, 15.99),
(7, 102, 207, '2024-02-02', 2, 29.50),
(8, 103, 208, '2024-02-03', 3, 9.99),
(9, 104, 209, '2024-02-04', 1, 20.00),
(10, 105, 210, '2024-02-05', 6, 45.00);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50));


INSERT INTO Products (ProductID, ProductName, Category) VALUES
(101, 'Wireless Mouse', 'Electronics'),
(102, 'Mechanical Keyboard', 'Electronics'),
(103, 'Gaming Headset', 'Electronics'),
(104, 'Office Chair', 'Furniture'),
(105, 'Desk Lamp', 'Furniture');


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2));


INSERT INTO Customers (CustomerID, CustomerName, City, State) VALUES
(201, 'John Doe', 'New York', 'NY'),
(202, 'Jane Smith', 'Los Angeles', 'CA'),
(203, 'Sam Brown', 'Chicago', 'IL'),
(204, 'Emily White', 'Houston', 'TX'),
(205, 'Michael Green', 'Phoenix', 'AZ');

-- CALCULATE THE TOTAL SALES AMOUNT FOR EACH PRODUCT. DISPLAY THE PRODUCT ID AND TOTAL SALES AMOUNT.

SELECT ProductID, SUM(quantity * UnitPrice) as Total_Sales_Amount
FROM Sales
GROUP BY ProductID;

-- FIND THE AVERAGE QUANTITY SOLD PER SALE FOR EACH PRODUCT CATEGORY.

SELECT p.Category, AVG(s.Quantity) AS AverageQuantitySold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

-- LIST THE TOP 5 CUSTOMERS BY THEIR TOTAL PURCHASE AMOUNT. INCLUDE THE CUSTOMERID AND TOTAL PURCHASE AMOUNT.


SELECT TOP 5 c.CustomerID, SUM(s.Quantity * s.UnitPrice) AS TotalPurchaseAmount
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalPurchaseAmount DESC;


-- DETERMINE THE NUMBER OF SALES MADE EACH MONTH IN THE YEAR OF 2023. DISPLAY THE MONTH AND COUNT OF SALES. 


SELECT MONTH(SaleDate) AS SaleMonth, COUNT(*) AS SalesCount
FROM Sales
WHERE YEAR(SaleDate) = 2023
GROUP BY MONTH(SaleDate)
ORDER BY SaleMonth;

--CALCULATE THE TOTAL REVENUE FOR EACH STATE BUT ONLY FOR STATES WITH MORE THAN $10,000 IN TOTAL SALES.


SELECT c.State,SUM(s.Quantity * s.UnitPrice) AS TotalRevenue
FROM Customers c
JOIN Sales s ON s.CustomerID = c.CustomerID
GROUP BY c.State
HAVING SUM(s.Quantity * s.UnitPrice) > 10000
ORDER BY TotalRevenue DESC;


-- FIND THE PRODUCTS THAT HAVE BEN SOLD MORE THAN 100 TIMES IN TOTAL. DISPLAY THE PRODUCT ID, PRODUCT NAME AND TOTAL QUANTITY SOLD.

SELECT p.ProductID, p.ProductName, SUM(s.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(s.Quantity) > 100;


-- FOR EACH CUSTOMER FIND THE DATE OF THEIR FIRST PURCHASE AND THE DATE OF THEIR MOST RECENT PURCHASE.

SELECT c.CustomerID, c.CustomerName, MIN(s.SaleDate) as FisrtPurchase, MAX(s.SaleDate) as Latestpurchase
From Sales s
JOIN Customers c ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID,c.CustomerName;

/* FIND THE CUSTOMERS WHO HAVE MADE PURCHASES ON ATLEAST 5 DIFFERENT DATES. DISPLAY THE CUSTOMERID AND THE COUNT OF DISTINCT PURCHASE DATES. */

SELECT c.CustomerID, COUNT(DISTINCT s.SaleDate) AS DistinctPurchaseDates
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(DISTINCT s.SaleDate) >= 5;











