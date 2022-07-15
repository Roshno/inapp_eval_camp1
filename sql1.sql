--question 1
--create database
CREATE DATABASE test

USE test

--create table Employee having emp_id, emp_name, pay
CREATE TABLE Employee(
	emp_id INT IDENTITY PRIMARY KEY,
	emp_name VARCHAR(50),
	pay INT
	);

--create table Department having dept_id and dept_name
CREATE TABLE Department(
	dept_id INT,
	dept_name VARCHAR(50)
	);

--create table EmpDept having emp_id and dept_id
CREATE TABLE EmpDept(
	emp_id INT,
	dept_id INT
	);


--inserting values into table Employee
INSERT INTO Employee VALUES
('Dilip', 3000),
('Fahad', 4000),
('Lal', 6000),
('Nivin', 2000),
('Vijay', 9000),
('Anu', 5000),
('Nimisha', 5000),
('Praveena', 8000)

SELECT * FROM Employee

--inserting values into table Employee
INSERT INTO Department VALUES
(50, 'IT'),
(51, 'Sales'),
(52, 'Marketing'),
(53, 'HR')

SELECT * FROM Department

--inserting values into table EmpDept
INSERT INTO EmpDept VALUES
(001,50),
(002,51),
(003, 52),
(004, 50),
(005, 51),
(006,53),
(007,51),
(008,52)

SELECT * FROM EmpDept


--1) The total number of employees
SELECT COUNT(emp_id) FROM Employee;

--2) Total amount required to pay all employees
SELECT SUM(pay) FROM Employee;

--3) Average, minimum and maximum pay in the organization
SELECT AVG(pay) AS 'Average Pay' FROM Employee;
SELECT MAX(pay) AS 'Maximum Pay' FROM Employee;
SELECT MIN(pay) AS 'Minimum Pay' FROM Employee;

--4) Each Department wise total pay
SELECT Department.dept_name,SUM(Employee.pay)
FROM Employee
INNER JOIN EmpDept ON Employee.emp_id = EmpDept.emp_id
INNER JOIN Department ON EmpDept.dept_id = Department.dept_id
GROUP BY dept_name

--5) Average, minimum and maximum pay department-wise.
SELECT Department.dept_name,AVG(Employee.pay) AS 'Average', MIN(Employee.pay) AS 'Minimum' , MAX(Employee.pay) AS 'Maximum'
FROM Employee
INNER JOIN EmpDept ON Employee.emp_id = EmpDept.emp_id
INNER JOIN Department ON EmpDept.dept_id = Department.dept_id
GROUP BY dept_name


--6) Employee details who earns the maximum pay.--7) Employee details who is having a maximum pay in the department.



SELECT emp_id, emp_name, pay, Department.dept_name FROM Employee
RIGHT JOIN(
    SELECT dept_id, MAX(pay) AS max_pay
    FROM Employee
    GROUP BY dept_id
) AS sub ON Employee.pay = Employee.max_pay AND Employee.dept_id = Department.dept_id
JOIN Department ON Employee.dept_id = Department.dept_id--9) Employee who has more pay than the average pay of his departmentSELECT emp_name FROM Employee 
WHERE pay > (SELECT AVG(pay) FROM Employee)

--10)Unique departments in the companySELECT DISTINCT dept_name FROM Department;--11) Employees In increasing order of paySELECT * FROM Employee
ORDER BY pay;

--12)Department In increasing order of pay
SELECT department.dept_name,SUM(Employee.pay) AS pay
FROM Employee
INNER JOIN EmpDept ON Employee.emp_id = EmpDept.emp_id
INNER JOIN department ON EmpDept.dept_id = Department.dept_id
GROUP BY dept_name
ORDER BY pay