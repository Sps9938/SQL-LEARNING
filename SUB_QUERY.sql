USE temp;
 CREATE TABLE Employee (
	id INT PRIMARY KEY,
    fname VARCHAR(225),
    lname VARCHAR(225),
	Age INT,
    emailId VARCHAR(255),
    PhoneNo INT,
    city VARCHAR(225)
 );
 
 INSERT INTO Employee VALUES
 (1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
 (2, 'Yagya', 'Naryan', 44, 'yagya@gmail.com', 222, 'Palam'),
 (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
 (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
 (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');
 
 SELECT * FROM Employee;
 
  CREATE TABLE Project (
	id INT PRIMARY KEY,
    empId INT,
    name VARCHAR(225),
    startDate DATE,
	clientId INT,
    FOREIGN KEY(empId) REFERENCES Employee(id),
    FOREIGN KEY(clientId) REFERENCES Client(id)
 );
 
 INSERT INTO Project VALUES
 (1, 1, 'A', '2021-04-21', 3),
 (2, 2, 'B', '2021-03-12', 1),
 (3, 3, 'C', '2021-01-16', 5),
 (4, 3, 'D', '2021-04-27', 2),
 (5, 5, 'E', '2021-05-01', 4);
 
 SELECT * FROM Project;
 
   CREATE TABLE Client (
	id INT PRIMARY KEY,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    Age INT, 
    emailId VARCHAR(255),
    PhoneNo INT,
    City VARCHAR(225), 
    empId INT,
    FOREIGN KEY(empId) REFERENCES Employee(id)
 );
 
  INSERT INTO Client VALUES
 (1, 'Mac', 'Rongers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
 (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
 (3, 'Peter', 'Jain', 24, 'peter@abc.com', 111, 'Delhi', 1),
 (4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyderabad', 5),
 (5, 'Pratap', 'Sing', 36, 'p@xyz.com', 77767, 'Mumbai', 2);

 
 SELECT * FROM Client;
 
 
 -- SUB QURIES
 -- WHREE CLAUSE SAME TABLE
 -- emp details which age > 30
 
 SELECT * FROM employee WHERE age in (SELECT age FROM employee WHERE age > 30);
 
 -- WHREE CLAUSE In different table
 -- emp details working in more then one project
 
 SELECT * FROM employee WHERE id in(
 SELECT empId from Project GROUP BY empId HAVING COUNT(empId) > 1);
 
 -- single value subquery
 -- emp details having age > ava(age)
 
 SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);
 
 -- FROM CLAUSE - derived table
 -- select max age person whose first name contains 'a'
 
 SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- corelated subquuery
-- find 3rd oldest employee

SELECT * FROM employee AS e1
WHERE 3 = (SELECT COUNT(e2.age)
			FROM employee AS e2
            WHERE e2.age >= e1.age
);
 

 
 
 
 
 
 