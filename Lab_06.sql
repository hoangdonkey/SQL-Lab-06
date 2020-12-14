USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Lab06')
	DROP DATABASE Lab06
GO

CREATE DATABASE Lab06
GO

USE Lab06
GO

CREATE TABLE Category
(
	CategoryID INT IDENTITY,
	CategoryName VARCHAR(20),
	CONSTRAINT pk_categoryid PRIMARY KEY (CategoryID)
)
GO

CREATE TABLE Product
(
	ProductID INT IDENTITY,
	ProductName VARCHAR(50),
	Unit VARCHAR(10),
	ProductCost Money,
	Quantity INT,
	Status INT,
	Description varchar(50),
	CategoryID INT,
	CONSTRAINT pk_productid PRIMARY KEY (ProductID)
)
GO


CREATE TABLE Customer
(
	CustomerID INT,
	CustomerName VARCHAR(50),
	Address VARCHAR(100),
	Tel VARCHAR(13),
	CONSTRAINT pk_customerid PRIMARY KEY (CustomerID)
)
GO

CREATE TABLE Orders
(
	OrderID INT,
	OrderDate datetime,
	CustomerID int,
	Status INT,
	CONSTRAINT pk_orderid PRIMARY KEY (OrderID)
)
GO

CREATE TABLE OrderDetails
(
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price money
)


ALTER TABLE Product
	ADD CONSTRAINT fk_catid FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)

ALTER TABLE Orders
	ADD CONSTRAINT fk_customerid FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

ALTER TABLE OrderDetails
	ADD CONSTRAINT fk_orderid FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)

ALTER TABLE OrderDetails
	ADD CONSTRAINT fk_productid FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
GO

INSERT INTO Category VALUES
	('Computer'),
	('NotePad'),
	('Laptop'),
	('SmartPhone'),
	('NotVerySmartPhone')
GO

-- ProductID INT IDENTITY,
-- 	1.ProductName VARCHAR(50),
-- 	2.Unit VARCHAR(10),
-- 	3.ProductCost Money,
-- 	4.Quantity INT,
-- 	5.Status INT,
-- 	6.Description varchar(50),
-- 	7.CategoryID INT,

INSERT INTO Product VALUES
	('Alienware Case', 'Set',60000000,1,1,'Gaming monster',1),
	('Customized Dell', 'Set',32000000,0,2,'Dell''s Customized case',1),
	('Ipad 3', 'Unit',10000000,4,1,'Very fast',1),
	('Ipad 4', 'Unit',15000000,10,1,'Latest notepad',2),
	('MSI GF63', 'Unit',18000000,8,1,'Average gaming laptop',3),
	('Iphone X', 'Unit',18000000,3,1,'Second-Hand',4),
	('Nokia 1110i', 'Unit',20000000,5,1,'Not very smart but hard',5)
GO

SELECT * FROM Product 