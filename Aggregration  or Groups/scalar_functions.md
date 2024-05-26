
# Scalar Function

Scalar Functions in SQL are functions that operate on a single value and returns a single value. These functions can be used in various parts of SQL to manipulate data or perform calculations on individual rows.

1. String Functions: `CONCAT()`, `UPPER()` , `LOWER()` , `SUBSTRING()` etc..
2. Mathematical Function: `ROUND()` , `FLOOR()` , `ABS()` etc..
3. Date and time: `DATE_FORMAT()` , `DATE_ADD()` , `DATEDIFF()` , `NOW()` etc..
4. Convert Functions: `CAST()` , `CONVERT()`, `TO_CHAR()` etc..
..
..

```sql
CREATE DATABASE IF NOT EXISTS aggregation;

USE aggregation;

CREATE TABLE Employees (
    EmployeeId INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary FLOAT
);

INSERT INTO Employees(EmployeeId,first_name,last_name,salary) VALUES
(1,'Aman','Ulla',45343.454),
(2,'Alice','Johnson',34343.34),
(3,'Rahul','Sharma',34235.34),
(4,'Bob','Jim',54634.343);

Select * from Employees;
```
- Concatenating firstname and lastname as fullname
```sql
SELECT CONCAT(first_name,' ',last_name) as full_name 
FROM Employees;
```
- Getting length of the fullname
```sql
Select first_name,last_name,CONCAT(first_name,' ',last_name) as full_name,LENGTH(CONCAT(first_name,' ',last_name)) as length_of_fullname 
FROM Employees;
```

- Converting Salary to USD (1 USD = 84 INR)
```sql
Select first_name,last_name, ROUND(salary / 84) as salary_usd
FROM Employees;
```
- Generate an email address based on firstname and lastname
```sql
SELECT CONCAT(LOWER(first_name),'.',LOWER(last_name),'@company.com') as email 
FROM Employees;
```
