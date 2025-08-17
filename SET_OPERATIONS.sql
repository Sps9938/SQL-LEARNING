CREATE DATABASE Department;
USE DEPARTMENT;

CREATE TABLE Dept1 (
empId INT PRIMARY KEY,
name VARCHAR(225),
role TEXT(255)
);

INSERT INTO Dept1 VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

SELECT * FROM Dept1;

CREATE TABLE Dept2 (
empId INT PRIMARY KEY,
name VARCHAR(225),
role TEXT(255)
);

INSERT INTO Dept2 VALUES
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

SELECT * FROM Dept2;

-- SET OPERATIONS(alway come distinct rows/touples
-- List out all the employee in the company(UNION)
SELECT * FROM Dept1
UNION 
SELECT * FROM Dept2;

-- List out all the employee in all department who work as salesman(UNIOR)

SELECT * FROM Dept1 WHERE role = 'salesman'
UNION
SELECT * FROM Dept2 WHERE role = 'salesman';

-- List out all the employee who work for both the department(INTERSECT)
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 using(empId);

-- List out all the employee working in dept1 but not in dept2(MINUS)

SELECT Dept1.* FROM Dept1
LEFT JOIN Dept2 using(empId)
WHERE dept2.empId IS NULL;













