
### Bad Practice

Student
 - studentid
 - studentname
 - subjectname

|studentid | studentname | subjectname | 
| --- | --- | ---|
| 1 | Aman | Math | 
| 1 | Aman | Chem | 
| 1 | Aman | IT |
| 2 | John | Phy | 
|2 | John | Chem | 
| 2 | John | IT |


### Good Practice

Student
- studentid
- studentname
- enrollment

Subjects
 - subjectid
 - subjectname

Enrollments
 - enrollmentid
 - studenid
 - subjectid



Student
| studentid | studentname | enrollmentid|
| ---- | ---- | ---- |
| 1 | Aman | 101 |
| 2 | John | 102 |


Subjects
| subjectid | subjectname|
| ----  | ---- | 
| 1 | math | 
| 2 | IT | 
| 3 | chem | 


Enrollments
| enrollmentid | studentid | subjectid | 
| --- | --- | ---|
| 101 | 1 | 1 | 
| 101 | 1 | 2 | 
| 101 | 1 | 3 | 


# Normalization 

Normalization is the process of organizing data in the database efficiently.

```sql
CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;
```

## First Normal Form (1NF)

A relation is in 1NF if and only if it contains only atomic values, meaning no repeating groups or arrays are allowed.

- Before Applying 1NF
```sql
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Skills VARCHAR(100)  -- Skills has comma seperated values
);

INSERT INTO Employees(EmployeeID,EmployeeName,Skills) VALUES
(1,"Aman Ulla","Java,Python,SQL"),
(2,"John Smith","C++,SQL");
```
- After Applying 1NF
```sql
CREATE TABLE EmployeeSkills(
    EmployeeID INT,
    Skill VARCHAR(50)
);

INSERT INTO EmployeeSkills(EmployeeID,Skill) VALUES
(1,'Java'),
(1,'SQL'),
(1,'Python'),
(2,'C++'),
(2,'SQL');
```

## Second Normal Form (2NF)

A relation is in 2NF is it is in 1NF and all attributes are fully functionally dependent on the primary key

## Third Normal Form (3NF):

A relation is in 3NF if it is in 2NF and all non-key attributes are non-transitively dependent of the primary key
