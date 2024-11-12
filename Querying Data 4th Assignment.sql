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
    Rating DECIMAL(2,1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 37700000, 9984670),
(3, 'UK', 66800000, 243610),
(4, 'Australia', 25600000, 7692024),
(5, 'India', 1380000000, 3287263),
(6, 'France', 67000000, 551695),
(7, 'Germany', 83000000, 357022),
(8, 'China', 1440000000, 9596961),
(9, 'Japan', 126000000, 377975),
(10, 'Brazil', 212000000, 8515767);

-- Insert into Persons
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 37700000, 3.9, 2, 'Canada'),
(3, 'Alice', 'Brown', 66800000, 4.2, 3, 'UK'),
(4, 'Bob', 'Davis', 25600000, 3.7, 4, 'Australia'),
(5, 'Ravi', 'Patel', 1380000000, 4.6, 5, 'India'),
(6, 'Marie', 'Curie', 67000000, 4.1, 6, 'France'),
(7, 'Hans', 'Schmidt', 83000000, 3.8, 7, 'Germany'),
(8, 'Li', 'Wang', 1440000000, 4.3, 8, 'China'),
(9, 'Taro', 'Yamamoto', 126000000, 3.6, 9, 'Japan'),
(10, 'Carlos', 'Santos', 212000000, 4.8, 10, 'Brazil');
SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
