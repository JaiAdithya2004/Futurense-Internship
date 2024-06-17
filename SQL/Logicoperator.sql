#LOGICAL OPERATOR
CREATE DATABASE logi_db
USE logi_db;

#Creating product,customers,order taable and adding values to it
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT,
    location VARCHAR(100)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    order_date DATE,
    payment_mode VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

#Inserting data into the products table
INSERT INTO products (product_id, product_name, price, created_at, stock, location) VALUES
(1, 'KTM', 150000.00, '2024-01-15', 50, 'Mumbai'),
(2, 'RE', 90000.00, '2024-02-20', 30, 'Delhi'),
(3, 'TRIUMPH', 20000.00, '2024-03-10', 20, 'Mumbai'),
(4, 'BMW', 12000.00, '2024-04-05', 15, 'Mumbai'),
(5, 'DUCATI', 50000.00, '2024-05-15', 5, 'Chennai');

#Inserting data into the customers table
INSERT INTO customers (customer_id, customer_name, age, email, city) VALUES
(1, 'Arjun', 28, 'arjun@example.com', 'Mumbai'),
(2, 'Ajay', 30, 'ajay@example.com', 'Delhi'),
(3, 'Adithya', 35, 'adithya@example.com', 'Mumbai'),
(4, 'Shravanth', 40, 'cv@example.com', 'Bangalore'),
(5, 'Rocky', 30, 'rocky@example.com', 'Mumbai');

#Inserting  data into the orders table
INSERT INTO orders (order_id, customer_id, order_amount, order_date, payment_mode, status) VALUES
(1, 1, 15000.00, '2024-01-20', 'credit_card', 'completed'),
(2, 2, 9000.00, '2024-02-25', 'upi', 'pending'),
(3, 3, 5000.00, '2024-03-15', 'net_banking', 'completed'),
(4, 4, 22000.00, '2024-04-10', 'debit_card', 'completed'),
(5, 5, 10000.00, '2024-05-20', 'upi', 'completed');

#retrieve the products that are located in Mumbai and have a stock level greater than 10
SELECT * FROM products
WHERE location = 'Mumbai' AND stock > 10;

# finding the customers who are either from Mumbai or have placed an order with an amount greater than 20000
SELECT * FROM customers
WHERE city = 'Mumbai'
OR customer_id IN (SELECT customer_id FROM orders WHERE order_amount > 20000);

#retrieve the orders where the payment mode is not 'upi' and the status is 'completed'
SELECT * FROM orders
WHERE payment_mode <> 'upi' AND status = 'completed';
