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
 
 -- INNER JOIN
 -- Enlist all the employee Id's, names along with the Project allocated to them.
 
 SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee AS e INNER JOIN Project AS p
 ON e.id = p.empId;
 
 -- without using join
 SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee AS e, project AS p WHere e.id = p.empId;
 
 
 -- Fetch out all employee Id's  and their contact detail who have been working
 -- from Jaipur with the clients name working in Hyderabad.
 
 SELECT e.id, e.emailId, e.phoneNo, c.first_name, c.last_name FROM employee as e
 INNER JOIN client as c ON e.id = c.empId WHERE e.city='Jaipur' AND c.city='Hyderabad';
 
 
 -- LEFT JOIN
 -- Fetch out each project allocated to each employee
 
 SELECT * FROM Employee AS e 
	LEFT JOIN Project AS p ON e.id = p.empId;
    
-- RIGHT JOIN
-- List out all the Project along with the employee's name and their respective allocated emailId.

SELECT e.id, e.fname, e.lname, e.emailId, p.id, p.name FROM employee AS e 
RIGHT JOIN project AS P 
ON e.id = p.empId;

-- CROSS JOIN 
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT e.fname, e.lname, p.id, p.name FROM employee AS e
cross join Project As p; 


 
 
 
 
 
 
 
 
 
 