#COMPLEXSUBQUERIES
#Complex Queries involves usage of multiple Statements SELECT,FROM,WHERE,HAVING clauses
CREATE DATABASE Medical_db
USE Medical_db

#AFter creating Database we can create Tables and add sample data to

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    fee DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

#Inserting Some Values in the table
INSERT INTO patients (name, age, gender) VALUES
('Kannamal', 30, 'Female'),
('Boopathy', 45, 'Male'),
('Chelliah', 35, 'Male'),
('Chinna Kannu', 50, 'Female');

INSERT INTO doctors (name, specialty) VALUES
('Cherian', 'Cardiology'),
('Ramdass', 'Neurology'),
('Chenniappan', 'Orthopedics'),
('Subashini', 'Dermatology');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, fee) VALUES
(1, 1, '2024-06-01', 150.00),
(2, 2, '2024-06-03', 200.00),
(3, 3, '2024-06-05', 120.00),
(4, 1, '2024-06-07', 150.00),
(1, 2, '2024-06-10', 200.00),
(2, 4, '2024-06-12', 180.00);

#There are some complex Subqueries
#SELECT keyword
SELECT 
    p.name,
    (SELECT SUM(a.fee) 
     FROM appointments a 
     WHERE a.patient_id = p.patient_id) AS total_fee
FROM patients p;
#subquery selects the sumof fee FROM appointments a WHERE a.patient_id = p.patient_id) calculates the total fee for each patient

#FROM keyword
SELECT 
    d.name,
    avg_fees.average_fee
FROM doctors d
JOIN (
    SELECT 
        doctor_id, 
        AVG(fee) AS average_fee
    FROM appointments
    GROUP BY doctor_id
) avg_fees ON d.doctor_id = avg_fees.doctor_id;
#The subquery (SELECT doctor_id, AVG(fee) AS average_fee FROM appointments GROUP BY doctor_id) calculates the average fee for each doctor

#WHERE keyword
SELECT 
    p.name
FROM patients p
WHERE (
    SELECT COUNT(*) 
    FROM appointments a 
    WHERE a.patient_id = p.patient_id
) > 1;
#The subquery (SELECT COUNT(*) FROM appointments a WHERE a.patient_id = p.patient_id) counts the number of appointments for each patient

#EXISTS keyword
SELECT 
    d.name
FROM doctors d
WHERE EXISTS (
    SELECT 1
    FROM appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = d.doctor_id AND p.age > 40
);

#The subquery checks if there exists any appointment where the patient's age is greater than 40 for each doctor


