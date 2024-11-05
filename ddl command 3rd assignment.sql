
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1985-02-15', 39, 'M', 'IT', 30000),
(2, 'Jane', 'Smith', '1990-07-23', 34, 'F', 'Finance', 25000),
(3, 'Aaliya', 'Khan', '1988-12-01', 36, 'F', 'HR', 28000),
(4, 'Robert', 'Brown', '1982-04-12', 42, 'M', 'Sales', 27000),
(5, 'Emily', 'Clark', '1995-09-08', 29, 'F', 'Marketing', 22000),
(6, 'Michael', 'Johnson', '1980-06-30', 44, 'M', 'IT', 32000),
(7, 'Sara', 'Davis', '1992-11-20', 32, 'F', 'Finance', 24000),
(8, 'David', 'Wilson', '1987-03-03', 37, 'M', 'Operations', 26000),
(9, 'Laura', 'Taylor', '1994-10-10', 30, 'F', 'IT', 29000),
(10, 'James', 'Anderson', '1986-05-25', 38, 'M', 'IT', 34000);

SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;


SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;