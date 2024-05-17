use db1;

-- add a new column 'genre' in books table
ALTER TABLE books 
ADD COLUMN genre varchar(50);

-- modify the column 'genre' and update its datatype from varchar to int
ALTER TABLE books
MODIFY COLUMN genre INT;

-- delete a column from table
ALTER TABLE books
DROP COLUMN genre;

-- To Rename table name
RENAME TABLE books TO books2;
RENAME TABLE books2 TO books;

-- change the column name
-- ALTER TABLE table_name CHANGE old_column_name new_column_name datatype;
ALTER TABLE books
CHANGE Price Price2 INT;

ALTER TABLE books CHANGE Price2 Price INT;

use db1;

-- Insert records into books table
INSERT INTO books(BookID,Title,Author,Price) VALUES
(1,"Fundamentals of Wavelets","Goswami, Jaideva",99),
(2,"Birth of a Theorem","Villani, Cedric",156),
(3,"Data Mining Handbook","Nisbet, Robert",452),
(4,"Python for Data Analysis","McKinney, Wes",566),
(5,"Outsider","Camus, Albert",567);

-- Inserting into table with nulls
INSERT INTO books(BookID,Title,Author) VALUES
(6,"Introduction to Algorithms","Cormen, Thomas");

-- Viewing books
Select * from books;


INSERT INTO customers(CustomerID,Fullname,Email,Address) VALUES
(10001,"Mathew Miller","mathew@gmail.com","New Jersey"),
(10002,"John Dykes","John@gmail.com","New York"),
(10003,"Steven Gerrard","steven@gmail.com","New England"),
(10004,"Luis Suarez","luis@gmail.com","Merseyside"),
(10005,"Mac Allister","mac@gmail.com","London");

-- Viewing customer
Select * from customers;

INSERT INTO orders(orderID,CustomerID,OrderDate) VALUES
(101,10001,"2024-01-12"),
(102,10002,"2024-02-10"),
(103,10003,"2024-03-15"),
(104,10004,"2024-04-12"),
(105,10005,"2024-05-14");

-- Viewing orders
Select * from orders;





