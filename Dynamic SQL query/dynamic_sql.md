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
SET @sql = CONCAT('SELECT * FROM ',@table_name,' WHERE ',@condition);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```

```sql
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id  INT,
    sale_amount FLOAT,
    sale_date DATE
);

INSERT INTO sales (emp_id,sale_amount,sale_date) VALUES
(1,100.0,'2023-05-01'),
(2,200.0,'2023-05-02'),
(1,150.0,'2023-05-03'),
(3,300.0,'2023-05-04'),
(2,50.0,'2023-05-05');

-- Query 

SELECT emp_id,sale_amount,sale_date, 
	RANK() OVER (PARTITION BY emp_id ORDER by sale_amount DESC) as sale_rank
FROM sales
WHERE date_format(sale_date,'2023-05');


SET @year_month = '2023-05';
SET @sql = CONCAT(
'SELECT emp_id,sale_amount,sale_date,', 
	'RANK() OVER (PARTITION BY emp_id ORDER by sale_amount DESC) as sale_rank ',
'FROM sales ',
'WHERE date_format(sale_date,"%Y-%m") = ?'
);

PREPARE stmt FROM @sql;
EXECUTE stmt USING @year_month;
DEALLOCATE PREPARE stmt;

SET @condition = "date_format(sale_date,'%Y-%m') = '2023-05'";
SET @sql = CONCAT('SELECT emp_id,sale_amount,sale_date, 
	RANK() OVER (PARTITION BY emp_id ORDER by sale_amount DESC) as sale_rank
FROM sales WHERE ',@condition) ;
PREPARE stmt FROM @sql ;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

```