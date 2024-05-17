
Select * from books
where Price > 500;

Select * from books
where Price < 500;

Select * from books
where Author='Aman Ulla';

-- In 
Select * from books
where Author IN ('Aman Ulla','Villani, Cedric');

-- Select specific columns
Select Title,Author from books
WHERE Price < 500;

-- Between keyword
Select * from books
WHERE Price BETWEEN 100 AND 450;

Select * from orders;

Select * from orders
Where OrderDate > '2024-04-01';

Select * from orders
Where OrderDate < '2024-04-01';

-- get me all orders from jan to april 2024
SELECT * from orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-04-30';

select * from orders
where OrderDate >= '2024-01-03' and OrderDate <= '2024-01-04';


Select * from books;

-- LIKE  : search based on pattern
Select * from books
Where Title LIKE '%data%';

-- Get all records where Price is Null
Select * from books
Where Price IS NULL;

Select * from books
Where Price IS NOT NULL;

-- Give alias name to columns
Select Title,Author from books;
Select Title as BookName, Author as Person from books;