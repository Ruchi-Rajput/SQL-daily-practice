-- Day 01: SQL Basics
-- Topic: CREATE TABLE, INSERT, SELECT

CREATE TABLE students (
    student_id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);


INSERT INTO students VALUES
(1, 'Amit', 21, 'Delhi'),
(2, 'Neha', 22, 'Mumbai'),
(3, 'Ravi', 20, 'Pune');

SELECT * FROM students;