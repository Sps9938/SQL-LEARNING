create Database Research_paper;
show databases;
use Research_paper;

create table Publish (
	paper_id INT PRIMARY KEY,
    paper_name VARCHAR(255),
    author_name VARCHAR(255),
    publish_date DATE,
    Dept_name VARCHAR(255)
);

insert into PUblish values 
(1, 'Graph Classification with GNNs', 'Satya', '2025-04-24', 'CSE'),
(2, 'Electronic Hand Book', 'Mohit', '2025-08-12', 'ECE'),
(3, 'SkySCALE', 'Debraj', '2025-09-14', 'CSE');

create table total_Publish (
	author_name VARCHAR(255),
    total_paper_publish INT,
    Dept_name VARCHAR(255)
);
INSERT INTO total_Publish values
('Satya', 20, 'CSE'),
('Mohit', 16, 'ECE'),
('Debraj', 38, 'CSE'),
('Abhi', 33, 'ECE'),
('Rahat', 39, 'Civil'),
('Bikash', 18, 'Mechnical');
-- where
-- show the data for dept cse
select * from Publish where Dept_name = 'CSE';

-- on cse dept show paper_name, author_name and date
select paper_name, author_name, publish_date from Publish where Dept_name = 'CSE';


select * FROM Publish;

select * from total_Publish;

-- Between
-- between 20-30(total_publish) show the data
select * from total_Publish where total_paper_publish > 10 AND total_paper_publish < 30;

-- OR
select * from total_Publish where author_name = 'Satya' OR author_name = 'Mohit' OR author_name = 'Bikash';

-- IN 
select * from total_publish where author_name IN('Satya','Mohit', 'Bikash', 'Debraj');

-- NOT IN
-- retrive the data which author_name is not satya, mohit and debraj;
select * from total_publish where author_name NOT IN('Satya', 'Mohit', 'Debraj');

-- % like
-- show the data whose author name is belongs to 1st alphabet  a 

select * from total_Publish where author_name LIKE 'a%';

-- show the data whose author name is belongs to 2nd alphabet  a 

select * from total_Publish where author_name LIKE '%a';

-- show the data whose author name is belongs to last alphabet  t 
select * from total_Publish where author_name LIKE '_%t';

-- ORDER BY
-- show the data according to total parer in assending order

select * from total_Publish ORDER BY total_paper_publish ASC;

-- show the data according to total parer in descending order
select * from total_Publish ORDER BY total_paper_publish DESC;

-- DISTINCT
-- show the data distinct dept(wants check dept name)
select DISTINCT(Dept_name) from total_Publish;

-- GROUP BY
-- show the data how many dept (not count same dept in multiple times) and make in asc order

select Dept_name, COUNT(Dept_name) from total_Publish  GROUP BY Dept_name ORDER BY COUNT(Dept_name) ASC;

select Dept_name, SUM(total_paper_publish) from total_Publish GROUP BY Dept_name;

select Dept_name, AVG(total_paper_publish) from total_Publish GROUP BY Dept_name;

select Dept_name, MIN(total_paper_publish) from total_Publish GROUP BY Dept_name;

select Dept_name, MAX(total_paper_publish) from total_Publish GROUP BY Dept_name;

select Dept_name, COUNT(Dept_name) from total_Publish  GROUP BY Dept_name HAVING COUNT(Dept_name) >=2;
