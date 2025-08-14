create database students
 use students


 CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT
)

INSERT INTO Student VALUES
(1, 'Alice', 'Math', 85),
(2, 'Bob', 'Math', 90),
(3, 'Charlie', 'Science', 78),
(4, 'David', 'Math', 92),
(5, 'Eva', 'Science', 88),
(6, 'Frank', 'History', 75),
(7, 'Grace', 'History', 95)

SELECT 
    name,
    course,
    marks,
    (SELECT AVG(marks)
     FROM Student s2                        -----------scalar subquery in select
     WHERE s2.course = s1.course) AS avg_course_marks
FROM Student s1;


SELECT name, course
FROM Student
WHERE course IN (
    SELECT DISTINCT course                 ---------subquery with where and IN
    FROM Student
    WHERE marks > 90
)


SELECT course, avg_marks
FROM (
    SELECT course, AVG(marks) AS avg_marks
    FROM Student
    GROUP BY course             ----------------subquery in from
) AS course_avg
WHERE avg_marks > 85;

SELECT s1.name, s1.course, s1.marks
FROM Student s1
WHERE NOT EXISTS (
    SELECT 1
    FROM Student s2
    WHERE s2.course = s1.course
      AND s2.marks > s1.marks                  --------corelated subquery with exist
)

SELECT name, marks
FROM Student
WHERE marks = (
    SELECT MAX(marks)
    FROM Student               ---- = using scalar subquery
)

