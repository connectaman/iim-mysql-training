# Categorical Encoding

1. **One Hot Encoding** : Motive is to convert the categorical / groups of values into integer value, and each value having its own column
2. **One Hot Encoding (Top Categories)** : Motive is to convert Top n category  categorical / groups of values into integer value, and each value having its own column
3. **Label Encoding** : Map the categorical / group data into numeric value in a single column.
4. **Count Frequency Encoding** : Map the categorical / group data with the frequency of values
5. **Ordered Ordinal Encoding** : Sort the data in ascending / descending order and then perform label encoding



```sql
USE imputation;
```

```sql
CREATE TABLE product_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    sales INT
);

INSERT INTO product_sales(product_name,category,sales) VALUES
('Product_A','Electronics',100),
('Product_B','Clothing',150),
('Product_C','Electronics',200),
('Product_D','Furniture',120),
('Product_E','Furniture',80),
('Product_F','Clothing',140);

```