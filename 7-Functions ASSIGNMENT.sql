CREATE DATABASE TestDB;
USE TestDB;
CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL
);
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    CountryID INT,
    DOB DATE,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);
INSERT INTO Country (CountryID, CountryName)
VALUES
(1, 'United States'),
(2, 'India'),
(3, 'Australia'),
(4, 'Canada');
INSERT INTO Persons (PersonID, PersonName, CountryID)
VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'David Brown', 3),
(4, 'Emily Davis', 4);

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Persons' AND COLUMN_NAME = 'DOB';

SET SQL_SAFE_UPDATES = 0;
UPDATE Persons
SET DOB = CASE 
            WHEN PersonID = 1 THEN '1990-01-15'
            WHEN PersonID = 2 THEN '1985-07-20'
            WHEN PersonID = 3 THEN '1992-03-10'
            WHEN PersonID = 4 THEN '1988-11-25'
            ELSE DOB
          END;
SET SQL_SAFE_UPDATES = 1;
UPDATE Persons
SET DOB = CASE 
            WHEN PersonID = 1 THEN '1990-01-15'
            WHEN PersonID = 2 THEN '1985-07-20'
            WHEN PersonID = 3 THEN '1992-03-10'
            WHEN PersonID = 4 THEN '1988-11-25'
            ELSE DOB
          END
WHERE PersonID IN (1, 2, 3, 4);
SELECT * FROM Persons;
UPDATE Persons
SET DOB = CASE 
            WHEN PersonID = 1 THEN '1990-01-15'
            WHEN PersonID = 2 THEN '1985-07-20'
            WHEN PersonID = 3 THEN '1992-03-10'
            WHEN PersonID = 4 THEN '1988-11-25'
            ELSE DOB
          END
WHERE PersonID IN (1, 2, 3, 4);

DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END $$

DELIMITER ;

SELECT 
    PersonID,
    PersonName,
    DOB,
    CalculateAge(DOB) AS Age
FROM Persons;

SELECT CountryName, CHAR_LENGTH(CountryName) AS NameLength
FROM Country;

SELECT CountryName, LEFT(CountryName, 3) AS FirstThreeChars
FROM Country;

SELECT 
    CountryName, 
    UPPER(CountryName) AS UpperCaseName, 
    LOWER(CountryName) AS LowerCaseName
FROM Country;