
USE test

--Create table 
CREATE TABLE Customer_Details(
	customer_id INT IDENTITY PRIMARY KEY,
	customer_name VARCHAR(20)
	);

--create table
CREATE TABLE Order_Details(
	order_id INT IDENTITY PRIMARY KEY,
	order_date DATE,
	order_price INT,
	order_quantity INT,
	customer_id INT FOREIGN KEY REFERENCES Customer_Details(customer_id)
)

--create table
CREATE TABLE Pdt(
	Pdt_no INT IDENTITY PRIMARY KEY,
	Pdt_name VARCHAR(20)
)

--create table
CREATE TABLE Manufacturer_Details(
	manufacturer_id INT IDENTITY PRIMARY KEY,
	manufacturer_name VARCHAR(20)
)

--create table
CREATE TABLE Product_Details(
	product_id INT,
	order_id INT FOREIGN KEY REFERENCES Order_Details(order_id),
	manufacturer_date DATE,
	Pdt_no INT FOREIGN KEY REFERENCES Pdt(Pdt_no),
	manufacturer_id INT FOREIGN KEY REFERENCES Manufacturer_Details(manufacturer_id)
	)

--insert values
INSERT INTO Customer_Details VALUES
('Jayesh'),
('Abhilash'),
('Lily'),
('Aswathy')

SELECT * FROM Customer_Details

INSERT INTO Order_Details VALUES
('2020-12-22', 270, 2, 1 ),
('2019-08-10', 280,4,2),
('2019-07-13', 600,5,3),
('2020-07-15', 520, 1,1),
('2020-12-22', 1200, 4,4),
('2019-10-02', 720, 3,1),
('2020-11-03', 3000, 2,3),
('2020-12-15', 1100, 4,4),
('2019-12-29', 5500, 2,1)

SELECT * FROM Order_Details

INSERT INTO Pdt VALUES
('MobilePhone'),
('LED TV'),
('Laptop'),
('Headphone'),
('PowerBank')

SELECT * FROM Pdt

INSERT INTO Manufacturer_Details VALUES
('Samsung'),
('Sony'),
('Mi'),
('Boat')

SELECT * FROM Manufacturer_Details

INSERT INTO Product_Details VALUES
(145, 2, '2019-12-23', 1,1),
(147, 6, '2019-08-15', 1,3),
(435, 5, '2018-11-04', 2,1),
(783, 1, '2017-11-03', 2,2),
(784, 4, '2019-11-28', 3,2),
(123, 2, '2019-10-03', 4,2),
(267, 5, '2017-12-03', 3,4),
(333, 9, '2018-11-12', 3,1),
(344, 3, '2018-11-03', 3,1),
(233, 3, '2019-11-30', 5,2),
(567, 6, '2019-09-03', 5,2)

select *FROM Product_Details

--1) Total number of orders placed in each year.SELECT SUM(order_quantity) AS 'Total orders each year',
DATENAME(year, order_date) AS 'Year' 
FROM Order_Details
GROUP BY DATENAME(year, order_date)
--2) Total number of orders placed in each year by Jayesh.
SELECT COUNT(order_id) AS 'Total orders by Jayesh'
FROM Order_Details
WHERE customer_id = 1

--3) Products which are ordered in the same year of its manufacturing year.
SELECT p1.Pdt_name, o1.order_date, p2.manufacturer_date
FROM Pdt p1, Order_Details o1, Product_Details p2
WHERE DATENAME(year,o1.order_date)=DATENAME(year,p2.manufacturer_date)

--4) Products which is ordered in the same year of its manufacturing year where the
--Manufacturer is ‘Samsung’.
SELECT p1.Pdt_name, o1.order_date, p2.manufacturer_date
FROM Pdt p1, Order_Details o1, Product_Details p2
WHERE DATENAME(year,o1.order_date)=DATENAME(year,p2.manufacturer_date) 
AND p2.manufacturer_id = 1


--5) Total number of products ordered every year.
SELECT COUNT(product_id) AS 'Total no of products each year',
DATENAME(year, manufacturer_date) AS 'Year' 
FROM Product_Details
GROUP BY DATENAME(year, manufacturer_date)

--6) Display the total number of products ordered every year made by sony.
SELECT COUNT(product_id) AS 'Total no of products each year',
DATENAME(year, manufacturer_date) AS 'Year' 
FROM Product_Details
WHERE manufacturer_id = 2
GROUP BY DATENAME(year, manufacturer_date)

--7) All customers who are ordering mobile phone by samsung.
SELECT DISTINCT c1.customer_name FROM Customer_Details c1, Product_Details p2
WHERE p2.Pdt_no=1 AND p2.manufacturer_date=1 

--8) Total number of orders got by each Manufacturer every year.
SELECT COUNT(*) AS 'Total orders' FROM Product_Details
GROUP BY manufacturer_id


--9) All Manufacturers whose products were sold more than 1500 Rs every year.