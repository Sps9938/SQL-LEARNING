# SQL-LEARNING

## MySQL Installation, Workbench & First Query Guide

A complete beginner-friendly guide to install MySQL, use MySQL Workbench, run your first SQL query, and work with the MySQL Command-Line Interface (CLI).

---

## 1️⃣ Installing MySQL

### 🔹 Windows
1. Download **MySQL Installer**:  
   👉 [MySQL Official Download](https://dev.mysql.com/downloads/installer/)
2. Run the installer and select:
   - **Developer Default** (includes MySQL Server, Workbench, and CLI tools).
3. Setup steps:
   - Choose **Standalone MySQL Server**.
   - Set a **root password** — remember it!
   - Complete installation.
4. Ensure **MySQL Workbench** is installed.

---

### 🔹 macOS
```bash
brew install mysql
brew services start mysql
```

### 2️⃣ Open MySQL CLI
```
mysql -u root -p
Enter password:____

```
# SQL QUERY
DRL(Data Retrieval Language):

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

SELECT * FROM Worker WHERE LAST_NAME LIKE '%a_'-- ORDER BY by default ascending order

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


Data Definition Language (DDL) Notes
👉 DDL deals with structure/schema of database objects (tables, views, etc.).
 It does not handle data, only structure.
 Examples: CREATE, ALTER, DROP, RENAME, TRUNCATE.
1. CREATE TABLE
👉 Used to create a new table with specified columns and constraints.
Example:
CREATE TABLE account_details (
    id INT PRIMARY KEY, 
    name VARCHAR(225) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);



🔹 Explanation:
id INT PRIMARY KEY → id is unique & cannot be NULL.


name VARCHAR(225) UNIQUE → names must be unique.


balance INT NOT NULL DEFAULT 0 → balance cannot be NULL, default = 0.


✅ Output after insertion:
INSERT INTO account_details (id, name) VALUES (1, 'satya');
INSERT INTO account_details (id, name) VALUES (2, 'mohit');
SELECT * FROM account_details;

id
name
balance
1
satya
0
2
mohit
0


2. DESC / DESCRIBE
👉 Shows the structure (schema) of a table.
DESC account_details;

✅ Output:
Field
Type
Null
Key
Default
Extra
id
int
NO
PRI
NULL


name
varchar(225)
YES
UNI
NULL


balance
int
NO


0


3. ALTER TABLE
👉 Used to modify structure of a table.
a) ADD (Add new column)
ALTER TABLE account_details ADD interest FLOAT;

✅ Effect: Adds a new column interest.
id
name
balance
interest
1
satya
0
NULL
2
mohit
0
NULL


b) MODIFY (Change datatype of a column)
ALTER TABLE account_details MODIFY interest DOUBLE;

✅ Effect: interest datatype changes from FLOAT → DOUBLE.

c) CHANGE COLUMN (Rename column + change datatype if needed)
ALTER TABLE account_details CHANGE COLUMN interest saving_interest FLOAT;

✅ Effect: Column interest renamed to saving_interest with type FLOAT.
id
name
balance
saving_interest
1
satya
0
NULL
2
mohit
0
NULL



d) DROP COLUMN (Delete a column)
ALTER TABLE account_details DROP COLUMN saving_interest;

✅ Effect: Removes column saving_interest.
id
name
balance
1
satya
0
2
mohit
0


e) RENAME (Rename a table)
ALTER TABLE account_details RENAME TO account;

✅ Effect: Table name changes from account_details → account.
SELECT * FROM account;

id
name
balance
1
satya
0
2
mohit
0


4. DROP TABLE
👉 Deletes the entire table structure + data.
DROP TABLE account_details;

✅ Effect: Table is completely removed from the database.




SQL Data Manipulation Language (DML) Notes
DML statements are used to manage data inside the database (not schema). Main commands:
INSERT → Add new rows


UPDATE → Modify existing rows


DELETE → Remove rows


REPLACE → Insert or update in one step
1. INSERT
👉 Adds new records into a table.
Example:
INSERT INTO Customer VALUES 
(128, 'Satya Prakash', 'Baripada', 'M', 'Baripada', 144001);

✅ Effect: Inserts a complete row into Customer.

Partial insert (specific columns only):
INSERT INTO Customer(id, City)
VALUES (135, 'Udala');

✅ Effect: Only id and City are given, other columns are NULL.
2. UPDATE
👉 Changes existing row values.
Example:
UPDATE Customer 
SET cname = 'Mohit Mallick', Gender = 'M' 
WHERE id = 135;

✅ Effect: Updates record with id=135.
id
cname
Address
Gender
City
Pincode
135
Mohit Mallick
NULL
M
Udala
NULL


Update all rows (⚠ Dangerous if no WHERE):
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = 14000;

✅ Effect: Every row’s Pincode becomes 14000.
3. DELETE
👉 Removes rows from a table.
Example:
DELETE FROM Customer WHERE id = 128;

✅ Effect: Deletes only the row with id=128.
DELETE FROM Customer;

✅ Effect: Deletes all rows from Customer (table is empty but structure remains).
4. REPLACE
👉 Combination of INSERT + UPDATE.
If id (Primary Key) exists → row is replaced.


If id does not exist → row is inserted.


Example 1 – Update existing row
REPLACE INTO Customer (id, city)
VALUES (210, 'Baripada');

✅ Effect: Row with id=210 is replaced → all unspecified columns become NULL.
id
cname
Address
Gender
City
Pincode
210
NULL
NULL
NULL
Baripada
NULL


Example 2 – Insert new row
REPLACE INTO Customer (id, cname, city)
VALUES (897, 'Mohit Mallick', 'Balasore');

✅ Effect: New row inserted.
id
cname
Address
Gender
City
Pincode
897
Mohit Mallick
NULL
NULL
Balasore
NULL


Example 3 – Using SET syntax
REPLACE INTO Customer SET id = 897, cname = 'Satya Prakash', city = 'Cuttack';

✅ Effect: Since id=897 already exists, row is replaced.
id
cname
Address
Gender
City
Pincode
897
Satya Prakash
NULL
NULL
Cuttack
NULL


Example 4 – Insert using SELECT
REPLACE INTO Customer (id, cname, city)
SELECT id, cname, city
FROM Customer WHERE id = 500;

✅ Effect: Copy row with id=500 into a new row (if id=500 already exists, it replaces).
5. ON DELETE Actions
👉 When a parent (Customer) row is deleted, the effect on child (Order_details) depends on rule:
ON DELETE CASCADE → Delete child rows automatically.


ON DELETE SET NULL → Set child cust_id = NULL.


Example:
DELETE FROM Customer WHERE id=128;

If CASCADE: Order_details rows with cust_id=128 are deleted.


If SET NULL: those rows remain but cust_id becomes NULL.


🔑 Summary Table of Commands
Command
Purpose
Example
Effect
INSERT
Add row
INSERT INTO Customer VALUES (...)
New row added
UPDATE
Modify row(s)
UPDATE Customer SET City='Delhi' WHERE id=135
Row updated
DELETE
Remove row(s)
DELETE FROM Customer WHERE id=128
Row removed
REPLACE
Insert or Update
REPLACE INTO Customer VALUES (...)
Replace existing or insert new


🔑 DDL vs DML (Quick Difference)
Feature
DDL (Definition)
DML (Manipulation)
Purpose
Defines schema
Manages data
Commands
CREATE, ALTER, DROP, RENAME, TRUNCATE
INSERT, UPDATE, DELETE, REPLACE
Auto-commit
✅ Yes (cannot be rolled back easily)
❌ No (can be rolled back with transaction)







## 📌 Joins
Joining multiple tables based on relationships.

### Types Demonstrated
- **INNER JOIN**
- **LEFT JOIN**
- **RIGHT JOIN**
- **CROSS JOIN**

Example:
```sql
-- INNER JOIN
SELECT e.id, e.fname, e.lname, p.id, p.name
FROM Employee AS e
INNER JOIN Project AS p ON e.id = p.empId;

-- LEFT JOIN
SELECT * FROM Employee AS e
LEFT JOIN Project AS p ON e.id = p.empId;

-- RIGHT JOIN
SELECT e.id, e.fname, e.lname, e.emailId, p.id, p.name
FROM Employee AS e
RIGHT JOIN Project AS p ON e.id = p.empId;
```

---

## 📌 Set Operations
Working with results from multiple queries.

- `UNION`
- `INTERSECT` (simulated using `INNER JOIN`)
- `MINUS` (simulated using `LEFT JOIN ... WHERE IS NULL`)

Examples:
```sql
SELECT * FROM Dept1
UNION
SELECT * FROM Dept2;

-- Employees in both departments
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 USING(empId);

-- Employees in Dept1 but not in Dept2
SELECT Dept1.* FROM Dept1
LEFT JOIN Dept2 USING(empId)
WHERE Dept2.empId IS NULL;
```

---

## 📌 Subqueries
Different types of subqueries are covered.

### Examples:
```sql
-- Single value subquery
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

-- IN clause subquery
SELECT * FROM employee WHERE id IN (
    SELECT empId FROM Project GROUP BY empId HAVING COUNT(empId) > 1
);

-- Derived table (FROM clause)
SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- Correlated subquery
SELECT * FROM employee AS e1
WHERE 3 = (
    SELECT COUNT(e2.age) FROM employee AS e2
    WHERE e2.age >= e1.age
);
```

---

## 📌 Views
Virtual tables created using `SELECT`.

```sql
CREATE VIEW custom_view AS SELECT fname, age FROM employee;
ALTER VIEW custom_view AS SELECT fname, lname, age FROM employee;
DROP VIEW IF EXISTS custom_view;
```

---

## ✅ Summary
- **DRL** → Fetch data (`SELECT`)
- **DDL** → Define schema (`CREATE`, `ALTER`, `DROP`)
- **DML** → Manage data (`INSERT`, `UPDATE`, `DELETE`, `REPLACE`)
- **Joins** → Combine tables (`INNER`, `LEFT`, `RIGHT`, `CROSS`)
- **Set Operations** → `UNION`, `INTERSECT`, `MINUS`
- **Subqueries** → Nested queries
- **Views** → Virtual tables

