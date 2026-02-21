## 📌 Project Title: Data Transformer SQL Project

### 📖 Project Description

The **Data Transformer SQL Project** is designed to demonstrate the use of SQL for managing, transforming, and analyzing structured business data such as customer records, employee details, and order transactions.

This project focuses on performing data operations like filtering, joining tables, formatting dates, applying conditions, and using advanced SQL concepts such as aggregate functions, subqueries, window functions, and CASE statements for decision making.

---

## 🗂️ Database Used

```text
data_transformer
```

---

## 📊 Tables Created

### 1️⃣ CUSTOMERS

Stores customer personal and registration details.

| Column Name      | Data Type         |
| ---------------- | ----------------- |
| CustomerID       | INT (Primary Key) |
| FirstName        | VARCHAR           |
| LastName         | VARCHAR           |
| Email            | VARCHAR (Unique)  |
| RegistrationDate | DATE              |

---

### 2️⃣ ORDERS

Stores customer order transaction data.

| Column Name | Data Type         |
| ----------- | ----------------- |
| OrderID     | INT (Primary Key) |
| CustomerID  | INT (Foreign Key) |
| OrderDate   | DATE              |
| TotalAmount | DECIMAL           |

---

### 3️⃣ EMPLOYEES

Stores employee salary and department information.

| Column Name | Data Type         |
| ----------- | ----------------- |
| EmployeeID  | INT (Primary Key) |
| FirstName   | VARCHAR           |
| LastName    | VARCHAR           |
| Department  | VARCHAR           |
| HireDate    | DATE              |
| Salary      | DECIMAL           |

---
## 🔑 Foreign Key Concept

A **Foreign Key** is a column in one table that links to the **Primary Key** of another table to create a relationship between them.

In this project:

* `CustomerID` in the **ORDERS** table is a **Foreign Key**
* It references `CustomerID` in the **CUSTOMERS** table

## 🔗 SQL JOINS (Easy Diagram Explanation)

We have 2 Tables:

```text
CUSTOMERS      ORDERS
```

Connected by:

```text
CustomerID
```

---

### 🟢 INNER JOIN

Shows only **matching data**

```text
CUSTOMERS   ∩   ORDERS
```

✔ Customer placed order → Show
❌ No order → Not show

👉 Only customers who made orders

---

### 🔵 LEFT JOIN

Shows **all customers**

```text
CUSTOMERS   +   Matching ORDERS
```

✔ Customer placed order → Show
✔ No order → Show (Order = NULL)

👉 All customers will appear

---

### 🟠 RIGHT JOIN

Shows **all orders**

```text
ORDERS   +   Matching CUSTOMERS
```

✔ Order has customer → Show
✔ No customer → Show (Customer = NULL)

👉 All orders will appear

---

### 🟣 FULL OUTER JOIN

Shows **everything**

```text
CUSTOMERS   +   ORDERS
```

✔ Matching data → Show
✔ Customer without order → Show
✔ Order without customer → Show

(MySQL uses LEFT JOIN + RIGHT JOIN with UNION)

---

### 🎯 Simple Summary

| JOIN       | Shows         |
| ---------- | ------------- |
| INNER JOIN | Only Matching |
| LEFT JOIN  | All Customers |
| RIGHT JOIN | All Orders    |
| FULL JOIN  | Everything    |

---
### 🔹 6. Aggregate Functions Used

* MAX()
* AVG()
* SUM()

Used for salary and order amount analysis.

---

### 🔹 7. Date Functions

* YEAR()
* MONTH()
* DATEDIFF()
* DATE_FORMAT()

Used for extracting and formatting order dates.

---

### 🔹 8. String Functions

* CONCAT()
* REPLACE()
* UPPER()
* LOWER()
* TRIM()

Used for cleaning and transforming textual data like customer names and emails.

---

### 🔹 9. Window Functions

Running Total of Order Amount using:

```text
SUM() OVER(ORDER BY OrderDate)
```

---

### 🔹 10. RANK() Function

Used to rank orders based on TotalAmount in descending order.

---

### 🔹 11. CASE Statement

#### ✔ Discount Assignment Based on Order Amount:

| Order Amount | Discount |
| ------------ | -------- |

> 1000 | 10% |
> 500 | 5% |
> Else | No Discount |

---

#### ✔ Employee Salary Categorization:

| Salary Range | Category |
| ------------ | -------- |
| ≥ 75000      | High     |
| 35000–74999  | Medium   |
| < 35000      | Low      |

---

## 🎯 Project Objective

To apply SQL concepts for:

* Data Retrieval
* Data Cleaning
* Conditional Transformation
* Analytical Queries
* Business Decision Making

---

## 🚀 Tools Used

* MySQL Workbench
* SQL Language

---

## 📌 Conclusion

This project demonstrates how SQL can be used to manage relational databases and extract meaningful insights using joins, subqueries, functions, and conditional logic.

---
