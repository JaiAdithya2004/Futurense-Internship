#BITWISE OPERATOR
CREATE DATABASE bit_db
USE  bit_db
#Creating the binary_numbers table
CREATE TABLE binary_numbers (
    id INT PRIMARY KEY,
    binary_value1 INT,
    binary_value2 INT
);

#Inserting  data into the binary_numbers table
INSERT INTO binary_numbers (id, binary_value1, binary_value2) VALUES
(1, 5, 3), -- 5 - 0101, 3 - 0011 in binary
(2, 12, 10); -- 12 - 1100, 10 - 1010 in binary
#Bitwise AND (&) example
SELECT binary_value1, binary_value2,
       binary_value1 & binary_value2 AS bitwise_and_result
FROM binary_numbers
WHERE id = 1;
#Bitwise OR (|) example
SELECT binary_value1, binary_value2,
       binary_value1 | binary_value2 AS bitwise_or_result
FROM binary_numbers
WHERE id = 1;

#Bitwise XOR (^) example
SELECT binary_value1, binary_value2,
       binary_value1 ^ binary_value2 AS bitwise_xor_result
FROM binary_numbers
WHERE id = 1;
