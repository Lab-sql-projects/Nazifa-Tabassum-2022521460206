
CREATE DATABASE lab2_queries;
USE lab2_queries;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    birth_date DATE
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    credits INT
);


CREATE TABLE professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students (student_id, first_name, last_name, email, birth_date)
VALUES 
    (1, 'Li', 'Wei', 'liwei@gmail.com', '2000-04-10'),
    (2, 'Wang', 'Fang', 'wangfang@gmail.com', '1999-08-23'),
    (3, 'Chen', 'Li', 'chenli@gmail.com', '2001-11-02'),
    (4, 'Chuan', 'Yao', 'chuanyao@gmail.com', '2000-06-15'),
    (5, 'Fei', 'Jia', 'feijia@gmail.com', '2001-02-25'),
    (6, 'Tang', 'Lizhen', 'tanglizhen@gmail.com', '2002-11-05');


INSERT INTO courses (course_id, course_name, credits)
VALUES 
    (101, 'Database Management', 3),
    (102, 'Data Structures', 4),
    (103, 'Operating Systems', 4),
    (104, 'System Level Programming', 3),
    (105, 'Computer Networks', 4),
    (106, 'Artificial Intelligence', 3);


INSERT INTO professors (professor_id, first_name, last_name, email)
VALUES 
    (1, 'Dr. Huang', 'Xiu', 'huangxiu@scu.edu.cn'),
    (2, 'Dr. Zhao', 'Jun', 'zhaojun@scu.edu.cn'),
    (3, 'Dr. Linda', 'Lee', 'lindalee@scu.edu.cn'),
    (4, 'Dr. Yuan', 'Xuedong', 'yuanxuedong@scu.edu.cn'),
    (5, 'Dr. Guo', 'Jixiang', 'guojixiang@scu.edu.cn'),
    (6, 'Dr. Shu', 'Li', 'shuli@scu.edu.cn');


INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES 
    (1, 1, 101),
    (2, 2, 102),
    (3, 3, 103),
    (4, 4, 104),
    (5, 5, 105),
    (6, 6, 106);
SHOW TABLES;
DESCRIBE students;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM professors;
SELECT * FROM enrollments;

-- this is INNER JOIN to get list of students and their enrolled courses
SELECT students.first_name, students.last_name, courses.course_name
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id;

-- this is LEFT JOIN to get all students and their enrolled courses 
SELECT students.first_name, students.last_name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.course_id;

-- this is to UPDATE  the email of Dr. Zhao Jun
UPDATE professors
SET email = 'zhaojun_1001@scu.edu.cn'
WHERE professor_id = 2;

-- DELETE this is to remove enrollment for student with student_id = 3
DELETE FROM enrollments
WHERE student_id = 3;

-- Aggregation to count the number of students enrolled per course 
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_name
HAVING COUNT(enrollments.student_id) > 1;

-- Subquery to get students who are NOT enrolled in any course
SELECT first_name, last_name
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM enrollments
);
SHOW TABLES;
DESCRIBE students;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM professors;
SELECT * FROM enrollments;


