# SQL Functions

SQL Function in MYSQL are built-in operations that allow you to perform calculations, manipulate, string, work with data and more.

1. **Aggregrate Functions** : These functions are to operate on a set of values and return a single value, Example
`SUM()` , `COUNT()` , `AVG()`, `MAX()` , `MIN()`
2. **String Functions** : These functions performs operations on string data. Example `CONCAT()`, `SUBSTRING()` , `LENGTH()`, `UPPER()`, `LOWER()` , `TRIM()` ... 
3. **Date and Time Functions** : These functions works with data and time values. Example `NOW()`, `CURDATE()`, `DATEDIFF()`, `DATE_FORMAT()` , `TIMESTAMPDIFF()` ...
4. **Numeric Functions** : These funtions perform operations on numeric data types. Example `ROUND()` , `FLOOR()` , `ABS()`, `MOD()` ...

```sql
USE aggregation;

CREATE TABLE students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(50),
department VARCHAR(50),
date_of_joining DATE,
fees FLOAT
);

INSERT INTO students(student_name,department,date_of_joining,fees) VALUES
('Aman Ulla','CS','2020-01-01', 55000.34),
('Bob Smith','IT','2022-06-11', 34465.86),
('John Evans','CS','2021-12-16', 67564.55),
('Kim Snow','MECH','2019-11-21', 45454.23),
('Alice Snowwhite','IT','2023-05-26', 34457.99);

```
