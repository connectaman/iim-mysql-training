# Dynamic SQL Generation

```sql
CREATE DATABASE IF NOT EXISTS dynamicsql;
USE dynamicsql; 

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO employees(emp_name,dept_id) VALUES
('Aman',1),
('Bob',2),
('Charlie',2),
('David',3),
('Emily',2);


SELECT emp_name FROM employees WHERE dept_id = 1;
SELECT emp_name FROM employees WHERE dept_id = 2;
SELECT emp_name FROM employees WHERE dept_id = 3;

```

Example of Simple Dynamic SQL (Approach 1)
```sql
SET @sql = 'SELECT emp_name FROM employees WHERE dept_id = ?';
PREPARE stmt FROM @sql;
SET @dept_id = 1;
EXECUTE stmt USING @dept_id;
DEALLOCATE PREPARE stmt;
```

Example of Simple Dynamic SQL (Approach 2)
```sql
SET @table_name = 'employees';
SET @condition = 'dept_id = 1';
SET @sql = CONCAT('SELECT * FROM',@table_name,' WHERE ',@condition)

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```

```
C

```