USE pwskills;

CREATE TABLE customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(30),
City VARCHAR(30)
);
INSERT INTO customers
VALUES
(1,"John Smith","New York"),
(2,"Mary Johnson","Chicago"),
(3,"Peter Adams","Los Angeles"),
(4,"Nancy Miller","Houston"),
(5,"Robert White","Miami");

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount INT
);

INSERT INTO Orders
VALUES
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,6,'2024-10-12',400);

CREATE TABLE Payments(
PaymentID CHAR(6),
CustomerID INT,
PaymentDate DATE,
Amount INT 
);

INSERT INTO Payments
VALUES
("P001",1,'2024-10-02',250),
("P002",2,'2024-10-06',300),
("P003",3,'2024-10-11',450),
("P004",4,'2024-10-15',200);

CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(40),
ManagerID INT
);

INSERT INTO Employee
VALUES
(1,"Alex Green", NULL),
(2,"Brian Lee",1),
(3,"Carol Ray",1),
(4,"David Kim",2),
(5,"Eva Smith",2);

-- Retrieve all customers who have placed at least one order.
SELECT CustomerName, OrderID, OrderDate 
FROM Customers c
INNER JOIN Orders o
on c.customerID = o.CustomerID;

-- Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT c.CustomerID,CustomerName, OrderID, OrderDate 
FROM Customers c
LEFT JOIN Orders o
on c.customerID = o.CustomerID
ORDER BY c.CustomerID;

-- Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT CustomerName, OrderID, OrderDate, Amount
FROM customers c
RIGHT JOIN orders o
ON c.customerID = o.CustomerID;

-- Display all customers and orders, whether matched or not.
SELECT CustomerName, OrderID, OrderDate 
FROM Customers c
LEFT JOIN Orders o
on c.customerID = o.CustomerID
UNION
SELECT CustomerName, OrderID, OrderDate
FROM customers c
RIGHT JOIN orders o
ON c.customerID = o.CustomerID;

-- Find customers who have not placed any orders.
SELECT CustomerName 
FROM Customers c
LEFT JOIN Orders o
on c.customerID = o.CustomerID
WHERE OrderID IS NULL;

-- Retrieve customers who made payments but did not place any orders.
SELECT CustomerName, paymentID, OrderID
FROM Customers c 
LEFT JOIN Orders o
ON c.customerID = o.customerID
LEFT JOIN Payments p
ON c.customerID = p.customerID
WHERE paymentID IS NOT NULL AND
orderID IS NULL;

-- Generate a list of all possible combinations between Customers and Orders.
SELECT CustomerName, OrderID, OrderDate, Amount
FROM customers c
CROSS JOIN orders o;

-- Show all customers along with order and payment amounts in one table.
SELECT CustomerName, OrderID,paymentID, p.amount
FROM Customers c 
LEFT JOIN Orders o
ON c.customerID = o.customerID
LEFT JOIN Payments p
ON c.customerID = p.customerID;

-- Retrieve all customers who have both placed orders and made payments.
SELECT CustomerName, OrderID, paymentID,p.amount
FROM Customers c 
LEFT JOIN Orders o
ON c.customerID = o.customerID
LEFT JOIN Payments p
ON c.customerID = p.customerID
WHERE paymentID IS NOT NULL AND
orderID IS NOT NULL;

