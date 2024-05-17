# DML

DML stands for Data Manipulation Language, and its comprises of SQL commands used for managing data within a database.

1. **Select** : Retrieves data from one or more tables
2. **Insert** : Add new rows of data into a table
3. **Update** : Mofify exisiting data within a table
4. **Delete** : Removes rows of data from a table


## Select 

It is to retrieve data from table, the data can be simply retrieved based on:
- no condition
- conditions / filters
- orders

1. Retrieving Table
Syntax
```sql
SELECT * FROM table_name;
```
Example
```sql
Select * from books;
```

2. Get data based on condition
Syntax
```sql
Select * from table_name
WHERE condition;
```
Example
```sql
Select * from books
where Price > 500;
```

3. 


## Insert

Insert the records / rows in two ways
- basic insert
- inserting multiple rows

Syntax for basic insert
```sql
INSERT INTO table_name(col1,col2,..coln) VALUES(val1,val2,..valn);
```

Syntax for multiple rows insert
```sql
INSERT INTO table_name(col1,col2,..coln) VALUES (val1,val2,..valn), (val1,val2,..valn), (val1,val2,..valn), (val1,val2,..valn);
```

Example
```sql
INSERT INTO books(BookID,Title,Author,Price) VALUES (1,"ABC","Aman",100);
```

```sql
INSERT INTO books(BookID,Title,Author,Price) VALUES (2,"DEF","Aman",56),(3,"PQR","Kim",1209),(4,"XYZ","John",99);
```

## TASK
Insert data into books, customers, orders table

1. Insert into books

```sql
INSERT INTO books(BookID,Title,Author,Price) VALUES
(1,"Fundamentals of Wavelets","Goswami, Jaideva",99),
(2,"Birth of a Theorem","Villani, Cedric",156),
(3,"Data Mining Handbook","Nisbet, Robert",452),
(4,"Python for Data Analysis","McKinney, Wes",566),
(5,"Outsider","Camus, Albert",567);
```

```sql
INSERT INTO books(BookID,Title,Author) VALUES
(6,"Introduction to Algorithms","Cormen, Thomas");
```

## Update

This is used to update columns based on condition

Syntax
```sql
UPDATE table_name
SET col1=val1, col2=val2 ,... coln=valn
WHERE condition;
```
Example
```sql
UPDATE books
SET Price=199,Author='Aman Ulla'
WHERE BookID=1;
```

## DELETE

Is used to delete rows from a table based on condition

Syntax
```sql
DELETE FROM table_name WHERE condition;
```
Example
```sql
DELETE FROM books where BookID=5;
```






### To Try : 
Create table and insert records and then modify it to auto increment and see how it increament values: 

ALTER TABLE table_name MODIFY id INT AUTO_INCREMENT;