# Window Functions

Window Functions perform calculation across a set of table rows that are related to current row within the result set.

Window Funtions are defined using the `OVER` clause, which can include `PARITION BY` and `ORDER BY` subclauses to specify how the data should be grouped and ordered.

Common Window Functions in MySQL:
1. `ROW_NUMBER()`: Assigns a unique sequential integer to rows within a partion of result set
2. `RANK()` : Assigns a rank to each row within a partion of result set, with gaps between ranks if there are ties
3. `SUM()` : Returns the sum of values
4. `AVG()` : Returns the average of the values
5. `MAX()` : Returns the maximun value
6. `MIN()` : Returns the min value
7. `FIRST_VALUE()` : Return the first value in an ordered Set of values
8. `LAST_VALUE()` : Return the last value in an ordered Set of values
9. `DENSE_RANK() : Similar to `RANK`, but ranks are consecutive, no gaps ranking.

```sql
-- DO NOT RUN THIS
CREATE DATABASE IF NOT EXISTS createindex;

USE createindex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    department_id INT,
    fees FLOAT,
    startdate DATE
);

INSERT INTO students(student_id,department_id,fees,startdate) VALUES
(1,1,40000,'2020-01-01'),
(2,1,45000,'2021-11-15'),
(3,2,55000,'2022-06-16'),
(4,2,30000,'2020-11-11'),
(5,3,78000,'2022-11-11');

Select * from students;
```

`ROW_NUMBER()` 
```sql
Select student_id,
        department_id,
        fees,
        ROW_NUMBER() OVER (ORDER BY fees DESC) as row_num
FROM students;
```

`RANK()`
```sql
SELECT student_id,department_id,fees,
    RANK() OVER (ORDER BY fees DESC) as rank_col
FROM students;
```

`DENSE_RANK()`
```sql
SELECT student_id,department_id,fees,
    DENSE_RANK() OVER (ORDER BY fees DESC) as rank_col
FROM students;
```


```sql

CREATE TABLE sales (
	sales_rep_id INT,
	sales_rep_name varchar(50),
    total_sales float
);

INSERT INTO sales VALUES 
(1,'Aman',10000),
(2,'Bob',8000),
(3,'Alice',12000),
(4,'Kim',10000),
(5,'David',6500);


Select * from sales;

SELECT sales_rep_id,
		sales_rep_name,
        total_sales,
        RANK() OVER (order by total_sales DESC) AS sales_rank
FROM sales;

SELECT sales_rep_id,
		sales_rep_name,
        total_sales,
        DENSE_RANK() OVER (order by total_sales DESC) AS sales_rank
FROM sales;


SELECT department_id,
    AVG(fees) OVER (PARTITION BY department_id) as avg_fees
FROM students;

SELECT department_id,AVG(fees)
from students
GROUP BY department_id;
```