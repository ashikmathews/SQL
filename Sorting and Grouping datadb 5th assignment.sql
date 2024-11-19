CREATE DATABASE TaskDB;
USE TaskDB;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331002651, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'India', 1380004385, 3287263),
(4, 'Australia', 25499884, 7692024),
(5, 'Germany', 83783942, 357022),
(6, 'France', 65273511, 551695),
(7, 'Brazil', 212559417, 8515767),
(8, 'China', 1439323776, 9596961),
(9, 'Japan', 126476461, 377975),
(10, 'Russia', 145934462, 17098242);
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 1500, 4.2, 1, 'USA'),
(2, 'Jane', 'Smith', 1700, 3.8, 2, 'Canada'),
(3, 'Raj', 'Kumar', 2000, 4.5, 3, 'India'),
(4, 'Emily', 'Davis', 1200, 4.0, 4, 'Australia'),
(5, 'Hans', 'Mueller', 1400, 3.9, 5, 'Germany'),
(6, 'Marie', 'Dupont', 1600, 4.1, 6, 'France'),
(7, 'Carlos', 'Silva', 1800, 4.3, 7, 'Brazil'),
(8, 'Wei', 'Zhang', 2500, 4.4, 8, 'China'),
(9, 'Kenji', 'Tanaka', 1300, 3.7, 9, 'Japan'),
(10, 'Ivan', 'Ivanov', 1100, 4.0, 10, 'Russia');
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'John', NULL, 1200, 4.5, 1, 'USA'),
(12, 'Jane', NULL, 1400, 3.9, 2, 'Canada');

SELECT LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;
SELECT CONCAT(Fname, ' ', Lname) AS FullName
FROM Persons;
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries
FROM Persons;
SELECT MAX(Population) AS MaxPopulation
FROM Country;
SELECT MIN(Population) AS MinPopulation
FROM Persons;
SELECT COUNT(Lname) AS CountLname
FROM Persons;
SELECT COUNT(*) AS TotalRows
FROM Persons;
SELECT Population
FROM Country
LIMIT 3;
SELECT *
FROM Country
ORDER BY RAND()
LIMIT 3;
SELECT *
FROM Persons
ORDER BY Rating DESC;
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;
