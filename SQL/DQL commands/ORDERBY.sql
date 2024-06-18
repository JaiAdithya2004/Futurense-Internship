#ORDERBY
CREATE DATABASE ord_db
USE ord_db

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

#Creating the orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
#Inserting  Data into products,customerand orders Table
INSERT INTO products (product_id, product_name, price, stock, location) VALUES
(1, 'Armani', 5000.00, 10, 'Mumbai'),
(2, 'Titan', 15000.00, 20, 'Delhi'),
(3, 'CASIO', 25000.00, 15, 'Mumbai'),
(4, 'TOMMYHILFIGHER', 35000.00, 5, 'Delhi'),
(5, 'POLICE', 45000.00, 8, 'Bangalore'),
(6, 'Richard Miller', 55000.00, 12, 'Mumbai');


INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'Pugazh', 25, 'Mumbai'),
(2, 'Bala', 30, 'Delhi'),
(3, 'Shivangi', 35, 'Mumbai'),
(4, 'Bhaskar', 40, 'Delhi'),
(5, 'Ashwin', 45, 'Bangalore'),
(6, 'Karthick', 50, 'Mumbai');


INSERT INTO orders (order_id, customer_id, order_amount) VALUES
(1, 1, 10000.00),
(2, 2, 20000.00),
(3, 3, 30000.00),
(4, 4, 15000.00),
(5, 5, 25000.00),
(6, 6, 5000.00);



#Retri all products ordered by their price in descending order
SELECT * FROM products
ORDER BY price DESC;

#etrieve allcustomers ordered by their age in ascending order
SELECT * FROM customers
ORDER BY age ASC;

#Rtrieve all orders ordered by the order amount in descending order and then by the customer name in ascending order
SELECT orders.order_id, orders.customer_id, orders.order_amount, customers.customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY orders.order_amount DESC, customers.customer_name ASC;
