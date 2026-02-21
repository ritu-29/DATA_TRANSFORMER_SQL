-- create database
CREATE DATABASE data_transformer;
-- use database 
USE data_transformer;

-- Create customers Table
CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25),
    Email VARCHAR(50) UNIQUE,
    RegistrationDate DATE
);

-- Create orders Table
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
);

-- Create employees Table
CREATE TABLE EMPLOYEES (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


-- Insert customers records
INSERT INTO CUSTOMERS (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Ritu', 'Shah', ' ritu.shah@email.com ', '2020-05-03'),
(4, 'Pratik', 'Khan', 'pratik.khan@email.com', '2021-12-05'),
(5, 'Ekta', 'Mehta', 'ekta.mehta@email.com', '2022-08-06'),	
(6, 'Moni', 'Patel', 'moni.patel@email.com', '2023-11-07'),
(7, 'Rinku', 'Shah', 'rinku.shah@email.com', '2021-03-18'),
(8, 'Akash', 'Jain', 'akash.jain@email.com', '2023-05-29'),
(9, 'Aditi', 'Parmar', 'aditi.parmar@email.com', '2022-06-14'),
(10, 'Dev', 'Vyas', 'dev.vyas@email.com', '2022-09-13'),
(11, 'Rajat', 'Koli', 'rajat.koli@email.com', '2020-01-16'),
(12, 'Kartik', 'Mehara', 'kartik.mehra@email.com', '2022-09-13');

--  Insert Orders records
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 8, '2023-03-05', 1200.00),
(104, 4, '2023-04-04', 750.00),
(105, 5, '2023-05-25', 300.00),
(106, 6, '2023-06-12', 950.00),
(107, 7, '2023-07-18', 1100.00),
(108, 3, '2023-08-16', 450.00),
(109, 10, '2023-09-26', 600.00),
(110, 9, '2023-10-23', 1300.00),
(111, 12, '2023-11-12', 2000.00),
(112, 11, '2023-12-19', 520.00),
(113, 3, '2023-08-25', 2000.00),
(114, 4, '2023-05-24', 520.00);

--  Insert Employees records
INSERT INTO EMPLOYEES (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Rehan', 'Gupta', 'Sales', '2023-04-05', 60000.00),
(4, 'Pooja', 'Chaudhari', 'IT', '2021-06-21', 75000.00),
(5, 'Veena', 'Parmar', 'Finance', '2023-05-25', 56000.00),
(6, 'Shreya', 'Patel', 'IT', '2020-12-30', 78000.00),
(7, 'Ayushi', 'Yadav', 'Sales', '2022-07-16', 81000.00),
(8, 'Khushi', 'Parmar', 'HR', '2019-04-25', 55000.00),
(9, 'Devyanshi', 'Joshi', 'Finance', '2020-03-29', 35000.00),
(10, 'Riya', 'Patel', 'Sales', '2023-01-13', 80000.00),
(11, 'Alvish', 'Yadav', 'HR', '2019-10-08', 25000.00),
(12, 'Krihsa', 'Pal', 'Finance', '2022-08-05', 75000.00);

SELECT * FROM CUSTOMERS;
-- SELECT COUNT(*) FROM CUSTOMERS;

SELECT * FROM  ORDERS;

SELECT * FROM EMPLOYEES;

-- 1. INNER JOIN: Retrieve all orders and customer details where orders exist.
SELECT O.OrderId,C.FirstName,C.LastName, O.OrderDate, O.TotalAmount
FROM ORDERS AS O
INNER JOIN CUSTOMERS AS C
ON O.CustomerID = C.CustomerID;

-- 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any).
SELECT O.OrderId,C.FirstName,C.LastName, O.OrderDate, O.TotalAmount
FROM CUSTOMERS AS C 
LEFT JOIN ORDERS AS O
ON C.CustomerID = O.CustomerID;

-- 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any).
SELECT O.OrderId,C.FirstName,C.LastName, O.OrderDate, O.TotalAmount
FROM CUSTOMERS AS C
RIGHT JOIN ORDERS AS O
ON O.CustomerID = C.CustomerID;

-- 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching.
SELECT C.FirstName, C.LastName, O.OrderDate, O.TotalAmount
FROM CUSTOMERS AS C
LEFT JOIN ORDERS AS O
ON C.CustomerID = O.CustomerID
UNION
SELECT C.FirstName, C.LastName, O.OrderDate, O.TotalAmount
FROM CUSTOMERS AS C
RIGHT JOIN ORDERS AS O
ON C.CustomerID = O.CustomerID;

-- 5. Subquery to find customers who have placed orders worth more than the average amount.
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CustomerID = O.CustomerID
WHERE O.TotalAmount > (SELECT AVG(TotalAmount) FROM ORDERS);

-- 6. Subquery to find employees with salaries above the average salary.
SELECT EmployeeId, FirstName, Salary FROM EMPLOYEES
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEES);

-- 7. Extract the year and month from the OrderDate.
SELECT OrderID, YEAR(OrderDate) AS Order_Year, MONTH(OrderDate) AS Order_Month
FROM ORDERS;
 
--  8. Calculate the difference in days between two dates (order date and current date).
SELECT OrderID, DATEDIFF(CURDATE(), OrderDate) AS Days_Difference
FROM ORDERS;

-- 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY').
SELECT OrderID, DATE_FORMAT(OrderDate,'%d-%b-%Y') AS Formatted_Date
FROM ORDERS;

-- 10. Concatenate FirstName and LastName to form a full name.
SELECT CustomerId, CONCAT(FirstName,' ',LastName) AS FullName
FROM CUSTOMERS;

-- 11. Replace part of a string (e.g., replace 'John' with 'Jonathan').
SELECT FirstName, REPLACE(FirstName,'John','Jonathan') AS UpdatedName
FROM CUSTOMERS;

-- 12. Convert FirstName to uppercase and LastName to lowercase.
SELECT CustomerId,UPPER(FirstName) AS UpperFName, LOWER(LastName) AS LowerLName
FROM CUSTOMERS;

-- 13. Trim extra spaces from the Email field.
SELECT TRIM(Email) AS CleanEmail
FROM CUSTOMERS;

-- 14. Calculate the running total of TotalAmount for each order.
SELECT OrderID, OrderDate, TotalAmount, SUM(TotalAmount)
OVER(ORDER BY OrderDate) AS RunningTotal
FROM ORDERS;

-- 15. Rank orders based on TotalAmount using the RANK() function.
SELECT OrderID, TotalAmount,
RANK() OVER(ORDER BY TotalAmount DESC) AS RankOrder
FROM ORDERS;

-- 16. Assign a discount based on TotalAmount in orders (e.g., > 1000: 10% off, > 500: 5% off).
SELECT OrderID, TotalAmount,
CASE
WHEN TotalAmount > 1000 THEN '10% off'
WHEN TotalAmount > 500 THEN '5% off'
ELSE 'No Discount'
END AS Discount
FROM ORDERS;

-- 17. Categorize employees' salaries as high, medium, or low.
SELECT FirstName, Salary,
CASE
WHEN Salary >= 75000 THEN 'High'
WHEN Salary >= 45000 THEN 'Medium'
ELSE 'Low'
END AS Salary_Category
FROM EMPLOYEES;

