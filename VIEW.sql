 -- mysql views
 
 CREATE VIEW custom_view AS SELECT fname, age FROM employee;
 SELECT * FROM custom_view;
 
 -- ALTERING THE VIEW
 ALTER VIEW custom_view AS SELECT fname, lname, age FROM employee;
 
 -- DROPPING THE VIEW
 DROP VIEW IF EXISTS custom_view;