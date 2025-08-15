CREATE DATABASE temp;
USE temp;

CREATE TABLE Customer (
	id integer PRIMARY KEY,
    cname varchar(225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode integer
);

INSERT INTO Customer VALUES 
(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
(1300, 'Shayam Sing', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
(245, 'Nellabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144002),
(210, 'Barkha Sing', 'Dibagh Nagar', 'F', 'Jalandhar', 144002),
(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 144001);
select * from Customer;

CREATE TABLE Order_details (
	Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) references Customer(id)
);
INSERT INTO Order_details VALUES 
(1, '2019-03-11', 245);
SELECT * FROM Order_details;

CREATE TABLE account (
id INT PRIMARY KEY, 
name VARCHAR(225) 
);

DROP TABLE account;
CREATE TABLE account_details (
id INT PRIMARY KEY, 
name VARCHAR(225) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

INSERT INTO account_details (id, name) VALUES
(1, 'satya');
INSERT INTO account_details (id, name) VALUES
(2, 'mohit');
SELECT * FROM account_details;
DESC account_details;

-- DROP TABLE account_details;

-- ALTER
-- ADD(add new column)
ALTER TABLE account_details ADD interest FLOAT;

-- MODIFY(it modify the datatype)

ALTER TABLE account_details MODIFY interest DOUBLE;

-- CHANGE COLUMN(rename the column name

ALTER TABLE account_details CHANGE COLUMN interest saving_interest FLOAT;

-- DROP COLUMN
ALTER TABLE account_details DROP COLUMN saving_interest;

-- RENAME (rename the table name)
ALTER TABLE account_details RENAME TO account;

SELECT * FROM account;






