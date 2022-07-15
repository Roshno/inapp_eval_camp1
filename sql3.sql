--Create table Department
CREATE TABLE Departments(
    departments_no INT NOT NULL PRIMARY KEY,
    departments_name VARCHAR(20),
    loc VARCHAR(20)
);

CREATE TABLE Employees(
    employ_no INT NOT NULL PRIMARY KEY,
    employ_name VARCHAR(20),
    job_id VARCHAR(20),
    mgr INT,
    hire_date DATE,
    sal MONEY,
    commission MONEY,
    deptno INT NOT NULL,
    CONSTRAINT dept_fk
        FOREIGN KEY (deptno)
        REFERENCES Departments(departments_no)
);


--Insert data into tables
INSERT INTO Departments VALUES
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');

SELECT * FROM Departments


INSERT INTO Employees VALUES
    (7839, 'KING', 'PRESIDENT', NULL, '11/17/1981', 5000, NULL, 10),
    (7698, 'BLAKE', 'MANAGER', 7839, '05/01/1981', 2850, NULL, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '06/09/1981', 2450, NULL, 10),
    (7566, 'JONES', 'MANAGER', 7839, '04/02/1981', 2975, NULL, 20),
    (7788, 'SCOTT', 'ANALYST', 7566, '12/09/1982', 3000, NULL, 20),
    (7902, 'FORD', 'ANALYST', 7566, '12/03/1981', 3000, NULL, 20),
    (7369, 'SMITH', 'CLERK', 7902, '12/17/1980', 800,  NULL,20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '02/20/1981', 1600 ,300, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '02/22/1981', 1250 ,500, 30),
    (7654, 'MARTIN', 'SALESMAN', 7698, '09/28/1981', 1250 ,1400, 30),
    (7844, 'TURNER', 'SALESMAN', 7698, '09/08/1981', 1500, NULL, 30),
    (7876, 'ADAMS', 'CLERK', 7788, '01/12/1983', 1100, NULL, 20),
    (7900, 'JAMES', 'CLERK', 7698, '12/03/1981', 950, NULL, 30),
    (7934, 'MILLER', 'CLERK', 7782, '01/23/1982', 1300, NULL, 10);

SELECT * FROM Employees

--1. Report needed: Names of employees who are manager.
--Hint: The names of people who have their own employeeID as the managerIDSELECT employ_name FROM Employees
WHERE employ_no=mgr--2. List the name of all employees along with their department name and Annual Income.
--For each row get the output in the form ‘Every Year Mark of Accounts department
--earns amount 450000’. This output has to come under a heading ‘Annual income Report’.
SELECT CONCAT('Every year ',e1.employ_name,' of ',d1.departments_name,' department earns amount ',e1.commission) 
AS 'Annual Income Report'
FROM Employees e1, Departments d1