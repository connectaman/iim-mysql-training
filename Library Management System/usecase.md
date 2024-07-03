# Library Management System

```mermaid
erDiagram
    Books {
        INT book_id PK
        VARCHAR title
        VARCHAR author
        VARCHAR genre
        INT publised_year
        INT available_copies
    }

    Members {
        INT member_id PK
        VARCHAR name
        VARCHAR email
        DATE membership_date
    }

    Borrowed_Books {
        INT borrow_id PK
        INT book_id FK
        INT member_id FK
        DATE borrow_date
        DATE return_date
    }
    
    Borrowed_Books ||--o{ Books : has
    Borrowed_Books ||--o{ Members : borrows
```

```sql
CREATE DATABASE IF NOT EXISTS library;
use library;

-- Creating Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    published_year INT,
    available_copies INT
);

-- Inserting Sample Records into Books Table
INSERT INTO Books VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 4),
(4, 'Moby Dick', 'Herman Melville', 'Adventure', 1851, 2),
(5, 'War and Peace', 'Leo Tolstoy', 'Historical', 1869, 6),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 2),
(7, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 3),
(8, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 5),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 4),
(10, 'The Odyssey', 'Homer', 'Epic', -700, 1);

-- Creating Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    membership_date DATE
);

-- Inserting Sample Records into Members Table
INSERT INTO Members VALUES
(1, 'John Doe', 'john.doe@example.com', '2022-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', '2022-02-20'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '2023-03-18'),
(4, 'Bob Brown', 'bob.brown@example.com', '2023-04-25'),
(5, 'Charlie Davis', 'charlie.davis@example.com', '2022-05-10'),
(6, 'Diana Miller', 'diana.miller@example.com', '2022-06-30'),
(7, 'Edward Wilson', 'edward.wilson@example.com', '2023-07-12'),
(8, 'Fiona Clark', 'fiona.clark@example.com', '2023-08-05'),
(9, 'George Harris', 'george.harris@example.com', '2023-09-22'),
(10, 'Hannah Martin', 'hannah.martin@example.com', '2023-10-01');

-- Creating Borrowed_Books Table
CREATE TABLE Borrowed_Books (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Inserting Sample Records into Borrowed_Books Table
INSERT INTO Borrowed_Books VALUES
(1, 1, 1, '2023-01-10', '2023-01-20'),
(2, 2, 2, '2023-02-15', '2023-02-25'),
(3, 3, 3, '2023-03-10', '2023-03-20'),
(4, 4, 4, '2023-04-05', '2023-04-15'),
(5, 5, 5, '2023-05-12', '2023-05-22'),
(6, 6, 6, '2023-06-15', '2023-06-25'),
(7, 7, 7, '2023-07-20', '2023-07-30'),
(8, 8, 8, '2023-08-25', '2023-09-04'),
(9, 9, 9, '2023-09-05', '2023-09-15'),
(10, 10, 10, '2023-10-10', '2023-10-20');

```

## Task

**Aggregation / Grouping**

1. How many books are available in each genre?
```sql
SELECT genre,COUNT(*) from books
group by genre;
```
2. What is the total number of books borrowed by each member?
```sql
SELECT m.member_id as Members_id,m.name COUNT(book_id) FROM members m
LEFT JOIN borrowed_books bb ON bb.member_id = m.member_id
GROUP BY m.member_id,m.name;
```
3. Find the average number of available copies per genre.
```sql
SELECT genre,AVG(available_copies) from books
group by genre;
```

**Scalar Functions**

4. Get the uppercase version of all book titles.
```sql
SELECT UPPER(title) AS Available_Books FROM books;
```
5. Find the length of each member's name.
```sql
SELECT name, LENGTH(name) AS Length_of_Name FROM members;
```
6. Extract the year from the membership_date of all members.
```sql
SELECT membership_date, 
YEAR(membership_date) AS Year_of_Joining 
FROM members;
```

**Pivot Table**

7. Create a pivot table showing the count of books borrowed by each member in each year.
```sql
SELECT mem_ID, CASE 
WHEN Year = 2023 THEN books_count END Books_issued_in_2023
FROM 
	(SELECT M.member_id mem_ID,YEAR(borrow_date) Year,COUNT(book_id) books_count FROM members M
	LEFT JOIN borrowed_books BB ON BB.member_id = M.member_id
	GROUP BY M.member_id,YEAR(borrow_date)) A;
```

**Filtering and Sorting**

8. List all books published after the year 1950.
```sql
SELECT * FROM books
WHERE YEAR(published_year)>1950;
```
9. Find all members who joined in the year 2023.
```sql
SELECT * FROM members
WHERE YEAR(membership_date)=2023;
```
10. Sort the books by their title in ascending order.
```sql
SELECT * FROM books
ORDER BY title ASC;
```
11. List all borrowed books where the return date is NULL.
```sql
SELECT * FROM borrowed_books
WHERE return_date IS NULL;
```

**Indexes**

12. Create an index on the author column in the Books table.
```sql
CREATE INDEX idx_author ON Books(author);
```
13. Create an index on the membership_date column in the Members table.
```sql
CREATE INDEX idx_membership_date ON members(membership_date);
```

**Joins**

14. Retrieve a list of all borrowed books along with the member who borrowed them.
```sql
SELECT borrow_id,book_id,BB.member_id,name,borrow_date,return_date FROM borrowed_books BB
LEFT JOIN members M ON M.member_id = BB.member_id;
```
15. Find all books that have been borrowed by 'John Doe'.
```sql
SELECT BB.member_id,name,borrow_id,book_id,borrow_date FROM borrowed_books BB
LEFT JOIN members M ON M.member_id = BB.member_id
WHERE name='John Doe';
```
16. Get the total number of books borrowed by each member along with their names.
```sql
SELECT BB.member_id,name,COUNT(book_id) FROM borrowed_books BB
LEFT JOIN members M ON M.member_id = BB.member_id
GROUP BY BB.member_id,name;
```
**Handling Null Values**

17. Find all records in the Borrowed_Books table where the return_date is NULL.
```sql
-- approach 1
select * from Borrowed_Books where return_date is null;

-- approach 2
select BB.book_id, B.title
from Borrowed_Books BB JOIN Books B ON BB.book_id = B.book_id
where BB.return_date IS NULL;
```
18. Replace NULL values in the return_date column with the current date.
```sql
UPDATE borrowed_books SET return_date = IFNULL(return_date, CURDATE())
```
**Triggers**

19. Create a trigger that updates the available_copies in the Books table when a book is borrowed.
```sql

```
20. Create a trigger that sends an email notification when a new member is added to the Members table.
```sql

```