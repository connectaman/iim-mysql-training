# Stored Procedure

Stored procedures are a set of SQL statements that can be stored in the database and executed repeatedly. They are useful for encapsulating complex business logic, improving performace.

```sql
CREATE DATABASE IF NOT EXISTS dynamicsql;
USE dynamicsql; 
```

```sql
DELIMITER $$

CREATE PROCEDURE GetAllSales()
BEGIN
    SELECT * FROM sales;
END$$

DELIMITER ;


-- To call or execute the Stored Procedure
CALL GetAllSales();

DELIMITER $$

CREATE PROCEDURE GetSalesAmount(
IN emp_id INT,
OUT total_sales FLOAT
)
BEGIN
        SELECT SUM(sale_amount) INTO total_sales from sales WHERE emp_id = emp_id;
END$$

DELIMITER ;

CALL GetSalesAmount(1,@total);
SELECT @total;


```