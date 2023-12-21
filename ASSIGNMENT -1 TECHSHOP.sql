-- 2. Data Definition Language (DDL):
-- 1.
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone CHAR(10),
    Address VARCHAR(80)
)

CREATE TABLE Products(
    ProductID INT PRIMARY KEY IDENTITY(100,1),
    ProductName VARCHAR(50) NOT NULL,
    Description VARCHAR(100),
    Price NUMERIC(6,2)
)

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY  IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID) ON DELETE CASCADE NOT NULL,
    OrderDate DATE,
    TotalAmount NUMERIC(7,2)
)

CREATE TABLE OrderDetails(
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID) ON DELETE CASCADE,
    Quantity INT
)

CREATE TABLE Inventory(
    InventoryID INT PRIMARY KEY IDENTITY(1000,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID) ON DELETE CASCADE,
    QuantityInStock INT,
    LastStockUpdate INT
)


-- 3. Data Manipulation Language (DML):
-- a.
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES('Suresh','Kumar','suresh@gmail.com','9999999990','123 Shamsi Area'),
      ('Ramesh','Singh','ramesh43@gmail.com','9999999991','456 Lalitha Nagar'),
      ('Saaketh','Raju','sakiii64@gmial.com','8887776666','231 Madhav Nagar'),
      ('Bob', 'Raya','bob65454@gmial.com','9876543210','845 Gold Land'),
      ('Michael', 'Williams','micheeeei54@gmial.com','9551234567','734 Old Street'),
      ('Sara','Miller','sa64@gmial.com','9999999995','765 Nordic Area'),
      ('Chris','Peter','chrisyt5@gmial.com','7771112222','6553 Ompar City'),
      ('Olivia','olid','oli@gmial.com','9936669999','876 Stita Higher'),
      ('Sairan','Satvi','ranvi433@gmial.com','9999999998','0875 Salpi Land'),
      ('Abdul','Shah','abdu9@gmial.com','9224446666','314 Karun Nagar'),
      ('Sita','Rama','sita@gmail.com','8302293939','123 Ayodhya Nagar')
-- select * from Customers

INSERT INTO Products (ProductName, Description, Price)
VALUES
    ('Laptop', 'Fast Electronic laptop ', 400.50),
    ('Smartphone', 'New model Electronic smartphone ', 80.75),
    ('Chair', 'Strong Wooden Furniture', 150.99),
    ('Sofa', 'Soft 4 seater Furniture', 300.34),
    ('Camera', 'Low Cost Electronic Camera', 500.00),
    ('Bike', 'Two wheeled Vehicle toy', 25.05),
    ('Car', 'Three wheeled Vehicle toy', 40.85),
    ('Truck', 'Eight wheeled Vehicle toy', 900.99),
    ('Table', 'Sea Green Colored Furniture Table', 80.20),
    ('Shirt', 'Silk Fabric Shirt', 30.50),
    ('Hoodie', 'Woolen Fabric Hoodie', 60.90),
    ('Monitor', 'LCD Electronic Monitor', 100.50)
-- select * from Products

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2023-01-01', 120.50),
    (2, '2023-01-02', 75.20),
    (3, '2023-01-02', 200.00),
    (4, '2023-01-04', 350.75),
    (5, '2023-01-03', 90.90),
    (6, '2023-01-06', 180.30),
    (7, '2023-01-05', 40.50),
    (8, '2023-01-01', 300.25),
    (9, '2023-01-06', 50.60),
    (10, '2023-01-01', 120.00),
    (1, '2023-01-09', 95.75),
    (2, '2023-01-06', 180.20),
    (2, '2023-01-04', 60.00),
    (3, '2023-01-07', 240.50),
    (1, '2023-01-03', 30.90),
    (1, '2023-01-10', 150.30),
    (3, '2023-01-08', 20.50),
    (8, '2023-01-01', 180.25)
-- select * from Orders
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
    (1, 101, 2),
    (16, 109, 2),
    (2, 103, 1),
    (11, 110, 1),
    (12, 100, 1),
    (3, 102, 3),
    (13, 101, 1),
    (14, 104, 2),
    (7, 108, 4),
    (18, 102, 1),
    (10, 109, 3),
    (15, 102, 1),
    (8, 110, 1),
    (9, 107, 2),
    (6, 106, 1),
    (4, 105, 1),
    (5, 104, 2),
    (17, 103, 1)
-- select * from OrderDetails
INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (101, 10, 2),
    (102, 25, 4),
    (103, 15, 5),
    (104, 8, 1),
    (105, 12, 3),
    (106, 50, 6),
    (107, 30, 7),
    (108, 20, 3),
    (109, 18, 8),
    (110, 40, 1),
    (111, 10, 3)
-- select * from Inventory

-- b. Write SQL queries for the following tasks:
-- 1.
select CONCAT(FirstName,' ',LastName) as Name, Email 
from Customers

-- 2.
select o.OrderID,o.OrderDate , CONCAT(c.FirstName,' ',c.LastName) as Name
from Orders o
inner join Customers c
on c.CustomerID = o.CustomerID


-- 3.
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Aditya', 'Nagavolu', 'aditya@gmail.com', '9385035498', 'Indian Street');
-- 4. 
-- select * from Products
UPDATE Products
SET Price = Price * 1.1
where Description LIKE '%electronic%';
-- select * from Products

-- 5. 
-- select * from Orders;
-- select * from OrderDetails;

DECLARE @OrderID INT;
SET  @OrderID = 2;


DELETE FROM Orders
where OrderID = @OrderID;

-- select * from Orders;
-- select * from OrderDetails;

-- 6. 
-- select * from Orders;
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (3, '2023-01-15', 85.50);
-- select * from Orders;

-- 7. 

-- select * from Customers;
DECLARE @UpdateID INT
DECLARE @NewEmail VARCHAR(50)
DECLARE @NewAddress VARCHAR(80)
DECLARE @NewPhone CHAR(10)

SET @UpdateID = 3;
SET @NewEmail = 'newemail@example.com';
SET @NewAddress = '000 new location';
SET @NewPhone = '9000000000'

UPDATE Customers
SET Email = @NewEmail,
    Address = @NewAddress,
    Phone = @NewPhone
where CustomerID = @UpdateID;
-- select * from Customers;


-- 8. 
-- select TotalAmount from Orders;
UPDATE Orders
SET TotalAmount = (
select SUM(o.Quantity * p.Price)
from OrderDetails o
inner join Products p
on o.ProductID = p.ProductID
where o.OrderID = ORDERS.OrderID
)
-- select TotalAmount from Orders;
-- 9. 

-- select * from Orders;
-- select * from OrderDetails; 
DECLARE @CustomerID INT;
SET @CustomerID = 3;

delete from Orders
where OrderID IN (select OrderID from Orders where CustomerID = @CustomerID);

-- select * from Orders;
-- select * from OrderDetails;


-- 10. 
INSERT INTO 
Products (ProductName, Description, Price)
VALUES ('DVD Player', 'An old and vintage collection of Electrnoics',199.99)

--11. 
-- select * from Orders;
DECLARE @NewDate DATE;
DECLARE @ID INT;
SET @NewDate = '2023-02-01';
SET @ID = 8;

UPDATE Orders
SET OrderDate = @NewDate
where OrderID = @ID
-- select * from Orders;

-- 12. 

ALTER TABLE Customers
ADD [orders placed] INT;
UPDATE Customers
SET [orders placed] = 0
where [orders placed] is NULL
-- select * from Customers
UPDATE Customers
SET [orders placed] = (
    select COUNT(*)
    from Orders
    where Customers.CustomerID = Orders.CustomerID
)
where [orders placed] =0;

-- select * from Customers
-- 4. Joins:
-- 1. 
select o.OrderID , CONCAT(c.FirstName,' ',c.LastName) as Name 
from Orders o
inner join Customers c
on c.CustomerID = o.CustomerID

-- 2. 
select ProductName, Price * Quantity AS totalrevenue 
from Products
inner join  OrderDetails 
on Products.ProductID = OrderDetails.ProductID
where Products.Description like '%electronic%'

-- 3. 
select DISTINCT CONCAT(c.FirstName,' ',c.LastName) as Name, c.Email, c.Phone
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID;

-- 4. 
select TOP 1 p.ProductName
from Products p
inner join OrderDetails o
on p.ProductID = o.ProductID
group by p.ProductID ,p.ProductName,p.Description
having p.Description like "%electronic%"
order by count(*) desc

-- 5. 
select ProductName,Description from Products

--6. 
select CONCAT(c.FirstName,' ',c.LastName) as Name , ROUND(avg(o.TotalAmount),2) as avg
from Orders o 
inner join Customers c
on c.CustomerID = o.CustomerID
group by o.CustomerID, c.FirstName , c.LastName

-- 7. 
select TOP 1 o.OrderID, c.CustomerID, CONCAT(c.FirstName,' ',c.LastName) as Name, o.TotalAmount AS TotalRevenue
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

-- 8. 
-- select * from OrderDetails
select p.ProductName, count(*)
from Products p
inner join OrderDetails o
on p.ProductID = o.ProductID
group by p.ProductID ,p.ProductName,p.Description
having p.Description like "%electronic%"


-- 9. 
DECLARE @ProductName VARCHAR(50);
SET @ProductName = 'smartphone'

select c.CustomerID, CONCAT(c.FirstName,' ',c.LastName) as Name, o.OrderID
from Customers c
inner join Orders o 
on c.CustomerID = o.CustomerID
inner join OrderDetails od
on o.OrderID = od.OrderID
inner join Products p 
on od.ProductID = p.ProductID
where p.ProductName = @ProductName;

-- 10. 
DECLARE @StartDate DATE
DECLARE @EndDate DATE
SET @StartDate = '2023-01-01'
SET @EndDate = '2023-12-31'

select SUM(o.TotalAmount) TotalRevenue
from Orders o
where o.OrderDate between @StartDate AND @EndDate;

-- 5. Aggregate Functions and Subqueries:
-- 1. 
select * from Customers where [orders placed] = 0

-- 2. 
select sum(QuantityInStock) as [total number of products available] from Inventory

-- 3. 
select sum(TotalAmount) as [total revenue] from Orders

-- 4. 
DECLARE @categoryname VARCHAR(50)
SET @categoryname = 'Furniture'

select AVG(od.Quantity) AverageQuantityOrdered
from OrderDetails od
inner join Products p 
on od.ProductID = p.ProductID
where p.Description LIKE '%' + @categoryname + '%';


-- 5. 
DECLARE @CusID INT;
SET @CusID = 1;

select SUM(o.TotalAmount) [total revenue] from Orders o
inner join Customers c
on c.CustomerID = o.CustomerID
where c.CustomerID = @CusID


-- 6. 
select TOP 1 CONCAT(c.FirstName,' ',c.LastName) as Name,[orders placed]
from Customers c
order by [orders placed] desc

-- 7. 
-- select p.ProductName ,quantity
select TOP 1 p.ProductName ,quantity
from OrderDetails o
inner join Products p
on o.ProductID = p.ProductID
order by quantity desc

-- 8. 
select TOP 1 CONCAT(c.FirstName,' ',c.LastName) as Name,sum( o.TotalAmount)
from Customers c
inner join Orders o 
on c.CustomerID = o.CustomerID
inner join OrderDetails od 
on o.OrderID = od.OrderID
inner join Products p 
on od.ProductID = p.ProductID
where p.Description LIKE '%electronic%'
group by c.FirstName,c.LastName
order by sum( o.TotalAmount) desc

-- 9. 
select sum(o.TotalAmount)/sum(OrderDetails.Quantity) as [avg order value]from Orders o,OrderDetails

-- 10. 
select c.Customerid, CONCAT(c.FirstName,' ',c.LastName) as Name,count(o.OrderID) as ordercount
from Customers c
left join Orders o 
on c.Customerid = o.Customerid
group by c.Customerid, c.Firstname, c.Lastname