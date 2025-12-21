CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date date
);

INSERT INTO employees
values
(101,"Amit","Sharma","HR",50000,'2020-01-15'),
(102,"Riya","Kapoor","Sales",75000,'2019-03-22'),
(103,"Raj","Mehta","IT",90000,'2018-07-11'),
(104,"Neha","Verma","IT",85000,'2021-09-01'),
(105,"Arjun","Singh","Finance",60000,'2022-02-10');

SELECT * FROM employees
ORDER BY salary;

SELECT * FROM employees
ORDER BY department asc, salary desc;

SELECT * FROM employees
WHERE department = "IT"
ORDER BY hire_date desc;

CREATE TABLE sales(
sale_id INT PRIMARY KEY,
customer_name VARCHAR(50),
amount INT,
sale_date date
);

INSERT INTO sales
values
(1,"Aditi",1500,'2024-08-01'),
(2,"Rohan",2200,'2024-08-03'),
(3,"Aditi",3500,'2024-09-05'),
(4,"Meena",2700,'2024-09-15'),
(5,"Rohan",4500,'2024-09-25');

select * from sales
ORDER BY amount desc;

select * from sales
where customer_name ="Aditi";



