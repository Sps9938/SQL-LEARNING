CREATE database management;
SHOW databases;
USE management;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT AUTO_INCREMENT,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(15),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '25-02-12 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '25-05-18 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '25-11-24 09.00.00', 'HR'),
(004, 'Amitabh', 'Sing', 500000, '25-07-22 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '25-09-21 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '25-12-27 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '25-06-04 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '25-08-14 09.00.00', 'Admin');


INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(009, 'Monika', 'Arora', NULL, '25-02-12 09.00.00', 'HR');

-- use select keyword
SELECT * FROM Worker;

SELECT SALARY FROM Worker;
SELECT FIRST_NAME, SALARY FROM Worker;

-- We Can use SELECT keyword without using FROM clause-> using DUAL Tables
SELECT 67+98;
SELECT now();
SELECT lcase('SATYA');
SELECT Ucase('SAtya');


-- WHERE keyword

SELECT * FROM Worker WHERE SALARY > 100000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';
SELECT FIRST_NAME, SALARY, DEPARTMENT FROM Worker WHERE DEPARTMENT = 'Admin';

-- BETWEEN -> SALARY[100000,300000]-> satrting and ending also include, if you want separate then used codtion

SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 300000;
SELECT * FROM Worker WHERE SALARY>80000 AND SALARY<300000;

-- OR keyword(But not good pratice instead of this we are used IN for reduce rows)
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin' OR DEPARTMENT = 'Account';

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR','Admin','Account');

-- NOT keyword(except this all are shows)

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR','Account');

-- IS NULL keyword

SELECT * FROM Worker WHERE SALARY IS NULL;

SELECT * FROM Worker;

-- WILDCARD ('%','_')

SELECT * FROM Worker WHERE first_name LIKE '__i%';
SELECT * FROM Worker WHERE LAST_NAME LIKE '%a_';

-- ORDER BY by default ascending order

SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;
SELECT * FROM Worker ORDER BY SALARY ASC;

-- DISTINCT

SELECT DEPARTMENT FROM Worker;

SELECT DISTINCT DEPARTMENT FROM Worker;

-- GROUP BY(for grouping, each departmet count) 
-- wihout using aggrigation it treat like DISTINCT 

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- HAVING (same as WHERE but not equal) used when filtering require
-- difference between WHERE AND HAVING(WHERE doesn't allow aggregation but allow in case of HAVING)

SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>2;





































