# Triggers

A trigger is set of instructions that are automatically executed or fired when a specified event occurs.

### Types of Triggers
1. **BEFORE INSERT** : Executes before a new row is added
2. **AFTER INSERT** : Executes after a new row is inserted
3. **BEFORE UPDATE** : Executes before an existing row is updated
4. **AFTER UPDATE** : Executes after an existing row is updated
5. **BEFORE DELETE** : Executes before a row is deleted
6. **AFTER DELETE** : Executes after a row is deleted 

Syntax for create triggers

```sql
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name FOR EACH ROW
BEGIN
  -- what to do
END
```


```sql
CREATE DATABASE IF NOT EXISTS triggers;
USE triggers;


CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    salary FLOAT
);

CREATE TABLE employee_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_performed VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_salary FLOAT,
    new_salary FLOAT
);

-- Maintain an audit trail whenever a row in the employees table is updated

DELIMITER $$
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id,action_performed,old_salary,new_salary) VALUES 
    (OLD.emp_id,'UPDATE',OLD.salary,NEW.salary);
END$$
DELIMITER ;


```
