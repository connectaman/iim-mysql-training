CREATE table students(
sid INT PRIMARY KEY,
fullname VARCHAR(50)
);

Select * from students;

INSERT INTO students(sid,fullname) VALUES 
(1,'Aman'),
(4,'John'),
(5,'Kim'),
(2,'Sham'),
(3,'Gupta');

ALTER TABLE students MODIFY sid INT AUTO_INCREMENT;

INSERT INTO students(fullname) VALUES 
('BAman'),
('CAohn'),
('ADim'),
('AEham'),
('AFupta');

INSERT INTO students(sid,fullname) VALUES 
(11,'Jman'),
(41,'Fohn'),
(51,'Iim'),
(21,'Wham'),
(31,'Pupta');
