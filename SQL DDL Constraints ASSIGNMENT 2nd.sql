CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(50),
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

ALTER TABLE Orders
ADD order_quantity INT;

ALTER TABLE Orders
RENAME TO sales_orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice Johnson', 'Electronics', 'Laptop', '1234567890', 1),
(2, 'Bob Smith', 'Furniture', 'Desk', '2345678901', 2),
(3, 'Charlie Lee', 'Clothing', 'T-shirt', '3456789012', 3),
(4, 'Diana Gomez', 'Electronics', 'Smartphone', '4567890123', 1),
(5, 'Evan Wang', 'Books', 'Novel', '5678901234', 4),
(6, 'Fiona Kim', 'Clothing', 'Jeans', '6789012345', 2),
(7, 'George Patel', 'Furniture', 'Chair', '7890123456', 5),
(8, 'Hannah Tran', 'Groceries', 'Apples', '8901234567', 10),
(9, 'Ian Wong', 'Groceries', 'Bread', '9012345678', 2),
(10, 'Jill Brown', 'Electronics', 'Tablet', '0123456789', 1);

SELECT Customer_name, Ordered_item FROM sales_orders;

UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 1;

DROP TABLE sales_orders;
USE Sales;
SELECT * FROM sales_orders;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(50),
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

ALTER TABLE Orders
ADD order_quantity INT;

ALTER TABLE Orders
RENAME TO sales_orders;

SELECT * FROM sales_orders LIMIT 0, 1000;