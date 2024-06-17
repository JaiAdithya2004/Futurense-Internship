#creating a new Database work_db
CREATE DATABASE work_db;
USE work_db;
#Creating a new Table employee
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);
#Adding  10 rows of data to the employee table
INSERT INTO employee (id, name, position, salary) VALUES
(1, 'Alice Smith', 'Software Engineer', 85000.00),
(2, 'Bob Johnson', 'Data Scientist', 90000.00),
(3, 'Charlie Brown', 'Product Manager', 95000.00),
(4, 'David Wilson', 'UX Designer', 70000.00),
(5, 'Eve Davis', 'HR Manager', 75000.00),
(6, 'Frank Miller', 'Marketing Specialist', 65000.00),
(7, 'Grace Lee', 'DevOps Engineer', 80000.00),
(8, 'Henry Walker', 'Sales Representative', 60000.00),
(9, 'Ivy Young', 'Customer Support', 55000.00),
(10, 'Jack White', 'Finance Analyst', 72000.00);


#Inserting new values into the Employee table
INSERT INTO employee (id, name, position, salary)
VALUES (11, 'John Doe', 'Electrician', 75000.00);

#Updating the salary of the employee with id = 4:
UPDATE employee
SET salary = 80000.00
WHERE id = 4;

#Delete the row from employee where id = 6:
DELETE FROM employee
WHERE id = 6;

#creating a table students:
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course_id INT
);

#Created another table courses and setting up a foreign key constraint in the students table:
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

#Alterig the students table and adding  the foreign key constraint:
ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses(course_id);

#Insert some data into the students table while respecting the constraints:

INSERT INTO courses (course_id, course_name) VALUES (1, 'AI');
INSERT INTO courses (course_id, course_name) VALUES (2, 'Robotics');


INSERT INTO students (student_id, name, course_id) VALUES (1, 'Shravnath', 1);
INSERT INTO students (student_id, name, course_id) VALUES (2, 'Jai', 2);

#create a SELECT query that retrieves products based on numeric and date conditions.before that we have to create a table for products and insert some values or data to the table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT
);

#Inserting some values 
INSERT INTO products (product_id, product_name, price, created_at, stock) VALUES
(1, 'Iphone', 150.00, '2024-01-15', 50),
(2, 'Xbox', 90.00, '2024-02-20', 30),
(3, 'PS5', 200.00, '2024-03-10', 20),
(4, 'Macbook', 120.00, '2024-04-05', 10),
(5, 'ipad', 50.00, '2024-05-15', 5);

#create a SELECT query that retrieves products based on numeric and date conditions:
SELECT * FROM products
WHERE price > 100 AND created_at BETWEEN '2024-01-01' AND '2024-06-30';

#Update a record and set the last_updated column to the current datetime:
UPDATE products
SET last_updated = NOW()
WHERE product_id = 1;

#Delete products with stock below a certain threshold:
DELETE FROM products
WHERE stock < 10;
