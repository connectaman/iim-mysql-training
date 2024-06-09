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

`DE_RANK()`
```sql
SELECT student_id,department_id,fees,
    DENSE_RANK() OVER (ORDER BY fees DESC) as rank_col
FROM students;
```


