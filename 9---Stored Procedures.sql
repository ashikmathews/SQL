CREATE DATABASE Worker_NewDB;
USE Worker_NewDB;

CREATE TABLE Worker_New (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker_New (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-01', 'HR');

DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker_New
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;


CALL GetWorkerSalary(1, @Salary);
SELECT @Salary AS WorkerSalary;

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker_New
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;


CALL UpdateWorkerDepartment(1, 'Finance');

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker_New
    WHERE Department = p_Department;
END $$

DELIMITER ;

CALL worker_newdb.GetWorkerCountByDepartment('Finance', @workerCount);

SELECT @workerCount AS WorkerCount;

SELECT DATABASE();

USE worker_newdb;

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker_New
    WHERE Department = p_Department;
END $$

DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'worker_newdb';

CALL GetWorkerCountByDepartment('Finance', @workerCount);
SELECT @workerCount AS WorkerCount;

DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary INT
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker_New
    WHERE Department = p_Department;
END $$

DELIMITER ;


CALL GetAverageSalaryByDepartment('Finance', @avgSalary);
SELECT @avgSalary AS AverageSalary;

SELECT * FROM Worker_New;

CALL AddWorker(2, 'Jane', 'Smith', 60000, '2023-02-15', 'IT');
SELECT * FROM Worker_New;

CALL GetWorkerSalary(2, @Salary);
SELECT @Salary AS WorkerSalary;

CALL UpdateWorkerDepartment(2, 'Operations');
SELECT * FROM Worker_New;

CALL GetWorkerCountByDepartment('Operations', @workerCount);
SELECT @workerCount AS WorkerCount;

CALL GetAverageSalaryByDepartment('Operations', @avgSalary);
SELECT @avgSalary AS AverageSalary;



CALL worker_newdb.GetAverageSalaryByDepartment('Operations', @avgSalary);

SELECT * FROM Worker_New WHERE Department = 'Operations';


SELECT DATABASE();
USE worker_newdb;

SHOW PROCEDURE STATUS WHERE Db = 'worker_newdb';

DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker_New
    WHERE Department = p_Department;
END $$

DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'worker_newdb';

CALL GetAverageSalaryByDepartment('Operations', @avgSalary);
SELECT @avgSalary AS AverageSalary;


CALL GetAverageSalaryByDepartment('Finance', @avgSalary);
SELECT @avgSalary AS AverageSalary;

CALL AddWorker(3, 'Alice', 'Brown', 70000, '2023-03-01', 'Finance');

CALL GetWorkerSalary(3, @Salary);
SELECT @Salary AS WorkerSalary;

CALL UpdateWorkerDepartment(3, 'IT');

CALL GetWorkerCountByDepartment('IT', @workerCount);
SELECT @workerCount AS WorkerCount;

SELECT * FROM Worker_New;






















