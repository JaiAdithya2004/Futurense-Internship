#FUNCTIONS
#Functions in SQL are subprograms that return a single value and can be used in SQL statements

CREATE DATABASE func_db;
USE func_db;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_status VARCHAR(20),
    order_date DATE
);


CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);


INSERT INTO orders VALUES
(1, 101, 'Completed', '2024-06-01'),
(2, 102, 'Pending', '2024-06-02'),
(3, 101, 'Completed', '2024-06-03');

INSERT INTO payment VALUES
(1, 1, 100.00, '2024-06-01'),
(2, 3, 150.00, '2024-06-03');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 800.00),
(102, 'Tablet', 'Electronics', 300.00),
(103, 'Chair', 'Furniture', 150.00);

#Scalar Function to Calculate Total Revenue for Completed Orders

DELIMITER $$
CREATE FUNCTION total_revenue_completed_orders()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(p.amount)
    INTO total
    FROM orders o
    JOIN payment p ON o.order_id = p.order_id
    WHERE o.order_status = 'Completed';
    RETURN total;
END$$
DELIMITER ;

SELECT total_revenue_completed_orders() AS total_revenue;


#Scalar Function to Get Product Price by Product ID

DELIMITER $$
CREATE FUNCTION get_product_price(p_product_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(10, 2);
    SELECT p.price
    INTO price
    FROM products p
    WHERE p.product_id = p_product_id;
    RETURN price;
END$$
DELIMITER ;

SELECT get_product_price(101) AS product_price;