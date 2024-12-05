CREATE DATABASE TeachersDB;

USE TeachersDB;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice', 'Math', 5, 50000),
('Bob', 'Physics', 7, 55000),
('Charlie', 'Chemistry', 12, 60000),
('David', 'Biology', 3, 45000),
('Eva', 'English', 8, 52000),
('Frank', 'History', 15, 65000),
('Grace', 'Geography', 10, 58000),
('Helen', 'Computer Science', 2, 48000);

CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME NOT NULL
);

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END; //

DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Test', 'Math', 4, -5000);

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Test', 'Math', 4, 5000);

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('John', 'Music', 6, 47000);

SELECT * FROM teacher_log;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Ivy', 'Art', 3, 47000);

DELETE FROM teachers WHERE id = 4;

SELECT * FROM teachers;
SELECT * FROM teacher_log;

INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Sophia', 'Art', 2, 46000);

SELECT * FROM teachers;
SELECT * FROM teacher_log;








