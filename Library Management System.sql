CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

SHOW TABLES LIKE 'Customer';

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
) ENGINE=InnoDB;

SHOW TABLE STATUS WHERE Name IN ('Customer', 'Books');

ALTER TABLE Customer ENGINE=InnoDB;
ALTER TABLE Books ENGINE=InnoDB;

SHOW COLUMNS FROM Customer LIKE 'Customer_Id';
SHOW COLUMNS FROM IssueStatus LIKE 'Issued_cust';

SHOW TABLES;

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
) ENGINE=InnoDB;

SHOW TABLES;

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Branch Data
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Library St', '555-1234'),
(2, 102, '456 Knowledge Ln', '555-5678');

-- Employee Data
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice', 'Manager', 60000, 1),
(2, 'Bob', 'Librarian', 40000, 1),
(3, 'Charlie', 'Assistant', 30000, 2),
(4, 'Diana', 'Manager', 65000, 2);

-- Books Data
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(101, 'History of Art', 'History', 30.00, 'Yes', 'Author A', 'Publisher A'),
(102, 'Introduction to Python', 'Programming', 25.00, 'No', 'Author B', 'Publisher B'),
(103, 'World History', 'History', 35.00, 'Yes', 'Author C', 'Publisher C'),
(104, 'Data Science Basics', 'Programming', 40.00, 'No', 'Author D', 'Publisher D');

-- Customer Data
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Eve', '789 Scholar Rd', '2021-12-15'),
(2, 'Frank', '987 Research Ave', '2023-06-01');

-- IssueStatus Data
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Introduction to Python', '2023-06-10', 102),
(2, 2, 'Data Science Basics', '2023-06-15', 104);

-- ReturnStatus Data
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Introduction to Python', '2023-07-01', 102),
(2, 2, 'Data Science Basics', '2023-07-05', 104);

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

SELECT Book_title
FROM Books
WHERE Category LIKE '%History%';

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT Emp_name, Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Position = 'Manager';

SELECT Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(3, 'Grace', '123 New Ave', '2021-11-10');

SELECT Branch_no, Emp_name
FROM Employee
ORDER BY Branch_no;

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no;



























