-- Creation of a database scheme for a fictional company that sells products to various clients

CREATE DATABASE office;

-- List of employees in the company
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    birth_day DATE,
    department_id INT,
    salary INT,
    employed_since DATE,
    supervisor_id INT
    );

-- List of the two departments in the company
CREATE TABLE department (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(20),
    manager_id INT,
    FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
    );

-- Assigning foreign keys to earlier created tables    
ALTER TABLE employee
ADD FOREIGN KEY(department_id)
REFERENCES department(department_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(supervisor_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;

-- List of the company's clients
CREATE TABLE client (
	client_id INT PRIMARY KEY,
    client_name VARCHAR(30),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(department_id) ON DELETE SET NULL
    );

-- Sales list for total sales for each employee-client connection
CREATE TABLE sales (
	client_id INT,
    employee_id INT,
    total_sales INT,
    PRIMARY KEY(client_id, employee_id),
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE
    );
    
-- Inserting of data into each table    
    
INSERT INTO employee VALUES (100, 'Peter', 'Jackson', '1959-03-17', NULL, 200000, '1999-01-05', NULL);

INSERT INTO department VALUES (1, 'Central', 100);

-- Assigning department_id since this couldnt be done initialy because the department table didn't have relevant data at that point
UPDATE employee
SET department_id = 1
WHERE employee_id = 100;

INSERT INTO employee VALUES (101, 'Dwayne', 'Johnson', '1981-02-15', 1, 95000, '2007-02-06', 100);
INSERT INTO employee VALUES (108, 'Bill', 'Paxton', '1968-12-02', 1, 95000, '2005-10-09', 100);
INSERT INTO employee VALUES (110, 'Michael', 'Biehn', '1972-12-23', 1, 85000,  '2000-09-12', 100);

INSERT INTO employee VALUES (109, 'Sigourney', 'Weaver', '1965-08-22', NULL, 110000, '1999-10-30', 100);

INSERT INTO department VALUES (2, 'East', 109);

-- Assigning department_id since this couldnt be done initialy because the department table didn't have relevant data at that point
UPDATE employee
SET department_id = 2
WHERE employee_id = 109;

INSERT INTO employee VALUES (102, 'Jennifer', 'Lawrence', '1990-11-27', 2, 65000, '2013-07-27', 109);
INSERT INTO employee VALUES (103, 'Dakota', 'Fanning', '1994-05-01', 2, 65000,  '2015-02-06', 109);
INSERT INTO employee VALUES (104, 'David', 'Callaghan', '1967-10-10', 2, 50000,  '2001-03-19', 109);
INSERT INTO employee VALUES (105, 'Lucy', 'Hale', '1992-01-27', 2, 50000,  '2009-10-15', 109);
INSERT INTO employee VALUES (106, 'Amanda', 'Seyfried', '1986-09-05', 2, 75000,  '2011-09-17', 109);
INSERT INTO employee VALUES (107, 'Tom', 'Arnold', '1970-09-19', 2, 95000,  '2005-10-21', 109);

INSERT INTO client VALUES (1000, 'Springfield Supermarket', 1);
INSERT INTO client VALUES (1001, 'Downtown Coffee', 2);
INSERT INTO client VALUES (1002, 'NK Consulting', 2);
INSERT INTO client VALUES (1003, 'Springfield Newspaper', 1);
INSERT INTO client VALUES (1004, 'Super Gardening', 1);

INSERT INTO sales VALUES (1000, 108, 55000);
INSERT INTO sales VALUES (1001, 107, 103500);
INSERT INTO sales VALUES (1002, 107, 17000);
INSERT INTO sales VALUES (1002, 110, 5500);
INSERT INTO sales VALUES (1002, 109, 4000);
INSERT INTO sales VALUES (1003, 101, 23000);
INSERT INTO sales VALUES (1003, 102, 12500);
INSERT INTO sales VALUES (1003, 110, 45000);
INSERT INTO sales VALUES (1004, 103, 87500);
INSERT INTO sales VALUES (1004, 104, 9500);
INSERT INTO sales VALUES (1004, 105, 51000);
INSERT INTO sales VALUES (1004, 106, 66000);
INSERT INTO sales VALUES (1004, 107, 12000);
INSERT INTO sales VALUES (1004, 108, 66000);
INSERT INTO sales VALUES (1004, 109, 19000);
