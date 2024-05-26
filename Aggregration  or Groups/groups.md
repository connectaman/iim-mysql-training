
# Aggregation / Groups

Aggregation functions are used to perform calculations on a set of values (subset) and return a single value. These Functions are often used in conjunctioon with the `GROUP BY` clause to group by rows that have sample.

Some common Aggregation functions are MYSQL `SUM()` , `AVG()` , `COUNT()`, `MIN()` , `MAX()`


```sql
CREATE DATABASE IF NOT EXISTS aggregation;

USE aggregation;

-- Create the Sales Table
CREATE TABLE Sales (
    product_id INT,
    product_name VARCHAR(50),
    sales_amount FLOAT
);

-- Insert some data
INSERT INTO Sales (product_id,product_name,sales_amount) VALUES
(1,'Laptop',110.50),
(2,'IPhone',45.34),
(1,'Laptop',34.56),
(3,'Keyboard',56.34),
(2,'IPhone',67.45);
```

1. Calcuate total Sales amount for each product
```sql
SELECT product_id,product_name,SUM(sales_amount) AS total_sales FROM Sales
GROUP BY product_id, product_name;
```

2. Calculate total sales amount and average sales amount for each product
```sql
SELECT product_id,product_name,SUM(sales_amount) AS total_sales, AVG(sales_amount) as average_sales FROM Sales
GROUP BY product_id, product_name;
```

3. Get the Max Price of the Product Sales
```sql
SELECT product_id,product_name,MAX(sales_amount) AS max_sales FROM Sales
GROUP BY product_id, product_name;
```

