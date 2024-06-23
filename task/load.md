### ETL 

1. employees.csv 
2. Create a Table to store the extracted data (raw table)
```sql
	LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.4\\Uploads\\employee.csv'
    INTO TABLE raw_employees
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS
    (id, name, age, salary);
```
3. Transformations:
	- Calculate the average age (Ignoring NULL values)
	- Update the missing ages with the average value
	- Update the missing salaries with an arbitrary value 

4. Create a transformed table with the data
5. Load the transformed data into final target table
6. Create a Stored Procedure called 'perform_elt()' upon calling should run step 2 to step 5





