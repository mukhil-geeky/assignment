CREATE DATABASE Ecommerce;

USE Ecommerce;

CREATE TABLE Customer(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(70) NOT NULL,
CustomerPhone CHAR(10) NOT NULL,
CustomerEmail VARCHAR(60) NOT NULL,
CustomerAge INT ,
CustomerGender CHAR(1));

CREATE TABLE Address(
AddressID INT PRIMARY KEY,
CustomerID INT,
State VARCHAR(20) NOT NULL,
City VARCHAR(20)NOT NULL,
Zip VARCHAR(10),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));


CREATE TABLE Brands(
BrandID INT PRIMARY KEY,
BrandName VARCHAR(20) NOT NULL,
BrandRating FLOAT);

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(30),
QuantityAvailable INT NOT NULL,
ProductDescription VARCHAR(150),
BrandID INT,
FOREIGN KEY (BrandID) REFERENCES Brands(BrandID));

CREATE TABLE Review(
ReviewID INT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Review VARCHAR(300),
ProductRating FLOAT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Quantity INT NOT NULL,
OrderDate DATE NOT NULL,
OrderTime TIME NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

CREATE TABLE Payment(
PaymentID INT PRIMARY KEY,
OrderID INT,
PaymentMode VARCHAR(10),
OrderDateAndTime DATETIME,
Amount SMALLMONEY,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));








