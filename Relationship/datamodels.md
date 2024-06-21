# One-to-Many Data Models

A one-to-many relationship occurs when a single record in one table can be associated with one or more records in another table.

#### Example

```sql
CREATE DATABASE IF NOT EXISTS datamodels;
USE datamodels;

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

# Many-to-Many Data Models

A many-to-many relationship occurs when multiple records in one table can be associated with multiple records in another table.

#### Example

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (student_name) VALUES 
('Alice'),('Bob'),('Charlie');

INSERT INTO courses (course_name) VALUES
('Math'),('History'),('Physics');

INSERT INTO enrollments (student_id,course_id) VALUES
(1,1),(1,2),  -- Alice enrolls in Math and History
(2,1),(2,2),(2,3), -- Bob enrolls in Math, History, Physics
(3,2); -- Charlie enrolls in History
```