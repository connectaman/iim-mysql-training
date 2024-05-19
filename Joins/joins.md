
## Example

1. Create a new Database Schema named "joins"
```sql
CREATE DATABASE IF NOT EXISTS joins;
```
```sql
use joins;
```

2. Students
    - student_id (Primary Key)
    - student_name
    - student_email
    - department_id  (FK)
3. Courses
    - course_id (Primary Key)
    - course_name 
    - instructor_id  (FK)
    - department_id  (FK)
4. Instructors
    - instructor_id (Primary Key)
    - instructor_name
    - department_id (FK)
5. Departments
    - department_id (Primary Key)
    - department_name
6. Enrollments
    - enrollment_id (Primary Key)
    - student_id (FK)
    - course_id (FK)
    - enrollment_date

```sql
CREATE TABLE Departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50) UNIQUE
);
```

```sql
CREATE TABLE Instructors (
instructor_id INT PRIMARY KEY,
instructor_name VARCHAR(100),
department_id INT,
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
```

```sql
CREATE TABLE Students (
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
student_email VARCHAR(100) UNIQUE,
department_id INT,
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
```

```sql
CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
instructor_id INT,
department_id INT,
FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
```

```sql
CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```

```sql
INSERT INTO Departments (department_id,department_name) VALUES
(1,'Computer Science'),
(2,'Mathematics'),
(3,'Physics'),
(4,'Biology'),
(5,'Chemistry'),
(6,'History'),
(7,'Literature'),
(8,'Psychology'),
(9,'Sociology'),
(10,'Economics');

INSERT INTO Instructors (instructor_id,instructor_name,department_id) VALUES
(1,'John Deo',1),
(2,'Jane Smith',2),
(3,'David Johnson',3),
(4,'Emily Wilson',4),
(5,'Michael Lee',5),
(6,'Sarah Johnson',6),
(7,'Matthew Wilson',7),
(8,'Laura Martinez',8),
(9,'Daniel Thompson',9),
(10,'Jennifer Garcia',10);

INSERT INTO Students (student_id, student_name, student_email, department_id) VALUES
(1,'Alice Johnson','alica@example.com',1),
(2,'Bob Smith','bob@example.com',2),
(3,'Charlie Brown','charlie@example.com',3),
(4,'Emma Davis','emma@example.com',4),
(5,'James Brown','james@example.com',5),
(6,'Oliva Clark','oliva@example.com',6),
(7,'William Rodriguez','william@example.com',7),
(8,'Sophia Martinez','sophia@example.com',8),
(9,'Liam Gonzalez','liam@example.com',9),
(10,'Amelia Hernandez','amelia@example.com',10);

INSERT INTO Courses (course_id,course_name,instructor_id,department_id) VALUES
(101,'Introduction to Programming',1,1),
(102,'Calculus I',2,2),
(103,'Mechanics',3,3),
(104,'Genetics',4,4),
(105,'Organic Chemistry',5,5),
(106,'World History',6,6),
(107,'American Literature',7,7),
(108,'Introduction to Psychology',8,8),
(109,'Introduction to Sociology',9,9),
(110,'Micro-Economics',10,10);

INSERT INTO Enrollments (enrollment_id,student_id,course_id,enrollment_date) VALUES
(1,1,101,'2024-01-10'),
(2,2,102,'2024-01-15'),
(3,3,103,'2024-01-20'),
(4,4,104,'2024-02-10'),
(5,5,105,'2024-02-15'),
(6,6,106,'2024-03-10'),
(7,7,107,'2024-03-15'),
(8,8,108,'2024-03-20'),
(9,9,109,'2024-03-25'),
(10,10,110,'2024-03-30');

```


## Joins

![Joins](https://phoenixnap.com/kb/wp-content/uploads/2021/04/join-types.png)

1. **INNER JOIN**:
-   An INNER JOIN returns rows when there is atleast one match in both tables
- It filters out rows where there is no match between tables
- The result set includes only the rows where the join condition is met.

```sql
-- Get Student Name and Enrollment date
SELECT *
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id;

SELECT Students.student_name , Enrollments.enrollment_date
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id;

-- Student Name, Course Name and Enrollment Date
SELECT Students.student_name , Enrollments.enrollment_date, Courses.course_name
FROM Students
INNER JOIN Enrollments ON Students.student_id = Enrollments.student_id
INNER JOIN Courses ON Enrollments.course_id = Courses.course_id;

```