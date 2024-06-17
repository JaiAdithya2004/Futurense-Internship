#ARTHIMETIC OPERATOR
CREATE DATABASE Operators_db
USE Operators_db

#Before performing the Operations first we have to create a Table products and ADD data to it
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT
);

#Adding Values to it 
INSERT INTO products (product_id, product_name, price, created_at, stock) VALUES
(1, 'Pencil', 150.00, '2024-01-15', 50),
(2, 'Pen', 90.00, '2024-02-20', 30),
(3, 'chair', 200.00, '2024-03-10', 20),
(4, 'Table', 120.00, '2024-04-05', 10),
(5, 'Laptop', 50.00, '2024-05-15', 5);

#calculating total revenue by adding 
SELECT SUM(price) AS total_revenue
FROM products;

#finding the products that us price divisible by 3 
SELECT *
FROM products
WHERE price % 3 = 0;

#Query to subtract the average price of product and show as price_difference:
SELECT product_id, product_name, price, 
       price - (SELECT AVG(price) FROM products) AS price_difference
FROM products;
