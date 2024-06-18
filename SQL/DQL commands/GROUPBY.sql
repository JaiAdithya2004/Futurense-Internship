#GROUPBY
CREATE DATABASE GRP_db
USE GRP_db

#Creating the products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    location VARCHAR(100)
);

#Creating the customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    address VARCHAR(200)
);
#Inserting data into products,customrs Table
INSERT INTO products (product_id, product_name, price, stock, location) VALUES
(1, ' JBL Headphones', 5000, 10, 'Mumbai'),
(2, 'Sony', 15000, 20, 'Delhi'),
(3, 'Airpods gen 2', 25000, 15, 'Mumbai'),
(4, 'MX1000', 35000, 5, 'Delhi'),
(5, 'Skull candy', 45000, 8, 'Bangalore'),
(6, 'Airmax', 55000, 12, 'Mumbai');


INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'Arthi', 25, 'Mumbai'),
(2, 'Bobby', 30, 'Delhi'),
(3, 'Chidharath', 35, 'Mumbai'),
(4, 'Dhanush', 40, 'Delhi'),
(5, 'Sunny', 45, 'Bangalore'),
(6, 'Cherry', 50, 'Mumbai');


#Find the total stock of products for each location
SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location;

#Find the number of products in each price range
SELECT 
CASE 
WHEN price BETWEEN 0 AND 10000 THEN '0-10000'
WHEN price BETWEEN 10001 AND 20000 THEN '10001-20000'
WHEN price BETWEEN 20001 AND 50000 THEN '20001-50000'
ELSE '50001+' 
END AS price_range,
COUNT(*) AS product_count
FROM products
GROUP BY price_range;

#Find the average age of customers grouped by their location (based on the address)
SELECT address AS location, AVG(age) AS average_age
FROM customers
GROUP BY address;
