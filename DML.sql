use temp;

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

SELECT * FROM Customer;

-- ON DELETE CASECADE(if delete parent id , related all detils are delted on child
CREATE TABLE Order_details (
	Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) references Customer(id) ON DELETE CASCADE
);

-- ON DELETE SET NULL(If delete the parent id , it will reflect the child data
CREATE TABLE Order_details (
	Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) references Customer(id) ON DELETE SET NULL
);

INSERT INTO Order_details VALUES 
(1, '2019-03-11', 128);
INSERT INTO Order_details VALUES 
(2, '2019-03-12', 128);

SELECT * FROM Order_details;

-- INSERT
INSERT INTO Customer VALUES 
(128, 'Satya Prakash', 'Baripada', 'M', 'Baripada', 144001);
 
SELECT * FROM Customer;
INSERT INTO Customer VALUES (130, 'Mohit Mallick', 'Balasore', 'M', 'Balasore', 144002);

INSERT INTO Customer(id, City)
VALUES (135, 'Udala');

-- UPDATE

UPDATE Customer SET cname = 'Mohit Mallick', Gender = 'M' WHERE id = 135;

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = 14000;

-- DELETE
DELETE FROM Customer WHERE id = 128;

DELETE FROM Customer;

-- REPLACE
-- HAS TWO BEHAVIOUR
-- 1. Data already present, Replace
-- 2. Data not present, INSERT

SELECT * FROM Customer;
-- modify the field
REPLACE INTO Customer (id,city)
	VALUES (210, 'Baripada');
 -- inset a new touple
 
 REPLACE INTO Customer (id, cname, city)
 VALUES (897, 'Mohit Mallick', 'Balasore');

REPLACE INTO Customer SET id = 897, cname = 'Satya Prakash', city = 'Cuttack';

REPLACE INTO Customer (id, cname, city)
	SELECT id, cname, city
    FROM Customer WHERE id = 500;

