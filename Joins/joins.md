## Joins

![Joins](https://phoenixnap.com/kb/wp-content/uploads/2021/04/join-types.png)

1. INNER JOIN:
-   An INNER JOIN returns rows when there is atleast one match in both tables
- It filters out rows where there is no match between tables
- The result set includes only the rows where the join condition is met.




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
FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
```

```sql
CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```