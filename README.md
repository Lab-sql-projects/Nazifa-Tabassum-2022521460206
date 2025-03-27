# Nazifa-Tabassum-2022521460206
University Management (Students, Courses, Professors, Enrollments)
University Management System (Students, Courses, Professors, Enrollments)
This project is a University Management System built with SQL to manage the core data of a university. The system is designed to handle essential information related to students, courses, professors, and enrollments, which are the key entities in the database. The repository contains SQL files that define the structure, relationships, and sample data of the database.

Key Features:
Students Table: Contains student details, including personal information and email addresses, uniquely identified by student_id.

Courses Table: Stores course information, including course name and credits, each identified by a unique course_id.

Professors Table: Holds the data for professors, including their names and contact information, with a unique professor_id for each.

Enrollments Table: Manages student enrollments in courses, linking the students and courses tables using student_id and course_id. It also tracks the enrollment date.

Database Schema:
The project uses foreign keys to establish relationships between tables:

Students are enrolled in Courses via the Enrollments table.

Professors teach Courses, though the professor-student relationships are not explicitly stored in this simple model.

Sample Data: Each table has 3 rows of sample data, ensuring the database schema is tested and functional. This data represents a small-scale university system, but can be expanded as needed.

Purpose of the Project:
This project serves as a foundation for building a more complex University Management System. The system is designed to:

Store and retrieve information about students, courses, professors, and enrollments.

Provide basic database operations like inserting, updating, deleting, and querying data.

Lay the groundwork for a more advanced system that can support additional features like:

Handling different academic departments.

Managing course schedules and professor availability.

Advanced reporting and analytics for student performance and course statistics.

Future Expansion:
The current schema is simple and can be expanded to include additional features, such as:

Course Prerequisites: Implementing relationships between courses (e.g., prerequisites for advanced courses).

Student Performance: Adding tables for grades, assignments, and exams.

Department Management: Including academic departments and faculty assignments.

Schedule Management: Managing course schedules, room assignments, and time slots.

Project Structure:
The repository includes the following key files:

university_db.sql: Contains SQL code for creating the database and tables (students, courses, professors, enrollments), inserting sample data, and defining relationships between the tables.

insert.sql: SQL queries to insert data into the tables.

queries.sql: Example queries to demonstrate how to interact with the database (e.g., retrieving student information, enrolling students, etc.).

Technologies Used:
MySQL: A relational database management system used to create and manage the database.

SQL: Structured Query Language for defining and manipulating the data in the database.
