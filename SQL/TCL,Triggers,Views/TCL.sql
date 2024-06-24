#Transaction Control Language (TCL) 
#It helps to control the transactions in the database tranasction is nothing but the commands and query performed in the database
#There are important TCL commands 
#COMMIT:command is used to save all the changes 
#ROLLBACK:used to undo the changes made during the transaction
#SAVEPOINT:It used to set a point within a transaction 
#SET TRANSACTION:used to set properties for the current transaction
#Lets see the example using Example database 

CREATE DATABASE MedicalCenter

USE MedicalCenter


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(200)
);

CREATE TABLE MedicalStaff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    StaffID INT,
    AppointmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (StaffID) REFERENCES MedicalStaff(StaffID)
);
#Starting the transaction
START TRANSACTION

#Inserting data into Patients table
INSERT INTO Patients (PatientID, Name, Age, Address) VALUES (1, 'Jai adithya', 30, 'Racecourse');
INSERT INTO Patients (PatientID, Name, Age, Address) VALUES (2, 'Shravanth', 25, 'NAVAIndia');

#Insert data into MedicalStaff table
INSERT INTO MedicalStaff (StaffID, Name, Position) VALUES (1, 'Manohar', 'Doctor');
INSERT INTO MedicalStaff (StaffID, Name, Position) VALUES (2, 'Latha', 'Nurse');

#Commiting  the transaction to save the changes
COMMIT

#Using ROLLBACK
START TRANSACTION;

#Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, StaffID, AppointmentDate) VALUES (1, 1, 1, '2024-07-01');
INSERT INTO Appointments (AppointmentID, PatientID, StaffID, AppointmentDate) VALUES (2, 2, 2, '2024-07-02');

#Rollback the transaction to undo the changes
ROLLBACK


#Using SAVEPOINT
#Start a transaction
START TRANSACTION

#Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, StaffID, AppointmentDate) VALUES (3, 1, 1, '2024-07-03');

#Setting up  a savepoint
SAVEPOINT Savepoint1

#Inserting  more data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, StaffID, AppointmentDate) VALUES (4, 2, 2, '2024-07-04');

#Rollback to the savepoint, undoing the last insert
ROLLBACK TO Savepoint1

#Commit the transaction to save the changes up to the savepoint
COMMIT


#Using SET TRANSACTION

#Set transaction properties (isolation level)
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

#Start a transaction
START TRANSACTION

#Insert data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, StaffID, AppointmentDate) VALUES (5, 1, 1, '2024-07-05');
#commit the transaction to save the changes
COMMIT


#Explanation of the above workflow

#COMMIT: The COMMIT command finalizes the transaction. Any changes made during the transaction are saved and made permanent in the database.
#after inserting data into the Patients and MedicalStaff tables, issuing COMMIT saves these changes

#ROLLBACK: The ROLLBACK command undoes all the changes made during the current transaction
#After inserts into the Appointments table are undone by issuing ROLLBACK, so the records are not saved in the table.

#SAVEPOINT: sets a point in the transaction to which you can roll back later
#In the example, after inserting an appointment for 'John Doe', a savepoint is set. If necessary, the transaction can be rolled back to this point without affecting prior changes


#SET TRANSACTION: The SET TRANSACTION command sets the properties for the transaction, such as the isolation level
#isolation level is set to SERIALIZABLE before starting the transaction. This affects how the transaction interacts with other transactions.