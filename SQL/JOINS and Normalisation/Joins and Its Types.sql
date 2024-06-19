#JOINS AND ITS TYPES 
#Joins help to combine two or more used to combine rows from two or more tables based on a related column between the tables
#There are Six types of JOINS listed below with an example
#Before seeing its functionality lets create a database and Insert the Samnple data
CREATE DATABASE join_db
USE join_db
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT
);
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100)
);
CREATE TABLE EmployeeProjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    project_id INT
);
#We have cretaed tables above now lets insert data for it
INSERT INTO Employees (name, department_id) VALUES
('Jai ', 1),
('Adithya', 2),
('Shravanth', 1),
('CV', 3);

INSERT INTO Departments (department_name) VALUES
('HR'),
('Engineering'),
('Rreserch Analyst');

INSERT INTO Projects (project_name) VALUES
('Project Moonshot'),
('Project Phoenix '),
('Project Spark');

INSERT INTO EmployeeProjects (employee_id, project_id) VALUES
(1, 101),
(1, 201),
(2, 100),
(3, 301),
(4, 108);

#Now lets see the Types of JOINS with example
#Inner Join
#Returns records that have matching values in both tables

SELECT Employees.name, Departments.department_name
FROM Employees
INNER JOIN Departments ON Employees.department_id = Departments.department_id;

#Left (Outer) Join
#Returns all records from the left table and right table which are matching thwere can be NULL from the right side if there is no match.
SELECT Employees.name, Departments.department_name
FROM Employees
LEFT JOIN Departments ON Employees.department_id = Departments.department_id;

# Right (Outer) Join
#Returns all records from the right table and left table which are matching there can be NULL from the left side when there is no match

SELECT Employees.name, Departments.department_name
FROM Employees
RIGHT JOIN Departments ON Employees.department_id = Departments.department_id;

# Full(Outer)Join
#Returns all records when there is a match in left or right table. 
SELECT Employees.name, Departments.department_name
FROM Employees
LEFT JOIN Departments ON Employees.department_id = Departments.department_id
UNION
SELECT Employees.name, Departments.department_name
FROM Employees
RIGHT JOIN Departments ON Employees.department_id = Departments.department_id;

#Cross Join
#it means that every row from one table is paired with every row from the other table

SELECT Employees.name, Projects.project_name
FROM Employees
CROSS JOIN Projects;

#Self Join
#its a normal join but the table is joined with itself

SELECT E1.name AS Employee, E2.name AS Manager
FROM Employees E1
JOIN Employees E2 ON E1.department_id = E2.department_id
WHERE E1.employee_id != E2.employee_id;