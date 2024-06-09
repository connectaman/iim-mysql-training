# Index

Indexes are used to speed up the retrieval of rows from a table. Indexes are created on column that are frequently used in search conditions of queries to enhance performace.

Sample Table with primary

|EmpId | EmpName | Department |
| ---- | ---- | ---| 
| 1 | Aman | IT |
| 2 | Kim | HR | 
| 3 | George | IT |


![Index Drawing](/indexes/indexes.png)


Syntax
```sql
CREATE INDEX index_name ON table_name(column_name);
```


```sql
CREATE DATABASE IF NOT EXISTS createindex;

USE createindex;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    position VARCHAR(50),
    salary FLOAT,
    department_id INT
);


INSERT INTO employees(name,position, salary,department_id) VALUES
('Aman','Manager',60000,1),
('Jane','Developer',55000,2),
('Alice','Designer',70000,3),
('Kim','Developer',45000,2),
('George','Manager',55000,1);

-- create index on position column
CREATE INDEX position_idx ON employees(position);

-- to see / view indexes created on the table
SHOW INDEX FROM employees;

-- Query on the table
Select * from employees WHERE position = 'Manager';

```

