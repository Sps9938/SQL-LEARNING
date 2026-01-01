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

-- write an sql query to show nth (n=6) highest salary from a table
select distinct(salary) from worker order by salary DESC LIMIT 5, 1;

-- write an sql query to show nth (n=6) highest salary from a table without using LIMIT;
select * from worker w1 where 6 = (
	select count(distinct(salary)) from worker w2
    where w2.salary >= w1.salary
);

-- write an sql query to fetch the list of employees with the same salary
select w1. * from worker w1, worker w2 where w1.salary = w2.salary AND w1.worker_id <> w2.worker_id;

select * from worker w1 where 1 < (
	select count(*) from worker w2
    where w1.salary = w2.salary
);


-- write  an sql query to show the 2nd highest salary from a table
select distinct(w.salary) from worker w order by salary DESC LIMIT 1, 1;

select * from worker w1 where 2 = (
	select count(distinct(salary)) from worker w2
    where w2.salary >= w1.salary
);

-- write  an sql query to show the 3rd highest salary from a table
select * from worker w1 where 3 = (
	select count(distinct(salary)) from worker w2
    where w2.salary >= w1.salary
);

select max(salary) 
from worker
where salary NOT IN (
(
	select max(salary)
    from worker 
),
(
	select max(salary) 
    from worker
	where salary not in (
		select max(salary) 
        from worker
	)
)
);

-- write an sql query to show one row twice in results from a table
select * from worker
UNION ALL
select * from worker order by worker_id;

-- write an sql query to show worker id who does not get bonus
select w.worker_id as worker_id from worker as w
left join
bonus as b
on w.worker_id = b.worker_ref_id where b.bonus_amount is null;

select worker_id from worker where worker_id not in (
	select worker_ref_id from bonus
);

-- write an sql query to show first 50% records from a table
 select * from worker where worker_id <= (select count(worker_id)/2 from worker);

-- write an sql query to fetch departments that have less than 4 people in it
select department, count(department) as no_of_dept from worker group by department having no_of_dept < 4;


-- write an sql query to show all department along witb the number of people in there
select department, count(department) as no_of_people from worker group by department;

-- write an sql query to show last record from a table
select * from worker where worker_id = (
	select MAX(worker_id) from worker
);


-- write an sql query to fetch first row of a table
-- select * from worker where worker_id = 1;
select * from worker where worker_id = (
	select MIN(worker_id) from worker
);

-- write an sql query to fetch the last five records from a table
select * from worker order by worker_id DESC LIMIT 5;

select * from worker where worker_id >= (select max(worker_id) from worker)-(5-1);

-- write an sql query to print the name of employees having the highest salary to each department
-- select max(salary), department from worker group by department;
select concat(first_name, ' ', last_name) as worker_name, Department from worker w1 where salary = (
	select max(salary) from worker w2 where w1.department = w2.department
);

select concat(w1.first_name, ' ', w1.last_name) as worker_name, w1.department from 
(select max(salary) as maxSal, department from worker group by department) temp
inner join
worker w1
on w1.department = temp.department and temp.maxSal = w1.salary;

-- write an sql query to fetch three max salaries from  a table using co-related sub-query 
select max(salary) as maxSal from worker group by department order by maxSal DESC limit 2; 

select distinct salary from worker w1 where 3 >=
	(select count(distinct salary) from worker w2 where w2.salary >= w1.salary) order by w1.salary desc;

-- write an sql query to fetch three min salaries from a table using co-related sub-query

select distinct salary from worker order by salary limit 3; 

-- 3rd min salary from a table
select * from worker w1 where 3 = (
	select count(distinct salary) from worker w2
    where w2.salary <= w1.salary
); 


select distinct salary from worker w1 where 3 >= (
	select count(distinct salary) from worker w2
    where w2.salary <= w1.salary
) order by w1.salary;

select * from worker order by salary;


-- write an sql query to fetch nth max salaries from a table 
select distinct salary from worker w1 where n >=
	(select count(distinct salary) from worker w2 where w2.salary >= w1.salary) order by w1.salary desc;

-- write an sql query to fetch departments along with the total salaries paid each of them
select department, sum(salary) as total_sal from worker group by department order by total_sal desc;

-- write an sql query to fetch the names of workers who earns the highest salary
select concat(first_name, ' ', last_name) as Worker_Name from worker where salary = (
	select max(salary) from worker
); 




-- revision sub-query

select distinct salary from worker order by salary desc limit 4, 1;

select * from worker w1 where 5 = (
	select  count(distinct salary) from worker w2
    where w2.salary >= w1.salary
);

-- same salary

select * from worker w1 where salary = (
	select distinct salary from worker w2
    where w1.salary = w2.salary and w2.worker_id <> w1.worker_id
);


-- without co-related sub-query
select max(salary) from worker where salary not in (
	select max(salary) from worker
);

select * from worker w1 where 2 = (
	select count(distinct salary) from worker w2
    where w2.salary >= w1.salary 
);


-- show 1st 50% record from a table
select * from worker where worker_id <= (select count(worker_id)/2 from worker) order by worker_id;

select * from worker where worker_id = (
	select min(worker_id) from worker
);


select * from worker where worker_id >= (select max(worker_id) from worker)-(5-1);


select concat(w.first_name, ' ', w.last_name) as name, w.department from (select max(salary) as maxSal, department from worker group by department) temp
inner join
worker w 
on w.department = temp.department and temp.maxSal = w.salary;



select concat(w1.first_name, ' ', w1.last_name) as name, w1.Department from worker w1 where salary = (
	select max(salary) from worker w2
    where w1.department = w2.department
);

select max(salary) from worker;


-- three max salaries from a table using co-related subquery
select distinct salary from worker w1 where 3 >= (
	select  count(distinct salary) from worker w2
    where w2.salary >= w1.salary) order by w1.salary desc;



