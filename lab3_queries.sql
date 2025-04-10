CREATE DATABASE  lab3_queries;
USE lab3_queries;
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
    first_name VARCHAR(100) NOT NULL,
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
    (101, 'Li', 'Wei', 'liwei@gmail.com', '2000-04-10'),
    (102, 'Wang', 'Fang', 'wangfang@gmail.com', '1999-08-23'),
    (103, 'Chen', 'Li', 'chenli@gmail.com', '2001-11-02'),
    (104, 'Chuan', 'Yao', 'chuanyao@gmail.com', '2000-06-15'),
    (105, 'Fei', 'Jia', 'feijia@gmail.com', '2001-02-25'),
    (106, 'Tang', 'Lizhen', 'tanglizhen@gmail.com', '2002-11-05'),
    (107, 'Qing', 'Ma', 'qingma@gmail.com', '2001-03-26'),
    (108, 'Cheng', 'Yao', 'chengyao@gmail.com', '2000-06-08'),
    (109, 'Debao', 'Li', 'debaoli@gmail.com', '2001-02-27'),
    (110, 'Huang', 'Fang', 'huangfang@gmail.com', '2002-11-10');

INSERT INTO courses (course_id, course_name, credits)
VALUES 
    (111, 'Database Management', 3),
    (112, 'Data Structures', 4),
    (113, 'Operating Systems', 4),
    (114, 'System Level Programming', 3),
    (115, 'Computer Networks', 4),
    (116, 'Artificial Intelligence', 3),
    (117, 'Computer Architecture', 4),
    (118, 'Image Processing', 3),
    (119, 'Object Oriented Programing', 4),
    (120, 'Web Mining', 3);

INSERT INTO professors (professor_id, first_name, last_name, email)
VALUES 
    (1, 'Dr. Huang', 'Xiu', 'huangxiu@scu.edu.cn'),
    (2, 'Dr. Zhao', 'Jun', 'zhaojun@scu.edu.cn'),
    (3, 'Dr. Linda', 'Lee', 'lindalee@scu.edu.cn'),
    (4, 'Dr. Yuan', 'Xuedong', 'yuanxuedong@scu.edu.cn'),
    (5, 'Dr. Guo', 'Jixiang', 'guojixiang@scu.edu.cn'),
    (6, 'Dr. Shu', 'Li', 'shuli@scu.edu.cn'),
    (7, 'Dr. Hao', 'Yin', 'haoyin@scu.edu.cn'),
    (8, 'Dr. Zhang', 'Li', 'zhangli@scu.edu.cn'),
    (9, 'Dr. Hui', 'Fang', 'huifang@scu.edu.cn'),
    (10, 'Dr. Chen', 'Li', 'chenli@scu.edu.cn');

INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES 
    (1, 101, 111),
    (2, 102, 112),
    (3, 103, 113),
    (4, 104, 114),
    (5, 105, 115),
    (6, 106, 116),
	(7, 107, 117),
    (8, 108, 118),
    (9, 109, 119),
    (10, 110,120);
    SHOW TABLES;
DESCRIBE students;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM professors;
SELECT * FROM enrollments;

-- Creating a VIEW with only basic student info and no email or birthdate
CREATE VIEW student_basic_info AS
SELECT student_id, first_name, last_name
FROM students;
SELECT * FROM student_basic_info;

-- this is  CHECK constraint to ensure course credits are positive
ALTER TABLE courses
ADD CONSTRAINT chk_credits_positive CHECK (credits > 0);

-- this is to create an index on last_name for faster search performance
CREATE INDEX idx_students_lastname ON students(last_name);

-- this is to  transaction with ROLLBACK
START TRANSACTION;

-- insearting  a new student temporarily
INSERT INTO students (student_id, first_name, last_name, email, birth_date)
VALUES (201, 'Irish', 'Li', 'irishli@gmail.com', '2002-01-01');

SELECT * FROM students;

-- this is to update the last name of the new inserted student
UPDATE students
SET last_name = 'Shi'
WHERE student_id = 201;
SELECT * FROM students;
SELECT * FROM students WHERE student_id = 201;

-- rollback to undo all changes made in the transaction
ROLLBACK;

-- this is to verify rollback worked or not
SELECT * FROM students WHERE student_id = 201;

-- this is to show students enrolled in courses with credits above the average using JOIN and subquery
SELECT s.first_name, s.last_name, c.course_name, c.credits
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.credits > (
    SELECT AVG(credits) FROM courses
);

-- this is to create a role and grant permission to view student_basic_info
CREATE ROLE viewer_role;
GRANT SELECT ON student_basic_info TO viewer_role;
SELECT user, host FROM mysql.user WHERE user = 'viewer_role';




