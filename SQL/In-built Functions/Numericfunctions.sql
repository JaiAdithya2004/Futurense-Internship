#NUMERIC FUNCTIONS
CREATE DATABASE numeric_functions_demo;
USE numeric_functions_demo;

#Before seeing the Numeric functions lets creaate a table to see the various operations in 
CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value INT
);
INSERT INTO numbers (value) VALUES (10), (15), (20), (25), (NULL);

#Difference between AVG() and COUNT() functions
#AVG(): Calculates the average value of a numeric column.
#COUNT(): Counts the number of rows in a table or the number of non-NULL values in a column.
SELECT AVG(value) AS average_value FROM numbers;
#output:17.5000
SELECT COUNT(value) AS count_values FROM numbers;
#output:4

#Calculate the square root of 144
#SQRT(): Calculates the square root of a number.
SELECT SQRT(144) AS square_root;
#output:12

#Round the number 3.14159 to two decimal places
#ROUND(): Rounds a number to a specified number of decimal places.
SELECT ROUND(3.14159, 2) AS rounded_number;
#output:3.14

#Purpose of MIN() and MAX() functions with GROUP BY clause
#MIN(): Finds the minimum value in a column or expression.
#MAX(): Finds the maximum value in a column or expression.
#Lets create a new table and add data to know how it works
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    revenue DECIMAL(10, 2)
);
INSERT INTO sales (product, revenue) VALUES
('A', 100.50),
('B', 150.75),
('A', 120.00),
('B', 180.25);
SELECT product, MIN(revenue) AS min_revenue, MAX(revenue) AS max_revenue
FROM sales
GROUP BY product;
#output MIN:120.00,MAX:150.75

 #Calculate the power of 2 raised to the 5th power
#POWER(): Raises a number to the power of another number.
SELECT POWER(2, 5) AS power_value;
#output:32

