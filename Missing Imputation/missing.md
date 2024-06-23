# Missing Imputation

1. CCA (Complete Case Analysis) : Remove rows / records where there is a missing value
2. Mean / Median : Replace missing value with mean / meadian of the entire column / attribute
3. Arbitrary Value : Impute or replace the missing value with an arbitrary value (extreme higher / lower value)
4. End-Tail : Impute or replace the missing value with +- 3 times the max value
5. Frequency Cateogry : Replace or Impute missing value with frequent value (Mode)
6. Missing Category : Replace or Impute missing value with a value / tag "Missing"
7. Random Sampler : Randomly select a value and impute it in missing value


```sql
CREATE DATABASE IF NOT EXISTS imputation;
USE imputation;
```

```sql
-- mean-median imputation
CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    price FLOAT,
    quantity INT,
    total FLOAT
);

INSERT INTO sales_data (id,product,price,quantity,total) VALUES
(1,'Product A',10.00,2,20.00),
(2,'Product B',NULL,1,NULL),
(3,'Product C',15.00,NULL,30.00),
(4,'Product D',NULL,3,NULL),
(5,'Product E',20.00,1,20.00);

SET @mean_price = (SELECT AVG(price) from sales_data WHERE price IS NOT NULL);

-- Imputing
UPDATE sales_data
SET price = @mean_price
WHERE price IS NULL;
```