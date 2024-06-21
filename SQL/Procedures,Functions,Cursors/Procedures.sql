#PROCEDURES
#Used for performing the complex queries and Procedures, also known as stored procedures, are a set of SQL statements that are stored in the database and can be executed as needed
#Lets see it through some example
#Create the database
CREATE DATABASE sample_db

USE sample_db;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_status VARCHAR(20),
    order_date DATE
);

-- Create payment table
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

#Function to Calculate Total Revenue for Completed Orders
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
SELECT total_revenue_completed_orders() AS total_revenue

#Function to Calculate Total Revenue for Completed Orders 
SELECT total_revenue_completed_orders() AS total_revenue

#Procedure with IN Parameter to Retrieve Product Details
DELIMITER $$
CREATE PROCEDURE get_product_details(IN p_product_id INT)
BEGIN
    SELECT * FROM products WHERE product_id = p_product_id;
END$$
DELIMITER ;

CALL get_product_details(5);

#Procedure with OUT Parameter to Get Count of Products

DELIMITER $$
CREATE PROCEDURE get_product_count(OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count FROM products;
END$$
DELIMITER ;
SET @product_count = 0;
CALL get_product_count(@product_count);
SELECT @product_count AS product_count;

#Use SUM() to Calculate Total Price of Electronics Products

SELECT SUM(price) AS total_price
FROM products
WHERE category = 'Electronics';

#Cursor to Iterate Through Products and Print Product Name

DELIMITER $$
CREATE PROCEDURE print_product_names()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE p_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT product_name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO p_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT p_name;
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

CALL print_product_names();

