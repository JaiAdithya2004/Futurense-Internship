#VIEW Commands
#A view in SQL is a virtual table that is based on the result set of a query. Views do not store the data themselves but present data stored in other tables
#Lets see with example by creating a database and add some tables to it

CREATE DATABASE TollBoothSystem
USE TollBoothSystem


CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    LicensePlate VARCHAR(20),
    VehicleType VARCHAR(50)
);

CREATE TABLE Tolls (
    TollID INT PRIMARY KEY,
    Location VARCHAR(100),
    TollRate DECIMAL(10, 2)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    VehicleID INT,
    TollID INT,
    TransactionDate DATETIME,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (TollID) REFERENCES Tolls(TollID)
);


INSERT INTO Vehicles (VehicleID, LicensePlate, VehicleType) VALUES (1, 'ABC123', 'Car');
INSERT INTO Vehicles (VehicleID, LicensePlate, VehicleType) VALUES (2, 'XYZ789', 'Truck');


INSERT INTO Tolls (TollID, Location, TollRate) VALUES (1, 'Highway 101', 2.50);
INSERT INTO Tolls (TollID, Location, TollRate) VALUES (2, 'Bridge A', 3.75);


INSERT INTO Transactions (TransactionID, VehicleID, TollID, TransactionDate) VALUES (1, 1, 1, '2024-06-24 08:30:00');
INSERT INTO Transactions (TransactionID, VehicleID, TollID, TransactionDate) VALUES (2, 2, 2, '2024-06-24 09:00:00');

#Creating Views
CREATE VIEW AllTransactions AS
SELECT 
    t.TransactionID,
    v.LicensePlate,
    v.VehicleType,
    tol.Location,
    tol.TollRate,
    t.TransactionDate
FROM 
    Transactions t
JOIN 
    Vehicles v ON t.VehicleID = v.VehicleID
JOIN 
    Tolls tol ON t.TollID = tol.TollID;
    
#Total Revenue by Toll Location
CREATE VIEW TollRevenue AS
SELECT 
    tol.Location,
    SUM(tol.TollRate) AS TotalRevenue
FROM 
    Transactions t
JOIN 
    Tolls tol ON t.TollID = tol.TollID
GROUP BY 
    tol.Location;
    
#Retrieve All Transactions with Details
SELECT * FROM AllTransactions;

#Retrieve Total Revenue by Toll Location

SELECT * FROM TollRevenue;

