#CURSORS
#Cursors in SQL are database objects used to retrieve, manipulate, and navigate through a set of rows returned by a query
-- Create a new database
CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Grade INT
);

INSERT INTO Students (StudentID, FirstName, LastName, Grade)
VALUES 
(1, 'John', 'Doe', 9),
(2, 'Jane', 'Smith', 10),
(3, 'Emily', 'Johnson', 11),
(4, 'Michael', 'Brown', 12);

#Declaring a cursor
DECLARE student_cursor CURSOR FOR
SELECT StudentID, FirstName, LastName, Grade
FROM Students;

#Declare variables to hold the cursor data
DECLARE @StudentID INT, @FirstName NVARCHAR(50), @LastName NVARCHAR(50), @Grade INT;

#Open the cursor
OPEN student_cursor;

#Fetch the first row from the cursor
FETCH NEXT FROM student_cursor INTO @StudentID, @FirstName, @LastName, @Grade;

#Loop through the rows until there are no more to fetch
WHILE @@FETCH_STATUS = 0
BEGIN
    #Print the fetched data (in a real scenario, you might process the data differently)
    PRINT 'StudentID: ' + CAST(@StudentID AS NVARCHAR(10)) +
          ', Name: ' + @FirstName + ' ' + @LastName +
          ', Grade: ' + CAST(@Grade AS NVARCHAR(10));

    -- Fetch the next row from the cursor
    FETCH NEXT FROM student_cursor INTO @StudentID, @FirstName, @LastName, @Grade;
END;

#Close the cursor
CLOSE student_cursor;

#Deallocate the cursor
DEALLOCATE student_cursor;
#DECLARE Cursor: The DECLARE statement defines the cursor with a SELECT query.
#OPEN Cursor: The OPEN statement executes the query and makes the result set available for fetching.
#FETCH NEXT: The FETCH NEXT statement retrieves the next row from the cursor into the specified variables.
#WHILE Loop: The loop continues as long as there are rows to fetch (@@FETCH_STATUS = 0).
#CLOSE Cursor: The CLOSE statement releases the cursor but keeps the structure available for further use.
#DEALLOCATE Cursor: The DEALLOCATE statement completely removes the cursor from memory.


