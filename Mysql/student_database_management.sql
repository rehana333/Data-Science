use student_database_management;
-- table to store student details such as student ID, name, date of birth, address, and contact information
CREATE TABLE students (
student_id INT PRIMARY KEY, name VARCHAR(50), date_of_birth DATE, address VARCHAR(100),
contact_number VARCHAR(15)
);
-- table to store details about the courses offered, including course ID, name, description, and credits.
CREATE TABLE courses (
course_id INT PRIMARY KEY, name VARCHAR(50), description VARCHAR(200),
credits INT
);
-- table to store the relationship between students, courses, and their corresponding grades. 
CREATE TABLE grades (
student_id INT,
course_id INT,
grade FLOAT,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
-- table to track which students are enrolled in which courses and store additional information like enrollment date.
CREATE TABLE enrollments (
student_id INT,
course_id INT,
enrollment_date DATE,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
-- Entering data
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES
  (1, 'John Doe', '1995-07-15', '123 Main Street', '555-1234');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (2, 'Jane Smith', '1998-04-25', '456 Oak Avenue', '555-5678');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(3, 'Michael Johnson', '1997-11-10', '789 Pine Road', '555-9876');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(4, 'Sarah Lee', '1996-12-20', '321 Elm Drive', '555-7890');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(5, 'David Wang', '1999-03-05', '567 Maple Court', '555-4567');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(6, 'Emily Wilson', '1998-08-08', '234 Birch Lane', '555-2345');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(7, 'Daniel Kim', '1997-05-18', '876 Cedar Avenue', '555-6789');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES (8, 'Sophia Garcia', '1996-09-30', '543 Pine Street', '555-3456');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(9, 'Matthew Brown', '1999-02-12', '987 Oak Lane', '555-9012');
INSERT INTO students (student_id, name, date_of_birth, address, contact_number)
VALUES(10, 'Olivia Martinez', '1997-06-22', '345 Elm Road', '555-6780');
INSERT INTO courses (course_id, name, description, credits)
VALUES(101, 'Mathematics', 'Introduction to Calculus', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(102, 'Physics', 'Fundamentals of Mechanics', 4);
INSERT INTO courses (course_id, name, description, credits)
VALUES(103, 'Computer Science', 'Introduction to Programming', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(104, 'Chemistry', 'Basic Concepts of Chemistry', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(105, 'History', 'World History', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(106, 'English', 'Literature and Composition', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(107, 'Biology', 'Cell Biology', 4);
INSERT INTO courses (course_id, name, description, credits)
VALUES(108, 'Economics', 'Principles of Microeconomics', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(109, 'Psychology', 'Introduction to Psychology', 3);
INSERT INTO courses (course_id, name, description, credits)
VALUES(110, 'Sociology', 'Societal Behavior and Structure', 3);
INSERT INTO grades (student_id, course_id, grade)
VALUES(1, 101, 85.5);
INSERT INTO grades (student_id, course_id, grade)
VALUES(1, 102, 90.0);
INSERT INTO grades (student_id, course_id, grade)
VALUES(1, 103, 78.2);
INSERT INTO grades (student_id, course_id, grade)
VALUES(2, 101, 92.3);
INSERT INTO grades (student_id, course_id, grade)
VALUES(2, 107, 87.8);
INSERT INTO grades (student_id, course_id, grade)
VALUES(2, 108, 79.1);
INSERT INTO grades (student_id, course_id, grade)
VALUES(3, 102, 88.9);
INSERT INTO grades (student_id, course_id, grade)
VALUES(3, 104, 91.5);
INSERT INTO grades (student_id, course_id, grade)
VALUES(3, 110, 85.0);
INSERT INTO grades (student_id, course_id, grade)
VALUES(4, 105, 75.6);
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(1, 101, '2023-01-01');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(1, 102, '2023-01-01');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(2, 101, '2023-01-02');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(2, 107, '2023-01-02');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(3, 102, '2023-01-03');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(3, 104, '2023-01-03');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(4, 105, '2023-01-04');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(4, 108, '2023-01-04');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(5, 106, '2023-01-05');
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES(5, 109, '2023-01-05');
-- retrieving data
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM grades;
SELECT * FROM enrollments;
SELECT * FROM students WHERE student_id = 1;
SELECT * FROM courses WHERE course_id = 101;
-- Retrieve enrolled courses for a student
SELECT courses.* FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id
WHERE enrollments.student_id = 1;
-- Calculate average grade for a student:
SELECT AVG(grade) FROM grades WHERE student_id = 1;
-- Display top-performing students:
SELECT students.*, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.student_id = grades.student_id
GROUP BY students.student_id
ORDER BY average_grade DESC
LIMIT 10;
