USE pwskills;

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(30),
department_id VARCHAR(8),
salary INT
);

INSERT INTO employee
VALUES
(101,'Abhishek','D01',62000),
(102,'Shubham','D01',58000),
(103,'Priya','D02',67000),
(104,'Rohit','D02',64000),
(105,'Neha','D03',72000),
(106,'Aman','D03',55000),
(107,'Ravi','D04',60000),
(108,'Sneha','D04',75000),
(109,'Kiran','D05',70000),
(110,'Tanuja','D05',65000);

CREATE TABLE department(
department_id VARCHAR(10) PRIMARY KEY,
department_name VARCHAR(20),
location VARCHAR(20)
);

INSERT INTO department
VALUES
('D01','Sales','Mumbai'),
('D02','Marketing','Delhi'),
('D03','Finance','Pune'),
('D04','HR','Bengaluru'),
('D05','IT','Hyderabad');

CREATE TABLE Sales(
sale_id INT PRIMARY KEY,
emp_id INT,
sale_amount INT,
sale_date date
);

INSERT INTO Sales
VALUES
(201,101,4500,'2025-01-05'),
(202,102,7800,'2025-01-10'),
(203,103,6700,'2025-01-14'),
(204,104,12000,'2025-01-20'),
(205,105,9800,'2025-02-02'),
(206,106,10500,'2025-02-05'),
(207,107,3200,'2025-02-09'),
(208,108,5100,'2025-02-15'),
(209,109,3900,'2025-02-20'),
(210,110,7200,'2025-03-01');

-- Retrieve the names of employees who earn more than the average salary of all employees.
SELECT name FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);

-- Find the employees who belong to the department with the highest average salary.
SELECT name FROM employee 
WHERE department_id = (
	SELECT department_id FROM employee
	GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);

-- List all employees who have made at least one sale.
SELECT DISTINCT e.name
FROM employee e
JOIN Sales s 
ON e.emp_id = s.emp_id;

-- Find the employee with the highest sale amount.
SELECT e.name
FROM employee e
JOIN Sales s
ON e.emp_id = s.emp_id
ORDER BY sale_amount DESC
LIMIT 1;

-- Retrieve the names of employees whose salaries are higher than Shubham’s salary.
SELECT name 
FROM employee
WHERE salary > 
	(SELECT salary 
     FROM employee
     WHERE name = "Shubham"
	);
    
-- Find employees who work in the same department as Abhishek.
SELECT name 
FROM employee
WHERE department_id =
	(SELECT department_id
     FROM employee
     WHERE name = "Abhishek"
);

-- List departments that have at least one employee earning more than ₹60,000.
SELECT DISTINCT department_name
FROM employee e
JOIN department d
ON e.department_id = d.department_id
WHERE salary >60000;

-- Find the department name of the employee who made the highest sale.
SELECT department_name 
FROM department d 
JOIN employee e
ON d.department_id = e.department_id
JOIN Sales s
ON e.emp_id = s.emp_id
ORDER BY sale_amount DESC
LIMIT 1;

-- Retrieve employees who have made sales greater than the average sale amount.
SELECT name
FROM employee e
JOIN Sales s
ON e.emp_id = s.emp_id
WHERE sale_amount >
	(SELECT AVG(sale_amount)
	 FROM Sales)
;

-- Find the total sales made by employees who earn more than the average salary.
SELECT name,sale_amount
FROM employee e
JOIN Sales s
ON e.emp_id = s.emp_id
WHERE salary >
	(SELECT AVG(salary)
	 FROM employee)
;

-- Find employees who have not made any sales.
SELECT name 
FROM employee e
LEFT JOIN Sales s
ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL; 

-- List departments where the average salary is above ₹55,000.
SELECT * FROM employee;
SELECT department_name
FROM department d
JOIN employee e 
ON d.department_id = e.department_id
GROUP BY department_name
HAVING AVG(salary) > 55000;

-- Retrieve department names where the total sales exceed ₹10,000.
SELECT department_name 
FROM department d 
JOIN employee e
ON d.department_id = e.department_id
JOIN Sales s
ON e.emp_id = s.emp_id
GROUP BY department_name
HAVING SUM(sale_amount) > 10000;

-- Find the employee who has made the second-highest sale.
SELECT name 
FROM employee e
JOIN Sales s
ON e.emp_id =s.emp_id
WHERE s.sale_amount = (
    SELECT MAX(sale_amount)
    FROM sales
    WHERE sale_amount < (
        SELECT MAX(sale_amount) FROM sales
    )
);

-- Retrieve the names of employees whose salary is greater than the highest sale amount recorded.
SELECT name 
FROM employee e
JOIN Sales s
ON e.emp_id = s.emp_id
WHERE salary >
	(SELECT MAX(sale_amount)
     FROM sales);