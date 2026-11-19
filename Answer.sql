
-- =====================================================
-- WEEK 7 ASSIGNMENT: DATABASE DESIGN AND NORMALIZATION
-- =====================================================
CREATE DATABASE IF NOT EXISTS week7_normalization;

USE week7_normalization;

-- =====================================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- =====================================================

-- Drop the table if it already exists
DROP TABLE IF EXISTS ProductDetail_1NF;

-- Create a new table where each row contains one product
CREATE TABLE ProductDetail_1NF (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID, Product)
);

-- Insert normalized records into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Display the normalized table
SELECT * FROM ProductDetail_1NF;


-- =====================================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- =====================================================

-- Partial dependency:
-- CustomerName depends only on OrderID,
-- not on the complete composite key (OrderID, Product).
--
-- To achieve 2NF, separate Orders and OrderItems.


-- Drop existing tables if they exist
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

-- Create Orders table to store order information
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

-- Create OrderItems table to store products and quantities
CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert records into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert records into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Display records from Orders
SELECT * FROM Orders;

-- Display records from OrderItems
SELECT * FROM OrderItems;

-- Display combined order information using JOIN
SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID;
