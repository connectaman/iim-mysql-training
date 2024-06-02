# Data Type Transformation

Data Type Transformation involve converting data from one type to another. In MYSQL this can be done using the `CAST()` and `CONVERT()`

- `CAST()` : Convert a value from one data type to another
- `CONVERT()` : Similar to `CAST()`, but also supports character set conversions.

Character Set Conversions: refers to process of changing the character set of a string or a column to another character set.

Syntax
- `CAST()` 
```sql
CAST(column AS target_data_type)
```
- `CONVERT()`
```sql
CONVERT(column,target_data_type)
```

```sql
-- Converting a string to integer
SELECT CAST('123' AS UNSIGNED);

-- Converting a string to inetger
SELECT CONVERT('123', UNSIGNED);
```

```sql
USE aggregation

CREATE TABLE products(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity VARCHAR(10),
    price VARCHAR(20),
    date_added VARCHAR(30)
);

INSERT INTO products (product_name,category,quantity,price,date_added) VALUES
('Laptop','Electronics','15','999.99','2015-01-01'),
('Mobile','Electronics','50','456.99','2020-12-05'),
('Notebook','Stationery','100','34.0','2011-11-11'),
('Pen','Stationery','45','1.5','2022-06-02'),
('Paper','Stationery','500','0.6','2023-11-01');
```

- Convert `quantity` from VARCHAR to INT
    - Using `CAST()`
        ```sql
        SELECT product_name,CAST(quantity AS UNSIGNED) AS quantity_to_int
        FROM products;
        ```
    - Using `CONVERT()`
        ```sql
        SELECT product_name,CONVERT(quantity,UNSIGNED) AS quantity_to_int
        FROM products;
        ```
- Convert `price` from VARCHAR to FLOAT
    - Using `CAST()`
        ```sql
        SELECT product_name,CAST(price AS FLOAT) AS price_to_float
        FROM products;
        ```
    - Using `CONVERT()`
        ```sql
        SELECT product_name,CONVERT(price,FLOAT) AS price_to_float
        FROM products;
        ```
- Convert `date_added` from VARCHAR to DATE
    - Using `CAST()`
        ```sql
        SELECT product_name,CAST(date_added AS DATE) AS date_added_date
        FROM products;
        ```
    - Using `CONVERT()`
        ```sql
        SELECT product_name,CONVERT(date_added,DATE) AS date_added_date
        FROM products;
        ```

- Combining all 
```sql
SELECT
product_name,
CONVERT(price,FLOAT)as price_in_float,
CONVERT(date_added,DATE) as date_in_date,
CONVERT(quantity,UNSIGNED) as quantity_in_int
FROM products;
```