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

```sql
-- arbitrary value
CREATE TABLE employee_data (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary FLOAT
);

INSERT INTO employee_data (id,name,age,salary) VALUES
(1,'Alice',30,70000),
(2,'Bob',NULL,80000),
(3,'Charlie',25,NULL),
(4,'David',NULL,NULL),
(5,'Evan',28,65000);

-- Arbitrary Value
UPDATE employee_data
SET age = 199
WHERE age IS NULL;

UPDATE employee_data
SET salary = 999999
WHERE salary IS NULL;
```

```sql
CREATE TABLE house_data (
 id INT PRIMARY KEY,
 address VARCHAR(50),
 area_sqft FLOAT,
 price FLOAT
);

INSERT INTO house_data(id,address,area_sqft,price) VALUES
(1,'123 Main Road',2000.0, 300000),
(2,'456 Main Road',NULL, 250000),
(3,'789 Main Road',1500.0, NULL),
(4,'112 Main Road',NULL, NULL),
(5,'145 Main Road',2000.0, 280000);

-- End Tail
SET @max_area = (SELECT MAX(area_sqft) FROM house_data WHERE area_sqft IS NOT NULL) * 3;

UPDATE house_data
SET area_sqft = @max_area
WHERE area_sqft IS NULL;
```

```sql
-- frequent category 
CREATE TABLE customer_data (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO customer_data (id,name,country) VALUES
(1,'Aman','India'),
(2,'George','USA'),
(3,'Juli','Canada'),
(4,'Kim','USA'),
(5,'John',NULL),
(6,'Lily',NULL);

-- Write query to get mode (Most frequent Value) replace it with missing value

SET @most_freq_country = (Select country from customer_data group by country order by count(country) desc limit 1);

UPDATE customer_data
SET country = @most_freq_country
WHERE country IS NULL;
```

```sql
-- Missing Imputation
CREATE TABLE product_data (
 id INT PRIMARY KEY,
 product_name VARCHAR(50),
 category VARCHAR(50)
);

INSERT INTO product_data (id,product_name, category) VALUES
(1,'Laptop','Electronics'),
(2,'Table',NULL),
(3,'Chair','Furniture'),
(4,'Headphones',NULL),
(5,'Pen','Office');

-- Imputing Category with 'Missing'

```