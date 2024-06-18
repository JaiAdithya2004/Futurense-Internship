#HAVING
CREATE DATABASE hav_db
USE hav_db

#Creating Tables and inserting Data into it 

#Creating and inserting data into the products,customersand orders Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    location VARCHAR(100)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    address VARCHAR(200)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



#Inserting Data into products Table
INSERT INTO products (product_id, product_name, price, stock, location) VALUES
(1, 'Mac', 80000.00, 5, 'Mumbai'),
(2, 'Samsung', 20000.00, 15, 'Mumbai'),
(3, 'Tablet', 30000.00, 25, 'Delhi'),
(4, 'Monitor', 10000.00, 30, 'Bangalore'),
(5, 'Mouse', 1500.00, 50, 'Chennai'),
(6, 'Pen-drive', 700.00, 40, 'Mumbai');


INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'Sourav', 28, 'Usalampatti'),
(2, 'Sriman', 32, 'Delhi'),
(3, 'Siva', 25, 'Bangalore'),
(4, 'Salim', 27, 'Chennai'),
(5, 'Manikam', 34, 'cochin'),
(6, 'Ravi', 30, 'Coimbatore');


INSERT INTO orders (order_id, customer_id, order_amount) VALUES
(1, 1, 15000.00),
(2, 2, 25000.00),
(3, 3, 8000.00),
(4, 4, 12000.00),
(5, 5, 22000.00),
(6, 6, 3000.00);

#Find the locations where the total stock of products is greater than 20
SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location
HAVING total_stock > 20;

#Find the customers who have placed orders with a total amount greater than 10000
SELECT customers.customer_id, customers.customer_name, SUM(orders.order_amount) AS total_amount
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING total_amount > 10000;

#Find the products that have a stock level between 10 and 20 and are located in Mumbai
SELECT * FROM products
WHERE stock BETWEEN 10 AND 20
AND location = 'Mumbai';
