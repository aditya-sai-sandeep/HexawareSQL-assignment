
-- assignment - 2 

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    date_of_birth DATE,
    email VARCHAR(30),
    phone_number CHAR(10)
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(30)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT FOREIGN KEY REFERENCES Teacher(teacher_id) ON DELETE CASCADE
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT FOREIGN KEY REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id INT FOREIGN KEY REFERENCES Courses(course_id) ON DELETE CASCADE,
    enrollment_date DATE
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES Students(student_id) ON DELETE CASCADE,
    amount DECIMAL(5, 2),
    payment_date DATE
);




INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
  ('Rajesh', 'Kumar', '2014-08-15', 'rajesh.kumar@example.com', '9876543210'),
  ('Priya', 'Sharma', '2015-03-22', 'priya.sharma@example.com', '9876543210'),
  ('Amit', 'Singh', '2016-11-10', 'amit.singh@example.com', '9876543210'),
  ('Neha', 'Patel', '2014-05-18', 'neha.patel@example.com', '9876543210'),
  ('Kunal', 'Verma', '2015-07-10', 'kunal.verma@example.com', '9876543210'),
  ('Deepika', 'Gupta', '2014-09-08', 'deepika.gupta@example.com', '9876543210'),
  ('Vikram', 'Singhania', '2015-06-30', 'vikram.singhania@example.com', '9876543210'),
  ('Ananya', 'Rajput', '2016-12-12', 'ananya.rajput@example.com', '9876543210'),
  ('Rahul', 'Mishra', '2014-04-03', 'rahul.mishra@example.com', '9876543210'),
  ('Sneha', 'Shah', '2015-01-20', 'sneha.shah@example.com', '9876543210'),
  ('Akash', 'Yadav', '2016-07-14', 'akash.yadav@example.com', '9876543210'),
  ('Pooja', 'Jha', '2014-03-28', 'pooja.jha@example.com', '9876543210');

-- select * from Students


INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
  (1, 'Amit', 'Sharma', 'amit.sharma@example.com'),
  (2, 'Priya', 'Verma', 'priya.verma@example.com'),
  (3, 'Vikram', 'Yadav', 'vikram.yadav@example.com'),
  (4, 'Neha', 'Rajput', 'neha.rajput@example.com'),
  (5, 'Rahul', 'Mishra', 'rahul.mishra@example.com'),
  (6, 'Deepika', 'Singh', 'deepika.singh@example.com'),
  (7, 'Ananya', 'Gupta', 'ananya.gupta@example.com'),
  (8, 'Kunal', 'Patel', 'kunal.patel@example.com'),
  (9, 'Sneha', 'Jha', 'sneha.jha@example.com'),
  (10, 'Riyal', 'Singhania', 'akash.singhania@example.com');

-- select * from Teacher


INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
  (1, 'Computer Science', 4, 1),
  (2, 'Programming in C', 3, 2),
  (3, 'Data Structures and Algorithms', 3, 3),
  (4, 'Computer Architecture', 4, 4),
  (5, 'JAVA', 3, 5),
  (6, 'Database Management Systems', 4, 6),
  (7, 'Node.js', 3, 7),
  (8, 'Computer Networks', 3, 8),
  (9, 'CPP', 4, 9),
  (10, 'Cloud Computing', 3, 9),
  (11, 'AI & ML', 4, 4),
  (12, 'Python Programming', 3, 5),
  (13,'Telugu',1,4);

-- select * from Courses

INSERT INTO Enrollments ( student_id, course_id, enrollment_date)
VALUES
  (1, 1, '2023-11-30'),
  (1, 6, '2023-12-01'),
  (2, 2, '2023-12-02'),
  (2, 7, '2023-12-03'),
  (3, 3, '2023-12-04'),
  (3, 8, '2023-12-05'),
  (3, 11, '2023-12-06'),
  (4, 4, '2023-12-07'),
  (5, 5, '2023-12-08'),
  (6, 9, '2023-12-09'),
  (7, 10, '2023-12-10'),
  (8, 12, '2023-12-11'),
  (9, 1, '2023-12-12'),
  (10, 3, '2023-12-13'),
  (11, 2, '2023-12-14'),
  (12, 4, '2023-12-15');
-- select * from Enrollments

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
  (1, 1, 500, '2023-11-30'),
  (2, 1, 300, '2023-12-01'),
  (3, 2, 450, '2023-12-02'),
  (4, 2, 350, '2023-12-03'),
  (5, 3, 600, '2023-12-04'),
  (7, 3, 400, '2023-12-06'),
  (8, 4, 250, '2023-12-07'),
  (9, 5, 300, '2023-12-08'),
  (10, 6, 350, '2023-12-09'),
  (11, 7, 400, '2023-12-10'),
  (12, 8, 500, '2023-12-11'),
  (13, 9, 450, '2023-12-12'),
  (14, 10, 200, '2023-12-13'),
  (15, 11, 350, '2023-12-14'),
  (16, 12, 400, '2023-12-15');

-- select * from Payments

-- 3.b
--1

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ( 'John', 'Doe', '1995-08-15', 'john.doe@example.com','1234567890');

--2
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, GETDATE());

--3
-- select * from Teacher
UPDATE Teacher
SET email = 'newemail@example.com'
WHERE teacher_id = 1;
-- select * from Teacher

--4
-- select * from Enrollments
DELETE FROM Enrollments
WHERE student_id = 11 AND course_id = 2;
-- select * from Enrollments

--5
-- select * from Courses
UPDATE Courses
SET teacher_id = 1
WHERE course_id = 2;
-- select * from Courses

--6
-- select * from Students
-- select * from Enrollments
-- select * from Payments

DECLARE @StudentId INT;
SET @StudentId=11;

DELETE FROM Students
WHERE student_id = @StudentId;
DELETE FROM Enrollments
WHERE student_id = @StudentId;

-- select * from Students
-- select * from Enrollments
-- select * from Payments

--7
-- select * from Payments
UPDATE Payments
SET amount = 750.00
WHERE payment_id = 1;
-- select * from Payments

--4
--1
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
INNER JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1
GROUP BY s.student_id, s.first_name, s.last_name;

--2
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS [enrolled students count]
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

--3
SELECT s.student_id, s.first_name, s.last_name, e.enrollment_id
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

--4
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

--5
SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
INNER JOIN Courses c ON t.teacher_id = c.teacher_id;

--6
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_id = 1;

--7
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

--8
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

--9
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;

--10
SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

--5
-- 1
SELECT c.course_id, c.course_name,count(*)
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
group by c.course_id,c.course_name
having count(c.course_id)>1;

--2 
SELECT TOP 1 s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
INNER JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
order by SUM(p.amount) desc;

-- 3
SELECT TOP 1 c.course_id, c.course_name,count(*)
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
group by c.course_id,c.course_name
order by 3 desc

-- 4
SELECT t.teacher_id ,COALESCE(SUM(p.amount),0) AS total_payments
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id=c.teacher_id
LEFT JOIN Enrollments e ON c.course_id=e.course_id
LEFT JOIN Payments p ON e.student_id=p.student_id
GROUP BY t.teacher_id
ORDER BY t.teacher_id;

--5
SELECT s.student_id,COUNT(DISTINCT e.course_id) AS courses_enrolled,(SELECT COUNT(DISTINCT course_id) FROM Courses) AS total_courses
FROM Students s
LEFT JOIN Enrollments e ON s.student_id=e.student_id
GROUP BY s.student_id

--6
Select teacher_id from Teacher except
Select teacher_id from Teacher where teacher_id in (
Select DISTINCT teacher_id from courses)

Select teacher_id from Teacher where teacher_id not in (
Select DISTINCT teacher_id from courses)

--7
select avg(age) from 
(Select datediff(year, date_of_birth,GETDATE()) as age from students) as t

--8
Select course_id from courses where course_id not in
(Select course_id from Enrollments)

--9
SELECT student_id,(SELECT SUM(amount) FROM Payments p WHERE p.student_id = e.student_id) AS total_payments
FROM Enrollments e
GROUP BY student_id;

--10
SELECT student_id FROM Payments
GROUP BY student_id
having count(*)>1

--11
SELECT s.student_id,s.first_name,s.last_name,SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id=p.student_id
GROUP BY s.student_id,s.first_name,s.last_name;

--12
SELECT c.course_id,c.course_name,COUNT(e.student_id) AS students_enrolled
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id=e.course_id
GROUP BY c.course_id,c.course_name;


--13
SELECT s.student_id,s.first_name,s.last_name,AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id=p.student_id
GROUP BY s.student_id,s.first_name,s.last_name;
