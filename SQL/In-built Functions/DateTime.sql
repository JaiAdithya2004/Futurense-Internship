#Data Time functions
CREATE DATABASE date_time_demo
USE date_time_demo
#Before performing the date functions we have to create database and tables in it and add sample values
CREATE TABLE demo_dates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date DATETIME
);
INSERT INTO demo_dates (event_date) VALUES
('2023-06-15 10:30:00'),
('2023-07-20 15:45:00'),
(NOW());

#CURRENT_DATE() returns the current date, while SYSDATE() returns the current date and time.
#Returns the current date it provides the current date based on the system's date without the time component.
#What is the difference between CURRENT_DATE() and SYSDATE() functions?
#CURRENT_DATE(): Returns the current date without the time component.
#SYSDATE(): Returns the current date and time.
USE date_time_demo;
SELECT CURRENT_DATE() AS current_date;
SELECT SYSDATE() AS current_datetime;

#How would you calculate the number of days between two dates, say '2023-06-15' and '2023-07-20'?
#Use the DATEDIFF() function to calculate the difference in days between two dates.
SELECT DATEDIFF('2023-07-20', '2023-06-15') AS days_difference;
#OUTPUT: 35

#Explain the purpose of the LAST_DAY() function with an example.
#LAST_DAY(): Returns the last day of the month for a given date.
SELECT LAST_DAY('2023-05-01') AS last_day_of_month;
#OUTPUT: 2023-05-31

#Write a SQL query to add 3 months to the current date.
#Use the ADDDATE() or DATE_ADD() function to add a time interval to a date.
SELECT ADDDATE(CURRENT_DATE(), INTERVAL 3 MONTH) AS new_date;
#2024-09-18

#How would you extract the time component (hours, minutes, seconds) from a datetime value?
#Use the TIME() function to extract the time component from a datetime value.
#Assume we have inserted some datetime values in the demo_dates table
SELECT TIME(event_date) AS time_component FROM demo_dates;
#OUTPUT: 10:30:00
		 #15:45:00
         #12:06:18





