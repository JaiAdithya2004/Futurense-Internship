#TRIGGERS
#Triggers in SQL are special types of stored procedures that automatically execute or fire when certain events occur in the database, such as INSERT, UPDATE, or DELETE operations on a table. Triggers can be used to enforce business rules, validate data, or update audit logs
#Lets see with cretion of databases and add tsbles to it 


CREATE DATABASE AutoDealership

USE AutoDealership

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    VehicleID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE SalesLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    VehicleID INT,
    SaleID INT,
    ChangeType VARCHAR(10),
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#Now adding sample data to the Table by creatin trigger whch automatically inserts a record into the SalesLog table whenever a new sale is added to the Sales table

DELIMITER //

CREATE TRIGGER after_sale_insert
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    INSERT INTO SalesLog (VehicleID, SaleID, ChangeType)
    VALUES (NEW.VehicleID, NEW.SaleID, 'INSERT');
END //

DELIMITER ;

#Insert data into  tables
INSERT INTO Vehicles (VehicleID, Make, Model, Year, Price) VALUES (1, 'Toyota', 'Camry', 2021, 24000.00);
INSERT INTO Vehicles (VehicleID, Make, Model, Year, Price) VALUES (2, 'Honda', 'Civic', 2022, 22000.00);


INSERT INTO Sales (SaleID, VehicleID, SaleDate, SalePrice) VALUES (1, 1, '2024-06-24', 23000.00);


SELECT * FROM SalesLog;



