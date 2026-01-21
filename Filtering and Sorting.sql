use pwskills;

CREATE TABLE Employees(
EmpID INT PRIMARY KEY,
EmpName VARCHAR(30),
Department VARCHAR(20),
City VARCHAR(20),
Salary DECIMAL(10,2),
HireDate date
);

INSERT INTO Employees
Values(101,"Rahul Mehta","Sales","Delhi",55000,'2020-04-12'),
(102,"Priya Sharma","HR","Mumbai",62000,'2019-09-25'),
(103,"Aman Singh","IT","Bengaluru",72000,'2021-03-10'),
(104,"Neha Patel","Sales","Delhi",48000,'2022-01-14'),
(105,"Karan Joshi","Marketing","Pune",45000,'2018-07-22'),
(106,"Divya Nair","IT","Chennai",81000,'2019-12-11'),
(107,"Raj Kumar","HR","Delhi",60000,'2020-05-28'),
(108,"Simran Kaur","Finance","Mumbai",58000,'2021-08-03'),
(109,"Arjun Reddy","IT","Hyderabad",70000,'2022-02-18'),
(110,"Anjali Das","Sales","Kolkata",51000,'2023-01-15');

Select * from Employees
Where Department = "IT" or 
Department ="HR";

Select * from Employees
where Department in("Sales","IT","Finance");

select * from Employees
where salary between 50000 and 70000;

select * from Employees
Where EmpName Like "A%";

select * from Employees
Where EmpName Like "%an%";

select * from Employees
where City in("Delhi","Mumbai") AND Salary >55000;

Select * from Employees
where Department not in("HR");

select * from Employees
where Year(HireDate) between '2019' and '2022'
order by HireDate;