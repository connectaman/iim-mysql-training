
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
```
