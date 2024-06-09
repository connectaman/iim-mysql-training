# Pivoting Data

Pivoting data in MySQl involes transforming rows into columns to make the data more readable or suitable for reporting / insights.


`sales`

| id | product | month | sales | 
| --- | ---- | ---- | ---- |
| 1 | Product1 | January | 100 |
| 2 | Product1 | February | 150 | 
| 3 | Product2 | January | 200 |
| 4 | Product2 | February | 250 | 
| 5 | Product3 | February | 300 |
| 6 | Product3 | March | 350 | 


| product | January | February | March | 
| ---- | ---- | ---- | ----|
| Product1 | 100 | 150 | .. | .. |

```sql

CREATE TABLE sales_2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product varchar(50),
  sales_month varchar(50),
  sales Float
);

INSERT INTO sales_2(product,sales_month,sales) VALUES
('product1', 'January', 100),
('product1', 'February', 150),
('product2', 'January', 200),
('product2', 'February', 250),
('product3', 'February', 350),
('product3', 'March', 350);


-- using CASE Statement
Select product,
    SUM(CASE WHEN sales_month = 'January' THEN sales ELSE 0 END) as January,
    SUM(CASE WHEN sales_month = 'February' THEN sales ELSE 0 END) as February,
    SUM(CASE WHEN sales_month = 'March' THEN sales ELSE 0 END) as March
FROM sales_2
GROUP BY product;

```
