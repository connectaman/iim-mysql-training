
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

-- Retrieve authors who have written more than 1 books in the database
select author, count(*) as total_books from books
group by author
having total_books > 1;

-- Retrieve genres with an average publication year greater than 1950
select genre, avg(publication_year) as avg_year from books
group by genre
having avg_year > 1950 ;

-- Retrieve authors who have written books published both before and after 1950
SELECT AUTHOR,MIN(PUBLICATION_YEAR) MIN_YEAR,MAX(PUBLICATION_YEAR) MAX_YEAR FROM BOOKS
GROUP BY AUTHOR
HAVING MIN_YEAR<1950 AND MAX_YEAR>1950;

Select author
from books
Group by author
HAVING MIN(publication_year) < 1950 AND MAX(publication_year) > 1950;
```

# Sorting

Sorting allows arrage results in specific order using `ORDER BY` clause.

```sql
Select * from books
ORDER BY publication_year DESC;

Select * from books
ORDER BY publication_year ASC;

-- Retrieve books sorted by title in ascending order

-- Retrieve books sorted by their authors names in descending order

-- Retrieve books sorted by first genre in asecnding order and then publication year in descending order
Select * from books
ORDER BY genre ASC, publication_year DESC;

-- Retrieve authors sorted by the number of books they have written in descending order
```

# Sub queries

Subqueries are queries nested within another query.
They can be used in `SELECT`,`FROM`, 'WHERE' , or other clauses

```sql
Select title,author from books
WHERE author IN (Select author from books where author LIKE 'J%');

-- Retrieve books publised by authors who have also written books in 'Fantasy' genre.
SELECT * from books
WHERE author in (Select author from books where genre='Fantasy');

-- Retrieve the titles of books with a publication year earlier than the average of publication year of all the books
Select title from books
WHERE publication_year < (Select AVG(publication_year) FROM books);
```
