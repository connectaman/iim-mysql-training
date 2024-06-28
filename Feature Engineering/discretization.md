# Discretization

Convert values (numerical, date time) into category columns.

```sql
USE imputation;
```

```sql
CREATE TABLE sales_product (
 id INT AUTO_INCREMENT PRIMARY KEY,
 customer_name VARCHAR(50),
 purchase_amount FLOAT,
 purchase_date DATE
);

INSERT INTO sales_product (customer_name,purchase_amount,purchase_date) VALUES
('Alice',120.50,'2023-01-15'),
('Bob',250.00,'2023-02-20'),
('Charlie',180.75,'2023-01-10'),
('Dinia',90.00,'2023-03-05'),
('Eve',300.25,'2023-02-14'),
('Frank',110.00,'2023-03-20');
```


```sql
-- Numeric Bining
SELECT id,customer_name,purchase_amount,purchase_date,
CASE
WHEN purchase_amount < 100 THEN 'LOW'
WHEN purchase_amount BETWEEN 100 AND 200 THEN 'MEDIUM'
ELSE 'HIGH'
END AS puchase_amount_bin
FROM sales_product;
```

```sql
-- Date Discretization
-- month

SELECT id, customer_name,purchase_amount,purchase_date,
DATE_FORMAT(purchase_date,'%Y-%m') AS purchase_month
FROM sales_product;

-- year
SELECT id, customer_name,purchase_amount,purchase_date,
YEAR(purchase_date) AS purchase_year
FROM sales_product;
```