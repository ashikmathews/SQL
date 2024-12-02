CREATE DATABASE CountryPersonsDB;
USE CountryPersonsDB;
CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(100)
);
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100),
    CountryID INT,
    Rating DECIMAL(3, 2),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);
INSERT INTO Country (CountryID, CountryName)
VALUES 
(1, 'USA'),
(2, 'Canada'),
(3, 'UK'),
(4, 'Australia'),
(5, 'Germany');

INSERT INTO Persons (PersonID, PersonName, CountryID, Rating)
VALUES 
(1, 'John Doe', 1, 4.5),
(2, 'Jane Smith', 1, 3.8),
(3, 'Alice Brown', 2, 4.2),
(4, 'Bob Johnson', 3, 3.1),
(5, 'Charlie Lee', 4, 4.7),
(6, 'Diana Green', 4, 3.9),
(7, 'Eva White', 5, 2.8);

SELECT Country.CountryName, COUNT(Persons.PersonID) AS NumberOfPersons
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
GROUP BY Country.CountryName;

SELECT Country.CountryName, COUNT(Persons.PersonID) AS NumberOfPersons
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
GROUP BY Country.CountryName
ORDER BY NumberOfPersons DESC;

SELECT Country.CountryName, AVG(Persons.Rating) AS AverageRating
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
GROUP BY Country.CountryName
HAVING AVG(Persons.Rating) > 3.0;

SELECT AVG(Rating) INTO @USA_Rating FROM Persons WHERE CountryID = 1;

SELECT Rating INTO @USA_Rating FROM Persons WHERE CountryID = 1 LIMIT 1;

SELECT Country.CountryName
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
WHERE Persons.Rating = @USA_Rating
GROUP BY Country.CountryName;

SELECT AVG(Rating) AS USA_Avg_Rating 
FROM Persons 
WHERE CountryID = 1;

SELECT Country.CountryName
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
GROUP BY Country.CountryName
HAVING AVG(Persons.Rating) = (SELECT AVG(Rating) FROM Persons WHERE CountryID = 1);

SELECT Country.CountryName
FROM Country
JOIN Persons ON Country.CountryID = Persons.CountryID
GROUP BY Country.CountryName
HAVING AVG(Persons.Rating) = 4.15;

CREATE TABLE Country (
    Country_ID INT AUTO_INCREMENT PRIMARY KEY,
    Country_Name VARCHAR(100),
    Population INT
);

INSERT INTO Country (Country_Name, Population)
VALUES
('USA', 331000000),
('Canada', 38000000),
('Brazil', 212000000),
('Australia', 26000000),
('India', 1380004385),
('China', 1393409038),
('Japan', 125000000);

SELECT Country_Name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country)
LIMIT 0, 1000;

USE Product;

SELECT AVG(Population) AS Average_Population FROM Country;
SELECT Country_Name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);


USE Product;
DROP DATABASE Product;
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@email.com', '123-456789', '1234 Elm St', 'Los Angeles', 'California', '90210', 'USA'),
('Jane', 'Smith', 'jane.smith@email.com', '987-654321', '4321 Oak St', 'New York', 'New York', '10001', 'USA'),
('Michael', 'Brown', 'michael.b@email.com', '111-222333', '5678 Pine St', 'Dallas', 'Texas', '75201', 'USA'),
('Alice', 'Green', 'alice.green@email.com', '222-333444', '9876 Maple St', 'San Francisco', 'California', '94101', 'USA'),
('David', 'White', 'david.white@email.com', '555-666777', '8765 Cedar St', 'Austin', 'Texas', '73301', 'USA'),
('Emma', 'Black', 'emma.black@email.com', '999-888777', '3456 Birch St', 'Seattle', 'Washington', '98101', 'USA');

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'USA';

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer
SET Phone_no = 'Updated Phone Number'
WHERE State = 'California';
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;
SELECT * FROM Customer_details
ORDER BY State ASC;





