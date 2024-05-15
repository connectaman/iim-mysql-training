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

Syntax
```sql
SELECT * FROM table_name;
```
Example
```sql
Select * from books;
```

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