-- 1 Extract the middle 3 characters from the string 'ABCDEFG'.
SELECT SUBSTRING('ABCDEFG',3,3) AS MiddleCharacters;

--2 From a table 'Employees' with a column 'FullName', write a query to extract the first name (assuming it's always the first word before a space).
CREATE DATABASE TASK3;
USE  TASK3;

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FullName VARCHAR(50));

INSERT INTO  Employees VALUES
(1,'Leo Das'),
(2,'Mukhil M P'),
(3,'Allen Jose');

SELECT LEFT(FullName,CHARINDEX(' ',FullName) - 1) AS FirstName 
FROM Employees;

-- 3 Extract the first 5 characters from the string 'SQL Server 2022'.
SELECT SUBSTRING('SQL Server 2022',1,5) AS FiveString;

--4 From a 'Products' table with a 'ProductCode' column, write a query to get the first 3 characters of each product code.
CREATE TABLE Products(
ProductID CHAR(5) PRIMARY KEY);

INSERT INTO Products VALUES
('A1YZT'),
('B2ORH'),
('AK47S');

SELECT LEFT(ProductID,3) AS StartThreeCharacters
FROM Products;

-- 5  Extract the last 4 characters from the string 'ABCDEFGHIJKL'

SELECT RIGHT('ABCDEFGHIJKL',4) AS LastFourChar;

-- 6 From an 'Orders' table with an 'OrderID' column (format: ORD-YYYY-NNNN), write a query to extract just the numeric portion at the end.
CREATE TABLE Orders (
    OrderID NVARCHAR(20)
);

INSERT INTO Orders (OrderID)
VALUES 
('ORD-2023-1234'),
('ORD-2022-5678'),
('ORD-2024-9101');

SELECT OrderID, RIGHT(OrderID,4) AS Numeric
FROM Orders;

-- 7  Write a query to find the length of the string 'SQL Server Functions'

SELECT LEN('SQL Server Functions') AS LengthOfString;

--8 From a 'Customers' table, find customers whose names are longer than 20 characters.

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50) NOT NULL);

INSERT INTO Customers VALUES
(1,'Akku Pradeep Thandyekal'),
(2,'Varun Prabhakar'),
(3,'Krishna Kamdu Gujari Bali');

SELECT  CustomerName AS BigNames
FROM Customers
WHERE LEN(REPLACE(CustomerName,' ',''))>20;

-- 9 Compare the results of character count and byte count for the string 'SQL Server' with a trailing space.

SELECT LEN('SQL Server') AS StringLength, DATALENGTH('SQL Server') AS ByteLength; 


-- 10 Write a query to find the byte count of an empty string and explain the result.

SELECT LEN('')  AS ByteLength; 

-- 11 Find the position of 'Server' in the string 'Microsoft SQL Server'.

SELECT CHARINDEX('Server','Microsoft SQL Server') AS ServerPosition;



-- 12 From an 'Emails' table, write a query to extract the domain name from email addresses.

CREATE TABLE Emails(
EmailId INT PRIMARY KEY,
Email VARCHAR(100));

INSERT INTO Emails VALUES
(1,'mukhil.mp@gmail.com'),
(2,'mukhil.mp@geekywolf.com'),
(3,'mukhil.mp@Yahoo.com');

SELECT Email, RIGHT(Email,LEN(Email)-CHARINDEX('@',Email)) as Domian 
FROM Emails;

-- 13 Find the position of the first number in the string 'ABC123DEF456'.

SELECT PATINDEX('%[0-9]%','ABC123DEF456') AS FirstNumber;

--14 Write a query to find all product names from a 'Products' table that contain a number.

select * from products;

ALTER TABLE Products
ADD ProductName VARCHAR(50);

UPDATE Products
SET ProductName = CASE 
    WHEN ProductID = 'A1YZT' THEN 'APLLE123'
    WHEN ProductID = 'AK47S' THEN 'ORANGE'
    WHEN ProductID = 'B2ORH' THEN 'GRA456PS'
    ELSE ProductName
END
WHERE ProductID IN ('A1YZT','AK47S','B2ORH');

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%[0-9]%';

-- 15 Join the strings 'SQL', 'Server', and '2022' with spaces between them

SELECT 'SQL'+' '+'Server'+' '+'2022' AS CombinedString;

-- 16 From 'Employees' table with 'FirstName' and 'LastName' columns, create a 'FullName' column.

USE TASK2;
SELECT name AS TableName 
FROM sys.tables;

SELECT * FROM Employees;

SELECT (FirstName+' '+LastName) AS FullName 
FROM Employees;

-- 17 Join the array ('SQL', 'Server', '2022') with a hyphen as the separator.
USE TASK3;

SELECT CONCAT('SQL','-', 'Server','-', '2022') AS String;

-- 18  From an 'Addresses' table, combine 'Street', 'City', 'State', and 'ZIP' columns into a single address string

CREATE TABLE Address(
Street VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
ZIP INT);

INSERT INTO Address (Street, City, State, ZIP) VALUES
('123 Main St', 'Springfield', 'IL', 62701),
('456 Elm St', 'Chicago', 'IL', 60601),
('789 Maple Ave', 'Los Angeles', 'CA', 90001),
('101 Pine St', 'New York', 'NY', 10001),
('202 Oak St', 'Dallas', 'TX', 75201);


SELECT CONCAT_WS(Street,City,State,ZIP) AS Address
FROM Address;

-- 19 Change all occurrences of 'a' to 'e' in the string 'database management'.

SELECT REPLACE('database management','a','e') AS ChangedString;

-- 20 From a 'Products' table, write a query to replace all spaces in product names with underscores.

INSERT INTO Products VALUES
('7JDFT','AKKK III OO');

UPDATE Products
SET ProductName = REPLACE(ProductName,' ','-');

-- 21 Create a string of 10 asterisks (*).

SELECT REPLICATE('*',10) AS RepeatedAsterikString;

-- 22 Write a query to pad all product codes in a 'Products' table to a length of 10 characters with leading zeros.

ALTER TABLE Products
DROP CONSTRAINT PK__Products__B40CC6ED156CE50A;


ALTER TABLE Products
ALTER COLUMN ProductID VARCHAR(10);


UPDATE Products
SET ProductID =  RIGHT(REPLICATE('0',10) + ProductID,10);

select * from Products;


-- 23 Insert the string 'New ' at the beginning of 'York City'.

select * from Address;
INSERT INTO Address (Street, City, State, ZIP) VALUES
('123 Main St', 'York city', 'IL', 62701);

UPDATE Address
SET City = 'New'+' '+City
WHERE City ='York city';

-- 24 From an 'Emails' table, mask the username part of email addresses, showing only the first and last characters.

SELECT LEFT(Email,1) + REPLICATE('*',CHARINDEX('@',Email)-1) + RIGHT(Email,LEN(Email)- CHARINDEX('@',Email) +2) AS MaskedMail
FROM Emails;

-- 25 Convert the string 'sql server' to uppercase.

SELECT UPPER('sql server') AS UpperCaseString;

-- 26 Write a query to convert all customer names in a 'Customers' table to uppercase.

select * from Customers;

UPDATE Customers
SET CustomerName = UPPER(CustomerName);

-- 27 Convert the string 'SQL SERVER' to lowercase.

SELECT LOWER('SQL SERVER') AS LowerCaseString;

-- 28 From a 'Products' table, write a query to convert all product descriptions to lowercase.

ALTER TABLE Products
ADD ProductDetails VARCHAR(200);

select * from products;

UPDATE Products
SET ProductDetails = CASE ProductID
    WHEN '000007JDFT' THEN 'Product details for 000007JDFT'
    WHEN '00000A1YZT' THEN 'Product details for 00000A1YZT'
    WHEN '00000AK47S' THEN 'Product details for 00000AK47S'
    WHEN '00000B2ORH' THEN 'Product details for 00000B2ORH'
    ELSE ProductDetails  
END
WHERE ProductID IN ('000007JDFT', '00000A1YZT', '00000AK47S', '00000B2ORH');


UPDATE Products
SET ProductDetails = LOWER(ProductDetails);


-- 29 Remove trailing spaces from the string 'SQL Server   '.

SELECT RTRIM('SQL Server    ') AS TrimmedString

-- 30  Write a query to remove trailing spaces from all email addresses in an 'Employees' table

select * from Employees;

ALTER TABLE Employees
ADD Email VARCHAR(50);

UPDATE Employees
SET Email = CASE EmployeeID
    WHEN 1 THEN 'leodas@gmail.com   '
    WHEN 2 THEN 'mukhil.mp@gmail.com      '
    WHEN 3 THEN 'allenjose@gmail.com   '
    ELSE Email  
END
WHERE EmployeeID IN (1,2,3);

UPDATE Employees
SET Email = RTRIM(Email);

-- 31 Remove leading spaces from the string '   SQL Server'


 SELECT LTRIM('   SQL Server') AS TrimmedString;

 -- 32  From a 'Comments' table, write a query to remove leading spaces from all comment texts.
 CREATE TABLE COMMENTS(
 Comments VARCHAR(300));

 INSERT INTO COMMENTS (Comments) VALUES
('        This is a great product!'),
('  I had an issue with the installation process.'),
('Customer service was very helpful.'),
('   Delivery was delayed by two days, but overall satisfied.'),
('        Highly recommend to anyone looking for quality.'),
('The user manual could be more detailed.'),
('  Packaging was excellent, and the product arrived in good condition.'),
('   The product exceeded my expectations. Will buy again.'),
(' Had a minor issue, but it was resolved quickly.'),
('     Great value for the price.');

SELECT * FROM Comments;

UPDATE Comments
SET Comments= LTRIM(Comments);


-- 33 Display the current date in the format 'dd-MM-yyyy'

SELECT FORMAT(GETDATE(),'dd-MM-yyyy') AS CurrentDate;

-- 34 From an 'Orders' table with an 'OrderTotal' column, display the total as a currency with 2 decimal places

CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    OrderTotal DECIMAL(10, 2)  -- 10 digits total, 2 decimal places
);

INSERT INTO Orders2 (OrderID, OrderTotal) VALUES
(1, 1234.56),
(2, 789.99),
(3, 1500.00),
(4, 99.95),
(5, 2499.49);

SELECT FORMAT(OrderTotal, 'C', 'en-US') AS FormattedTotal
FROM Orders2;


--35 Separate the string 'apple,banana,cherry' into individual fruits

SELECT value AS Fruit
FROM STRING_SPLIT('apple,banana,cherry', ',');

-- 36 From a 'Skills' table with a 'SkillList' column containing comma-separated skills, write a query to create a row for each individual skill.
CREATE TABLE Skills (
    SkillID INT PRIMARY KEY,
    SkillList VARCHAR(255)
);

INSERT INTO Skills (SkillID, SkillList) VALUES
(1, 'SQL,Python,Data Analysis'),
(2, 'Java,C++,JavaScript'),
(3, 'HTML,CSS,React');


SELECT SkillID, VALUE AS Skill
FROM Skills
CROSS APPLY STRING_SPLIT(SkillList, ',');


-- Date and Time Functions


-- 37 Write a query to display the current date and time.

SELECT GETDATE() AS CurrentDateTime;

-- 38 From an 'Orders' table, find all orders placed in the last 24 hours
CREATE TABLE Orders3 (
    OrderID INT PRIMARY KEY,
    OrderTotal DECIMAL(10, 2),
    OrderDate DATETIME  
);

INSERT INTO Orders3 (OrderID, OrderTotal, OrderDate) VALUES
(1, 150.00, GETDATE() - 1),  
(2, 75.50, GETDATE() - 0.5),  
(3, 120.25, GETDATE() - 0.1),  
(4, 250.00, GETDATE() - 0.02),  
(5, 99.99, GETDATE());          


SELECT *
FROM Orders3
WHERE OrderDate >= DATEADD(HOUR, -24, GETDATE());

-- 39  Display the current UTC date and time
SELECT GETUTCDATE() AS CurrentUTCTime;

-- 40 Write a query to show the time difference between local time and UTC time

SELECT SYSDATETIMEOFFSET() AS LocalDateTime, GETUTCDATE()  AS UtcDT , DATEDIFF(minute,SYSDATETIMEOFFSET(),GETUTCDATE()) AS DifferenceInMinutes;

-- 41 Convert the current date and time to 'Pacific Standard Time' 

SELECT SYSDATETIME() AS CurrentLocalTime,SYSDATETIMEOFFSET() AT TIME ZONE 'Pacific Standard Time' AS PacificTime;


-- 42 From a 'Flights' table with a 'DepartureTime' column in UTC, convert all departure times to 'Eastern Standard Time'.

CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    DepartureTime DATETIME  -- Column to store the departure time in UTC
);


INSERT INTO Flights (FlightID, DepartureTime) VALUES
(1, '2024-09-30 15:00:00'),  -- Departure time in UTC
(2, '2024-09-30 18:30:00'),
(3, '2024-09-30 20:45:00'),
(4, '2024-09-30 23:15:00');

SELECT FlightID,DepartureTime AS DepartureTimeUTC,DepartureTime AT TIME ZONE 'Eastern Standard Time' AS DepartureTimeEST
FROM Flights;


-- 43 Add 3 months to the current date.

SELECT DATEADD(MONTH,3,GETDATE())  AS ThirdMonthLater;

-- 44 From an 'Employees' table, write a query to calculate each employee's retirement date (65 years from their 'DateOfBirth').

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DateOfBirth DATE  -- Column to store the date of birth
);

INSERT INTO Employees2 (EmployeeID, EmployeeName, DateOfBirth) VALUES
(1, 'John Doe', '1980-01-15'),
(2, 'Jane Smith', '1975-05-22'),
(3, 'Alice Johnson', '1990-10-10'),
(4, 'Bob Brown', '1960-02-28');

SELECT EmployeeID , EmployeeName ,DateOfBirth , DATEADD(YEAR,65,DateOfBirth) AS RetirementDate
FROM Employees2;


-- 45 Calculate the number of days between '2023-01-01' and '2023-12-31

SELECT DATEDIFF(DAY,'2023-01-01','2023-12-31') AS DateDifference;

-- 46 From an 'Orders' table, find the average number of days between order date and ship date.

CREATE TABLE Orders4 (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ShipDate DATE
);

INSERT INTO Orders4 (OrderID, OrderDate, ShipDate) VALUES
(1, '2024-09-01', '2024-09-05'),
(2, '2024-09-02', '2024-09-10'),
(3, '2024-09-03', '2024-09-04'),
(4, '2024-09-04', '2024-09-08'),
(5, '2024-09-05', '2024-09-12');

SELECT DATEDIFF(DAY,OrderDate,ShipDate) AS DateDifference
FROM Orders4;

--47 Extract the month number from the date '2023-09-15'

SELECT MONTH('2023-09-15') AS MonthOfDate

-- 48 From a 'Sales' table, write a query to group total sales by the quarter of the sale date.

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2) 
);

INSERT INTO Sales (SaleID, SaleDate, TotalAmount) VALUES
(1, '2023-01-15', 150.00),
(2, '2023-04-22', 200.00),
(3, '2023-07-10', 300.00),
(4, '2023-10-05', 400.00),
(5, '2023-01-20', 250.00),
(6, '2023-04-25', 350.00);

SELECT DATEPART(QUARTER,SaleDate) AS Quarters, SUM(TotalAmount) AS TotalOfEachQuarter
FROM Sales
GROUP BY DATEPART(QUARTER,SaleDate)
ORDER BY DATEPART(QUARTER,SaleDate);



-- 49 Extract the year from the current date.

SELECT YEAR(GETDATE()) AS YearOfDate;

-- 50 From an 'Employees' table, find all employees hired in the year 2022

CREATE TABLE Employees3 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    HireDate DATE
);

INSERT INTO Employees3 (EmployeeID, EmployeeName, HireDate) VALUES
(1, 'John Doe', '2022-01-15'),
(2, 'Jane Smith', '2022-06-22'),
(3, 'Alice Johnson', '2021-09-10'),
(4, 'Bob Brown', '2022-11-05'),
(5, 'Charlie Black', '2020-12-30');

SELECT * 
FROM Employees3
WHERE YEAR(HireDate) = 2022;

-- 51 Check if '2023-02-30' is a valid date.


IF TRY_CONVERT(DATE,'2023-02-30') IS NULL
	PRINT 'INVALID DATE'
ELSE
	PRINT 'VAILD DATE'


-- 52 Write a query to find all rows in a 'UserInputs' table where the 'EnteredDate' column contains invalid dates

CREATE TABLE UserInputs (
    InputID INT PRIMARY KEY,
    UserName VARCHAR(100),
    EnteredDate VARCHAR(10)  
);

INSERT INTO UserInputs (InputID, UserName, EnteredDate) VALUES
(1, 'Alice', '2023-01-15'),  
(2, 'Bob', '2023-02-30'),    
(3, 'Charlie', '2023-03-25'), 
(4, 'David', '2023-04-31'),      
(5, 'Frank', '2023-05-01');    



SELECT EnteredDate AS InvalidDates
FROM UserInputs
WHERE TRY_CONVERT(DATE,EnteredDate) IS NULL;

-- 53  Find the last day of the current month.

SELECT EOMONTH(GETDATE()) AS LastDayOfMonth;



-- 54  From a 'Subscriptions' table, write a query to extend all subscription end dates to the end of their respective months.


CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    UserName VARCHAR(100),
    SubscriptionEndDate DATE
);

INSERT INTO Subscriptions (SubscriptionID, UserName, SubscriptionEndDate) VALUES
(1, 'Alice', '2023-09-15'),  -- Ends on September 15, 2023
(2, 'Bob', '2023-10-10'),    -- Ends on October 10, 2023
(3, 'Charlie', '2023-11-20'),-- Ends on November 20, 2023
(4, 'David', '2023-12-05');  -- Ends on December 5, 2023

select * from Subscriptions;

UPDATE Subscriptions
SET SubscriptionEndDate = EOMONTH(SubscriptionEndDate);


-- 55 Display the current date and time

SELECT (GETDATE()) AS CurrentDate;

-- 56 Compare the results of two different methods to get the current timestamp - are they always the same
SELECT SYSDATETIME() AS LocalDateTime, GETUTCDATE()  AS UtcDT , DATEDIFF(minute,SYSDATETIMEOFFSET(),GETUTCDATE()) AS DifferenceInMinutes;
 

 -- 57 Get the current date and time with higher precision than standard methods.
 
 SELECT SYSDATETIME() AS HigherPrecisionDateTime;

 -- 58 Write a query to insert the current high-precision timestamp into a 'Logs' table

 CREATE TABLE LOGS(
 LogID INT PRIMARY KEY IDENTITY(1,1),
 LogMessage VARCHAR(100),
 LogTimeStamp DATETIME2);

 INSERT INTO Logs(LogMessage,LogTimeStamp) VALUES
 ('1st Log Time',SYSDATETIME());

 SELECT * FROM Logs;

 -- 59 Display the current UTC date and time with high precision

 SELECT SYSUTCDATETIME() AS HighPrecisionUTC;

 -- 60 Calculate the difference in microseconds between the current local time and UTC time

 SELECT DATEDIFF(MICROSECOND,SYSDATETIME(),SYSUTCDATETIME()) AS DateDiffInMicroseconds;

 -- 61 Get the current date, time, and time zone offset

 SELECT SYSDATETIMEOFFSET() AS DateTimewithOffSet;

 -- 62 From a 'GlobalEvents' table, convert all event times to include time zone offset information

 CREATE TABLE GlobalEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventTime DATETIME
);

INSERT INTO GlobalEvents (EventID, EventName, EventTime)
VALUES
(1, 'Conference', '2024-10-01 10:30:00'),
(2, 'Webinar', '2024-10-01 14:00:00'),
(3, 'Team Meeting', '2024-10-01 18:00:00');

SELECT EventID, 
       EventName, 
       EventTime AT TIME ZONE 'UTC' AS EventTimeWithOffset
FROM GlobalEvents;

--63 Extract the month number from the date '2023-12-25.

SELECT MONTH('2023-12-25') AS MonthOfGivenDate;

-- 64 From a 'Sales' table, find the total sales for each month of the previous year

CREATE TABLE Sales3 (
    SaleID INT PRIMARY KEY,
    SaleDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Sales3 (SaleID, SaleDate, TotalAmount) VALUES
(1, '2023-01-15', 150.00),
(2, '2023-02-22', 200.00),
(3, '2023-03-10', 300.00),
(4, '2023-01-20', 250.00),
(5, '2023-02-15', 350.00),
(6, '2023-03-30', 450.00),
(7, '2024-01-05', 500.00),  
(8, '2024-01-15', 600.00);


SELECT MONTH(SaleDate) AS MonthsofLastYear, SUM(TotalAmount) AS SalesOfMonth
FROM Sales3
WHERE YEAR(SaleDate) = YEAR(GETDATE())-1
GROUP BY MONTH(SaleDate)
ORDER BY MONTH(SaleDate); 

-- 65 Extract the day of the month from '2023-03-15'.

SELECT DAY('2023-03-15') AS DayOfGivenDate;

-- 66 Write a query to find all orders from an 'Orders' table that were placed on the 15th day of any month

CREATE TABLE Orders5 (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME,
    OrderTotal DECIMAL(10, 2)
);


INSERT INTO Orders5 (OrderID, OrderDate, OrderTotal) VALUES
(1, '2023-01-15', 100.00),
(2, '2023-02-14', 200.00),
(3, '2023-03-15', 300.00),
(4, '2023-04-16', 150.00),
(5, '2023-05-15', 250.00),
(6, '2023-06-15', 400.00),
(7, '2023-07-20', 500.00),
(8, '2023-08-15', 600.00);

SELECT OrderID,OrderDate,OrderTotal
FROM Orders5
WHERE DAY(OrderDate) = '15';

-- 67 Get the name of the month for the date '2023-09-01'

SELECT DATENAME(MONTH,'2023-09-01') AS MonthOfGivenDate;

-- 68 From an 'Events' table, write a query to display the day of the week (in words) for each event date

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventDate DATETIME,
    EventName VARCHAR(100)
);

INSERT INTO Events (EventID, EventDate, EventName) VALUES
(1, '2023-09-01', 'Company Meeting'),
(2, '2023-09-02', 'Product Launch'),
(3, '2023-09-03', 'Team Building'),
(4, '2023-09-04', 'Holiday Celebration'),
(5, '2023-09-05', 'Client Presentation');

SELECT EventId,DATENAME(WEEKDAY,EventDate) AS DayOfWeek,EventName
FROM Events;


-- 69 Create a date for Christmas Day 2023

DECLARE @ChristmasDate DATE;
SET @ChristmasDate = '2023-12-25';
SELECT @ChristmasDate AS ChristmasDay;

-- 70 Write a query to convert separate year, month, and day columns from a 'Dates' table into a single DATE column
-- Create the Dates table

CREATE TABLE Dates (
    Year INT,
    Month INT,
    Day INT
);

-- 70 Insert sample values into the Dates table
INSERT INTO Dates (Year, Month, Day) VALUES
(2023, 1, 15),
(2022, 12, 25),
(2024, 7, 4);

SELECT Year,Month,Day,CAST(CONCAT(Year,'-',RIGHT('0'+CAST(Month AS VARCHAR(2)),2) +'-'+RIGHT('0'+CAST(Day AS VARCHAR(2)),2)) AS DATE) AS FullDate
FROM Dates;
