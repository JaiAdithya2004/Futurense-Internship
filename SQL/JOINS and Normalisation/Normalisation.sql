#NORMALIZATION AND ITS TYPE
#Normalization is the process of organizing the columnsand tables of database to reduce data redundancy and improve data integrity and its quality it can be achieved using breaking larger tables into smallr ones
#There are three types of Normal forms before seeing its functionality lets create a database and create a tables insert some dataa
#Now we will create UNnormalized table its nothing but  a table which is not organised 
CREATE DATABASE University;
USE University;

CREATE TABLE Unnormalized (
    StudentID INT,
    StudentName VARCHAR(100),
    CourseID INT,
    CourseName VARCHAR(100),
    InstructorID INT,
    InstructorName VARCHAR(100)
);

INSERT INTO Unnormalized (StudentID, StudentName, CourseID, CourseName, InstructorID, InstructorName)
VALUES
(1, 'Shravan', 101, 'AI', 201, 'Swaminathan'),
(2, 'Shubam', 102, 'Data Analytics', 202, 'Senthil'),
(1, 'Ashik', 103, 'SAAP', 203, 'Saravanan'),
(3, 'Amir Sharma', 101, 'Fashion Designing', 201, 'Prabhu'),
(2, 'Prabjoth', 103, 'Architecture', 203, 'Sourav');

#First Normal Form (1NF)
# table already meets the requirements for 1NFno changes are neededEa ch column contains atomic values that means each one have single values

#2NF Normalisation lets create a new Tables for it
#we need to eliminate partial dependencies. This involves breaking down the table into smaller tables and ensuring that non-key attributes are fully functionally dependent on the primary key.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES
(1, '2024-06-01', 101),
(2, '2024-06-02', 102),
(3, '2024-06-03', 103);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(255)
);

INSERT INTO Customers (CustomerID, CustomerName, CustomerAddress)
VALUES
(101, 'Arivu', 'NAVA INDIA'),
(102, 'Harish', 'Sai baba colony'),
(103, 'Sarvesh', 'Pellamedu');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductPrice DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, ProductPrice)
VALUES
(201, 'Laptop', 999.99),
(202, 'Mouse', 19.99),
(203, 'Keyboard', 49.99),
(204, 'Monitor', 199.99),
(205, 'USB Cable', 9.99);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 201, 1),
(1, 202, 2),
(2, 203, 1),
(3, 204, 1),
(3, 205, 3);

#IN above example

#Orders Table: Stores the order-specific information such as OrderID, OrderDate, and CustomerID.
#Customers Table: Stores customer-specific information such as CustomerID, CustomerName, and CustomerAddress.
#Products Table: Stores product-specific information such as ProductID, ProductName, and ProductPrice.
#OrderDetails Table: Resolves the many-to-many relationship between orders and products, and stores details about the products included in each order.

#3NF Normalization
#3NF, we need to eliminate transitive dependences that non-key attributes should not depend on other non-key attributes
CREATE TABLE Specialties (
    SpecialtyID INT PRIMARY KEY,
    SpecialtyName VARCHAR(100)
);

INSERT INTO Specialties (SpecialtyID, SpecialtyName)
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');
#Updating Doctors Table to reference Specialties Tablee
CREATE TABLE Doctors_3NF (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    SpecialtyID INT,
    FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
);

INSERT INTO Doctors_3NF (DoctorID, DoctorName, SpecialtyID)
VALUES
(101, 'Manohar', 1),
(102, 'Cherian', 2),
(103, 'Senthilvel', 3);
#Final Structure and Data Insertion
#Patients Table:
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    PatientAddress VARCHAR(255)
);

INSERT INTO Patients (PatientID, PatientName, PatientAddress)
VALUES
(1, 'Kannamal', '123 Elm St'),
(2, 'Venketesh', '456 Oak St'),
(3, 'Mani', '789 Pine St');
#Specialties Table:

CREATE TABLE Specialties (
    SpecialtyID INT PRIMARY KEY,
    SpecialtyName VARCHAR(100)
);

INSERT INTO Specialties (SpecialtyID, SpecialtyName)
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');
#Doctors Table:

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    SpecialtyID INT,
    FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
);

INSERT INTO Doctors (DoctorID, DoctorName, SpecialtyID)
VALUES
(101, 'Manohar', 1),
(102, 'Cherian', 2),
(103, 'Senthilvel', 3);
#Treatments Table:

CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(100),
    TreatmentDate DATE,
    TreatmentCost DECIMAL(10, 2),
    PatientID INT,
    DoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Treatments (TreatmentID, TreatmentName, TreatmentDate, TreatmentCost, PatientID, DoctorID)
VALUES
(201, 'Bypass Surgery', '2024-06-01', 15000.00, 1, 101),
(202, 'Brain Surgery', '2024-06-02', 20000.00, 2, 102),
(203, 'Angioplasty', '2024-06-03', 10000.00, 3, 101),
(204, 'Knee Surgery', '2024-06-04', 12000.00, 1, 103);

#Patients Table: Contains patient-specific information.
#Specialties Table: Contains unique specialties.
#Doctors Table: Contains doctor-specific information with a foreign key referencing the specialties table.
#Treatments Table: Contains treatment-specific information with foreign keys referencing patients and doctors.

#BCNF(Boyce-Codd Normal Form)
#Its the advance version of 3NF
#For every functional dependencies there should be a SUPERKEY
#Lets see with an example
CREATE TABLE TaxRecords (
    CitizenID INT,
    CitizenName VARCHAR(100),
    TaxYear INT,
    TaxAmount DECIMAL(10, 2),
    TaxOffice VARCHAR(100),
    OfficerName VARCHAR(100)
);

INSERT INTO TaxRecords (CitizenID, CitizenName, TaxYear, TaxAmount, TaxOffice, OfficerName)
VALUES
(1, 'Anand', 2022, 1500.00, 'North Office', 'Swami'),
(2, 'Chidharth', 2022, 1200.00, 'East Office', 'Prabhu'),
(3, 'Sunny', 2023, 1800.00, 'North Office', 'Dyanand'),
(4, 'Prabhjoth', 2023, 1400.00, 'West Office', 'Dinesh'),
(1, 'Sourav', 2023, 1600.00, 'North Office', 'Mahesh');

#Using 2NF elimainating Partial Dependencies
CREATE TABLE Citizens (
    CitizenID INT PRIMARY KEY,
    CitizenName VARCHAR(100)
);

INSERT INTO Citizens (CitizenID, CitizenName)
VALUES
(1, 'Anand'),
(2, 'Chidharth'),
(3, 'Sunny'),
(4, 'Prabhjoth');

CREATE TABLE Taxes (
    CitizenID INT,
    TaxYear INT,
    TaxAmount DECIMAL(10, 2),
    TaxOffice VARCHAR(100),
    OfficerName VARCHAR(100),
    PRIMARY KEY (CitizenID, TaxYear)
);

INSERT INTO Taxes (CitizenID, TaxYear, TaxAmount, TaxOffice, OfficerName)
VALUES
(1, 2022, 1500.00, 'North Office', 'Swami'),
(2, 2022, 1200.00, 'East Office', 'Prabhu'),
(3, 2023, 1800.00, 'North Office', 'Dyanand'),
(4, 2023, 1400.00, 'West Office', 'Dinesh'),
(1, 2023, 1600.00, 'North Office', 'Swami');

#Third Normal Form (3NF)
#Removing dependencies


CREATE TABLE Offices (
    TaxOffice VARCHAR(100),
    OfficerName VARCHAR(100),
    PRIMARY KEY (TaxOffice)
);

INSERT INTO Offices (TaxOffice, OfficerName)
VALUES
('North Office', 'Swami'),
('East Office', 'Prabhu'),
('West Office', 'Dinesh');
#Updating Taxes Table:

CREATE TABLE Taxes_3NF (
    CitizenID INT,
    TaxYear INT,
    TaxAmount DECIMAL(10, 2),
    TaxOffice VARCHAR(100),
    PRIMARY KEY (CitizenID, TaxYear),
    FOREIGN KEY (TaxOffice) REFERENCES Offices(TaxOffice)
);

INSERT INTO Taxes_3NF (CitizenID, TaxYear, TaxAmount, TaxOffice)
VALUES
(1, 2022, 1500.00, 'North Office'),
(2, 2022, 1200.00, 'East Office'),
(3, 2023, 1800.00, 'North Office'),
(4, 2023, 1400.00, 'West Office'),
(1, 2023, 1600.00, 'North Office');

#Now Taxes_3NF table is already in 3NF and does not have any non-trivial functional dependencies where a non-super key determines another non-key attribute it is also in BCNF
#Citizens Table: Stores citizen-specific information
#Offices Table: Stores office-specific information and is in BCNF
#Taxes Table: Stores tax records, references citizens and offices, and is in BCNF by this we can sayensured that our database is in BCnf eliminating all redundancy and potential anomalies due to functional dependencies







