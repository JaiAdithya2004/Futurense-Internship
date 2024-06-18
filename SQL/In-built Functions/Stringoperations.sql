#STRING FUNCTIONS
CREATE DATABASE func_db
USE func_db

#CONCAT() it is a function that is used for combining or conacating two or more string into single string before seeing its woeking lets create a Database and add some datas to it
CREATE TABLE sample_data (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    mixed_case_string VARCHAR(100),
    padded_string VARCHAR(100)
);

INSERT INTO sample_data (id, first_name, last_name, mixed_case_string, padded_string) VALUES
(1, 'jai', 'Adithya', 'ThiS iS a MiXed CAse StrIng!', '    SQL is fun!    '),
(2, 'Ram', 'Prasath', 'AnOthEr ExAmPle', '    Hello, Will you Marry Me!    '),
(3, 'John', 'Ibrahm', 'LowEr And UpPer CasE', '    Learning SQL for you !    ');

#Concatenating first name and last name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM sample_data;

#Both LCASE() and LOWER() functions are used to convert a string to lowercase. They perform the same operation, and there is no functional difference between them. LCASE() is an alias for LOWER().
#Example Convert mixed case strings to lowercase.I would prefer to use LOWER() because it is more readable and commanly used widely
SELECT LOWER(mixed_case_string) AS lower_string
FROM sample_data;


#How would you extract a substring from the 5th position to the 10th position (inclusive) from the string "Hello, World!"?
#To extract a substring from a specific position, you can use the SUBSTRING() function.
SELECT SUBSTRING('Hello, World!', 5, 6) AS substring;
#Output: o, Wor the SUBSTRING() function takes the string "Hello, World!" and starts extracting from the 5th position for a length of 6 characters, which includes the 5th to 10th positions

#What is the purpose of the LPAD() and RPAD() functions? Provide an example of how to use them.
#LPAD() and RPAD() functions are used to pad a string to a specified length with a specified character, either from the left (LPAD()) or the right (RPAD())
#Using LPAD() to pad a string from the left
SELECT LPAD('Hello', 10, '*') AS padded_string_left;
#Using RPAD() to pad a string from the right
SELECT RPAD('Hello', 10, '*') AS padded_string_right;

# Write a SQL query to trim both leading and trailing spaces from the string ' Hello, World! '.
#The TRIM() function is used to remove leading and trailing spaces from a string.
#Trimming both leading and trailing spaces
SELECT TRIM('    Hi, You are Beautiful!    ') AS trimmed_string;
#the TRIM() function removes the spaces before and after the string 'Hello, World!', leaving just 'Hello, World!'.
#Output: Hi, You are Beautiful!






