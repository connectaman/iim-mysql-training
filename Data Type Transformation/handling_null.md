# Handling NULLS and Data Inconsistencies

Using `NOT NULL` while creating a table ensure that the columsn cannot contain a `NULL` value.

```sql
CREATE DATABASE IF NOT EXISTS handlingnulls;

use handlingnulls;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary FLOAT NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees(name,age,department,salary,hire_date) 
VALUES
('Aman',40,'IT',34342.34,'2024-01-01');

-- Raise error because age cannot be null
INSERT INTO employees(name,age,department,salary,hire_date) 
VALUES
('Kim',NULL,'IT',34342.34,'2024-01-01');

```

Handling NULLs in table

```sql
CREATE TABLE employees_allow_null (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary FLOAT,
    hire_date DATE
);

INSERT INTO employees_allow_null (name,age,department,salary,hire_date) VALUES
('Alice',30,'HR',60000,'2023-01-01'),
('Bob',NULL,'IT',NULL,'2019-11-23'),
('Charlie',28,'Finance',55000,'2018-01-01'),
('David',35,NULL,70000,'2022-06-02'),
('Eve',45,'HR',85000,NULL),
('Frank',40,'Finance',90000,'2016-10-10');
```

- To find out the NULL value
```sql
SELECT * from employees_allow_null
WHERE age IS NULL;
```

- To find records without NULL value
```sql
SELECT * from employees_allow_null
WHERE department IS NOT NULL;
```

- `IFNULL()` takes two arguments and returns the first one if NOT NULL, else the second value
```sql
SELECT name, IFNULL(department,'NO DEPARTMENT') AS department FROM employees_allow_null;
```

- `COALESCE()` : returns the FIRST NON-NULL value from the list of expressions.
```sql
SELECT name, COALESCE(age,'Unknown') AS age from employees_allow_null;
```

- Using Default Values
```sql
ALTER TABLE employees_allow_null MODIFY salary FLOAT DEFAULT 50000.00;
```

- Adding Constraint
```sql
ALTER TABLE employees_allow_null ADD constraint check_age CHECK (age >= 0);

INSERT INTO employees_allow_null (name,age,department,hire_date) VALUES
('Imran',-34,'IT','2023-01-01');
```
