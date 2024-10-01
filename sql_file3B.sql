-- E-commerce Platform Schema
USE TASK3_1;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    RegistrationDate DATE
);


INSERT INTO Customers (CustomerID, CustomerName, Email, RegistrationDate)
VALUES 
(1, 'John Doe', 'john.doe@example.com', '2022-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', '2023-05-22'),
(3, 'Emily Davis', 'emily.davis@example.com', '2021-10-30'),
(4, 'Michael Brown', 'michael.brown@example.com', '2022-07-08');

INSERT INTO Customers (CustomerID, CustomerName, Email, RegistrationDate)
VALUES 
(5, 'Jack Doe', 'jack.doe@example.com', '2022-02-15')



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(200),
    Price DECIMAL(10, 2),
    CategoryID INT
);


INSERT INTO Products (ProductID, ProductName, Price, CategoryID)
VALUES 
(1, 'Smartphone', 699.99, 1),
(2, 'Laptop', 1200.50, 1),
(3, 'T-Shirt', 19.99, 2),
(4, 'Microwave', 89.99, 3),
(5, 'Book', 14.99, 4),
(6, 'Headphones', 150.00, 1),
(7, 'Vacuum Cleaner', 299.99, 3),
(8, 'Jeans', 49.99, 2);

INSERT INTO Products (ProductID, ProductName, Price, CategoryID)
VALUES 
(11, 'Refrigerator', 10000.99, 5);



CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books');

INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
(5, 'Grocery');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2023-09-15', 870.49),
(2, 2, '2023-08-10', 200.49),
(3, 3, '2023-07-05', 1049.99),
(4, 4, '2023-09-01', 29.99),
(5, 1, '2023-06-20', 1499.99);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(7, 4, '2022-09-28', 870.49);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1, 1),  -- Smartphone
(2, 1, 6, 2),  -- Headphones
(3, 2, 3, 4),  -- T-Shirt
(4, 3, 2, 1),  -- Laptop
(5, 4, 5, 2),  -- Book
(6, 5, 2, 1);  -- Laptop


-- Questions

-- 1. List all products with their category names, including products without a category.

SELECT P.ProductName,C.CategoryName
FROM Products P 
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID;

-- 2. Display all customers and their order history, including customers who haven't placed any orders.

SELECT C.CustomerID,C.CustomerName,O.OrderID,O.OrderDate,OO.ProductID,OO.Quantity
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
LEFT JOIN OrderDetails OO ON O.OrderID =OO.OrderID;



-- 3. Show all categories and the products in each category, including categories without any products.

SELECT C.CategoryID,C.CategoryName,P.ProductID,P.ProductName
FROM Categories C
LEFT JOIN Products P ON C.CategoryID =P.CategoryID;



-- 4. List all possible customer-product combinations, regardless of whether a purchase has occurred.

SELECT *
FROM Customers 
CROSS JOIN Products;

-- 5. Display all orders with customer and product information, including orders where either the customer or product information is missing.

SELECT O.OrderID,O.OrderDate,C.CustomerID,C.CustomerName,C.Email,C.RegistrationDate,P.ProductID,P.ProductName,OO.Quantity,O.TotalAmount
FROM Orders O
LEFT JOIN OrderDetails OO ON O.OrderID = OO.OrderID
LEFT JOIN Customers C ON C.CustomerID = O.CustomerID
LEFT JOIN Products P  ON P.ProductID = OO.ProductID;

-- 6. Show all products that have never been ordered, along with their category information.

SELECT P.ProductID,P.ProductName,P.Price,C.CategoryName
FROM Products P
LEFT JOIN Categories C ON C.CategoryID = P.CategoryID
LEFT JOIN OrderDetails O ON O.ProductID = P.ProductID
WHERE O.OrderID IS NULL;


-- 7. List all customers who have placed orders in the last week, along with the products they've purchased.

SELECT C.CustomerID,C.CustomerName,P.ProductName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
LEFT JOIN OrderDetails OD ON O.OrderID = OD.OrderID
LEFT JOIN Products P ON P.ProductID = OD.ProductID
WHERE DATEPART(WEEK,O.OrderDate) = DATEPART(WEEK,GETDATE()) - 1;

-- 8. Display all categories with products priced over $100, including categories without such products.

SELECT C.CategoryID,C.CategoryName,P.Price
FROM Categories C
LEFT JOIN Products P ON C.CategoryID = P.CategoryID
WHERE Price > 100;




-- 9. Show all orders placed before 2023 and any associated product information.

SELECT O.OrderID,O.OrderDate,O.TotalAmount,P.ProductID,P.ProductName,P.Price
FROM Orders O
LEFT JOIN OrderDetails OD ON OD.OrderID = O.OrderID
LEFT JOIN Products P  ON P.ProductID = OD.ProductID
WHERE YEAR(O.OrderDate) < 2023;


-- 10. List all possible category-customer combinations, regardless of whether the customer has purchased a product from that category.

SELECT *
FROM Categories
CROSS JOIN Customers;
