create database org;
use org;

CREATE TABLE Worker (
    worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    salary INT(10),
    joining_date DATE,
    department VARCHAR(30)
);

select * from worker;
INSERT INTO Worker
(worker_id, first_name, last_name, salary, joining_date, department)
VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-01-11', 'Admin');

CREATE TABLE Bonus (
    worker_ref_id INT,
    bonus_amount INT(10),
    bonus_date DATE,
    FOREIGN KEY (worker_ref_id) REFERENCES Worker(worker_id)
    ON DELETE CASCADE
);

INSERT INTO Bonus
(worker_ref_id, bonus_amount, bonus_date)
VALUES
(1, 5000, '2016-02-20'),
(2, 3000, '2016-06-11'),
(3, 4000, '2016-02-20'),
(1, 4500, '2016-02-20'),
(2, 3500, '2016-06-11');

select * from bonus;
CREATE TABLE Title (
    worker_ref_id INT,
    worker_title VARCHAR(25),
    affected_from DATE,
    FOREIGN KEY (worker_ref_id) REFERENCES Worker(worker_id)
    ON DELETE CASCADE
);

INSERT INTO Title
(worker_ref_id, worker_title, affected_from)
VALUES
(1, 'Manager', '2016-02-20'),
(2, 'Executive', '2016-06-11'),
(8, 'Executive', '2016-06-11'),
(5, 'Manager', '2016-06-11'),
(4, 'Asst. Manager', '2016-06-11'),
(7, 'Executive', '2016-06-11'),
(6, 'Lead', '2016-06-11'),
(3, 'Lead', '2016-06-11');

select * from title;

-- write an sql query to print details of the workers who are also manager

select w. * from worker As w inner join title as t 
ON w.worker_id = t.worker_ref_id
where t.worker_title = 'manager';

-- write an sql qurey to fetch number(more than 1) of same titles in the ORG of different types
select worker_title, count(*) As count from title group by worker_title having count > 1; 

-- write an sql query to show only odd rows from a table
select * from worker where worker_id & 1; 
select * from worker where MOD(worker_id, 2) != 0;
select * from worker where MOD(worker_id, 2) <> 0;

-- write an sql query to show only even rows from a table

select * from worker where !(worker_id & 1);
select * from worker where MOD(worker_id, 2) = 0;

-- write an sql query to clone a new table from another table
create table worker_clone LIKE worker;
-- drop table worker_title;
select * from worker_clone;
insert into worker_clone select * from worker;

-- write an sql query to fetch interscting records from two tables
select worker. * from worker inner join worker_clone using(worker_id);

-- left join between two tables
select * from worker as w left join bonus as b 
on w.worker_id = b.worker_ref_id;

-- write an sql query to show records from one table that another table does not have
select worker. * from worker left join worker_clone using(worker_id) where worker_clone.worker_id IS NULL;

-- write an sql query to show cureent date and time;
select current_date();
select now();
select current_time();
select current_timestamp();
select current_user();
select day(current_date());
-- write an sql query to show top n (say 5) record of a table , salary in descending
select * from worker order by salary DESC LIMIT 5; 

-- write an sql query to show nth (n=5) highest salary from a table
select * from worker order by salary DESC LIMIT 4, 1; 

-- write an sql query to show nth (n=5) highest salary from a table without using LIMIT;
select * from worker w1 where 4 = (
	select count(distinct(w2.salary)) from worker w2
	where w2.salary >= w1.salary
);
select * from worker;

-- write an sql query to fetch the list of employees with the same salary
select w1. * from worker w1, worker w2 where w1.salary = w2.salary AND w1.worker_id != w2.worker_id;
select * from worker w1 where 1 < (
	select count(salary) from worker w2
    where w2.salary = w1.salary 
);
