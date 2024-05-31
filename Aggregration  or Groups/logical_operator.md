
# Logical Operator

Logical operators are used to combine multiple conditions in a Query.
The common logical operators are `AND` , `OR` , `NOT`.

```sql
Select * from table_name
WHERE condition1 AND condition2 AND ... conditionn
```

Example

```sql
CREATE DATABASE IF NOT EXISTS aggregation;

USE aggregation;

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT
);

INSERT INTO books (title, author, genre, publication_year) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('1984', 'George Orwell', 'Dystopian', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813),
('The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 1951),
('Brave New World', 'Aldous Huxley', 'Dystopian', 1932),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 1997),
('Animal Farm', 'George Orwell', 'Dystopian', 1945),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954);

Select * from books
WHERE publication_year >= 1950 AND genre = 'Fiction';

-- Retrieve books published before 1950 or belonging to the 'Dystopian' genre
Select * from books
where publication_year <= 1950 AND genre = 'Dystopian';

-- Retrieve books written by 'George Orwell' or published after 1960
select * from books
where publication_year >= 1960 OR author = 'George Orwell' ;

-- Retrieve books written after 1900 and before 1975
Select * from books
where (publication_year >=1900) and (publication_year <= 1975);

Select * from books 
WHERE publication_year between 1900 AND 1975;

-- Count how many books are there in each genre
Select genre,COUNT(*) from books
Group by genre;
```

# Having Clause

The `HAVING` clause is used to filter results returned by `GROUP BY` in aggregate function (COUNT,SUM,AVG).

```sql
-- Count how many books are there in each genre and display books with more than 1 count
Select genre,COUNT(*) as num_books from books
Group by genre
HAVING num_books > 1;
```