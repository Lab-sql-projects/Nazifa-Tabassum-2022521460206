CREATE DATABASE university_db;
USE university_db;


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
    (3, 'Chen', 'Li', 'chenli@gmail.com', '2001-11-02');


INSERT INTO courses (course_id, course_name, credits)
VALUES 
    (101, 'Database Management', 3),
    (102, 'Data Structures', 4),
    (103, 'Operating Systems', 3);

INSERT INTO professors (professor_id, first_name, last_name, email)
VALUES 
    (1, 'Dr. Huang', 'Xiu', 'huangxiu@scu.edu.cn'),
    (2, 'Dr. Zhao', 'Jun', 'zhaojun@scu.edu.cn'),
    (3, 'Dr. Linda', 'Lee', 'lindalee@scu.edu.cn');


INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES 
    (1, 1, 101),
    (2, 2, 102),
    (3, 3, 103);