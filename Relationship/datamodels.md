# One-to-Many Data Models

A one-to-many relationship occurs when a single record in one table can be associated with one or more records in another table.

#### Example

```sql
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (author_name) VALUES 
('J.K Rowling'),('George RR Martin');

INSERT INTO books (title,author_id) VALUES
('Harry Potter and the Sorcerer Stone',1),
('Harry Potter and Chamber of Secrets',1),
('Game of Thrones',2),
('Clash of Kings',2);
```