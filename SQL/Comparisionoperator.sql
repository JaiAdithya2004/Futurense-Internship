#COMPARISION OPERATOR
CREATE DATABASE comp_db
USE comp_db;

#Creating a product,order and customer table to perform the comparision operations and adding data to it
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    email VARCHAR(100)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

#Inserting data into the products table
INSERT INTO products (product_id, product_name, price, created_at, stock) VALUES
(1, 'Frdge', 150000.00, '2024-01-15', 50),
(2, 'AC', 90000.00, '2024-02-20', 30),
(3, 'TV', 20000.00, '2024-03-10', 20),
(4, 'washing machine', 12000.00, '2024-04-05', 10),
(5, 'Dishwasher', 50000.00, '2024-05-15', 5);

#Inserting data into the customers table
INSERT INTO customers (customer_id, customer_name, age, email) VALUES
(1, 'Arjun', 28, 'arjun@example.com'),
(2, 'ajay', 30, 'ajay@example.com'),
(3, 'adithya', 35, 'adithya@example.com'),
(4, 'aditi', 40, 'aditi@example.com'),
(5, 'Rocky', 30, 'rocky@example.com');

#Inserting data into the orders table
INSERT INTO orders (order_id, customer_id, order_amount, order_date) VALUES
(1, 1, 15000.00, '2024-01-20'),
(2, 2, 9000.00, '2024-02-25'),
(3, 3, 5000.00, '2024-03-15'),
(4, 4, 20000.00, '2024-04-10'),
(5, 5, 10000.00, '2024-05-20');

#retrieving all products whose price is greater than or equal to 50000
SELECT * FROM products
WHERE price >= 50000;

#finding the customers whose age is not equal to 30
SELECT * FROM customers
WHERE age <> 30;

#retrieveing  orders where the order amount is less than or equal to 10000
SELECT * FROM orders
WHERE order_amount <= 10000;
