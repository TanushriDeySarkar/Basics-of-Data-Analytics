USE pwskills;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

-- Q6. Write a CTE to calculate the total revenue for each product:(Revenues = Price × Quantity), and return only products where  revenue > 3000.
WITH Revenue_CTE AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        SUM(p.Price * s.Quantity) AS Total_Revenue
    FROM Products p
    JOIN Sales s
        ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT *
FROM Revenue_CTE
WHERE Total_Revenue > 3000;

-- Q7. Create a view named that shows:Category, TotalProducts, AveragePrice
CREATE VIEW Category_Summary AS
SELECT 
    Category,
    COUNT(*) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

-- Q8. Create an updatable view containing ProductID, ProductName, and Price.Then update the price of ProductID = 1 using the view
CREATE VIEW Product_View AS
SELECT ProductID, ProductName, Price
FROM Products;

UPDATE Product_View
SET Price = 1500
WHERE ProductID = 1;

-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category
DELIMITER $$

CREATE PROCEDURE GetProductsByCategory(IN cat_name VARCHAR(50))
BEGIN
    SELECT *
    FROM Products
    WHERE Category = cat_name;
END $$

DELIMITER ;

CALL GetProductsByCategory('Electronics');

-- Q10. Create an AFTER DELETE trigger on the table that archives deleted product rows into a new table . The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.

CREATE TABLE Products_Archive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER after_product_delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO Products_Archive (
        ProductID, ProductName, Category, Price, DeletedAt
    )
    VALUES (
        OLD.ProductID, 
        OLD.ProductName, 
        OLD.Category, 
        OLD.Price, 
        NOW()
    );
END $$

DELIMITER ;
