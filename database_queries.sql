-- Find all employees
SELECT *
FROM employee;

-- Find all clients
SELECT *
FROM client;

-- Find all employees ordered by salary in descending order
SELECT *
FROM employee
ORDER BY salary DESC;

-- Find all employees ordered by salary in descending order then name
SELECT *
FROM employee
ORDER BY salary DESC, first_name, last_name;

-- Find the name of the first 2 employees in the employee table
SELECT first_name AS forename, last_name AS surname
FROM employee
LIMIT 2;

-- Find all employees who where employed after 2000-01-01
SELECT *
FROM employee
WHERE employed_since > '2000-01-01';

-- Find the total amount of supervisors
SELECT DISTINCT supervisor_id
FROM employee;

-- Find the number of employees
SELECT COUNT(employee_id)
FROM employee;

-- Find the number of employees who have a salary above 60000 and who is born after 1970-01-01
SELECT COUNT(employee_id)
FROM employee
WHERE salary > 60000 AND birth_day > '1970-01-01';

-- Find the average salary of the employees who work in department 'East'
SELECT AVG(Salary)
FROM employee
WHERE department_id = 2;

-- Find the sum of salaries from employees who work in department 'Central'
SELECT SUM(Salary)
FROM employee
where department_id = 1;

-- Find the amount of people who work in each department
SELECT count(employee_id) AS Employees, department_id as Deparment
FROM employee
GROUP BY department_id;

-- Find the total sales for each employee
SELECT SUM(Sales.total_sales) AS total_sales, employee.employee_id, employee.first_name, employee.last_name
FROM sales
RIGHT JOIN employee ON employee.employee_id = sales.employee_id
GROUP BY employee.employee_id;

-- Find clients whose name includes 'Springfield'
SELECT *
FROM client
WHERE client_name LIKE '%Springfield%';

-- Find employees whose first name begin with a 'D'
SELECT *
FROM employee
WHERE first_name LIKE 'D%';

-- Find employees whose first name does not begin with a 'D'
SELECT *
FROM employee
WHERE first_name NOT LIKE 'D%';

-- Find employees whos birthday is in September
SELECT *
FROM employee
WHERE birth_day LIKE '____-09%';

-- Make a list of employees and departments
SELECT first_name
FROM employee
UNION
SELECT department_name
FROM department;

-- Find names of all employees who have sold over 30000 to a single client
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.employee_id IN (
	SELECT sales.employee_id
	FROM sales
	WHERE sales.total_sales > 30000
);

-- Find all clients that are managed by department 'Central'
SELECT client.client_name
FROM client
WHERE client.department_id = (
	SELECT department.department_id
	FROM department
	WHERE department.department_id = 1
    );
