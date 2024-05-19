
# SET Operation

The SET Operation in MYSQL are bascially used to combine the result of more than 1 select statement and return the output as a single result set

1. **UNION** : It is used to combine two or more results set into single set, WITHOUT DUPLICATES
2. **UNION ALL** : It is used to combine two or more results set into single set, WITH DUPLICATES
3. **INTERSECT** : It is used to combine two results set into a single set.

```sql
CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE EmployeeUK (
EmployeeId INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Gender VARCHAR(50),
Department VARCHAR(50)
);

INSERT INTO EmployeeUK VALUES
(1,'Aman','Ulla','M','IT'),
(2,'John','Snow','M','IT'),
(3,'Harish','Gupta','M','IT'),
(4,'Sambit','Sahoo','M','IT'),
(5,'Kim','George','M','IT');

CREATE TABLE EmployeeUSA (
EmployeeId INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Gender VARCHAR(50),
Department VARCHAR(50),
);

INSERT INTO EmployeeUSA VALUES
(1,'John','Pattrick','M','IT'),
(2,'Sara','Snow','M','IT'),
(3,'Hina','Sharma','M','IT'),
(4,'Sam','George','M','IT'),
(5,'Jim','George','M','IT'),
(6,'Aman','Ulla','M','IT'),
(7,'John','Snow','M','IT');
```

UNION


```sql
SELECT FirstName, LastName, Gender FROM EmployeeUK
UNION
SELECT FirstName, LastName, Gender FROM EmployeeUSA
```

```sql
SELECT FirstName, LastName, Gender FROM EmployeeUK
UNION ALL
SELECT FirstName, LastName, Gender FROM EmployeeUSA
```

