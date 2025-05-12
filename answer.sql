-- DATABASE
DROP DATABASE IF EXISTS LMS;
CREATE DATABASE IF NOT EXISTS LMS;
USE LMS;

-- STUDENTS
CREATE TABLE Students (
    studentID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollmentDate DATE NOT NULL
);

-- INSTRUCTORS
CREATE TABLE Instructors (
    instructorID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hireDate DATE
);

-- COURSES
CREATE TABLE Courses (
    courseID INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    courseDescription TEXT,
    instructorID INT NOT NULL,
    FOREIGN KEY (instructorID) REFERENCES Instructors(instructorID)
);

-- ENROLLMENTS (MANY-TO-MANY: Students ↔ Courses)
CREATE TABLE Enrollments (
    studentID INT,
    courseID INT,
    enrollmentDate DATE,
    PRIMARY KEY (studentID, courseID),
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);

-- ASSIGNMENTS
CREATE TABLE Assignments (
    assignmentID INT AUTO_INCREMENT PRIMARY KEY,
    courseID INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    assignmentDescription TEXT,
    dueDate DATE,
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);

-- SUBMISSIONS
CREATE TABLE Submissions (
    submissionID INT AUTO_INCREMENT PRIMARY KEY,
    assignmentID INT NOT NULL,
    studentID INT NOT NULL,
    submissionDate DATE,
    content TEXT,
    FOREIGN KEY (assignmentID) REFERENCES Assignments(assignmentID),
    FOREIGN KEY (studentID) REFERENCES Students(studentID)
);

-- GRADES
CREATE TABLE Grades (
    gradeID INT AUTO_INCREMENT PRIMARY KEY,
    submissionID INT NOT NULL,
    grade DECIMAL(5,2),
    feedback TEXT,
    gradedDate DATE,
    FOREIGN KEY (submissionID) REFERENCES Submissions(submissionID)
);


-- Insert data into students
INSERT INTO students (studentID, firstName, lastName, email, enrollmentDate) VALUES
(1, 'Danielle', 'Johnson', 'jeffreydoyle@hotmail.com', '2021-08-17'),
(2, 'Joy', 'Gardner', 'johnsonjeffery@hotmail.com', '2021-02-21'),
(3, 'Matthew', 'Nelson', 'brownsusan@hotmail.com', '2022-12-19'),
(4, 'Michael', 'Smith', 'barrettbrittany@hotmail.com', '2023-11-24'),
(5, 'Tyler', 'Jones', 'haleyfox@hotmail.com', '2021-04-15'),
(6, 'Danielle', 'Hicks', 'crystaltaylor@perez.org', '2023-11-03'),
(7, 'John', 'Gibson', 'kennethpeters@yahoo.com', '2022-10-03'),
(8, 'Cynthia', 'Jackson', 'deanna63@williams.com', '2021-10-14'),
(9, 'Steven', 'Hall', 'wadeclark@hotmail.com', '2021-11-30'),
(10, 'Anthony', 'Harris', 'gregoryweber@rice.org', '2023-02-21'),
(11, 'Kaitlin', 'Cruz', 'christinecoleman@bush.com', '2021-12-13'),
(12, 'Sarah', 'Phillips', 'lauren59@perkins-bird.com', '2022-06-02'),
(13, 'Kristina', 'West', 'brandon28@wood.net', '2023-04-25'),
(14, 'Robert', 'Parker', 'susan41@bailey.com', '2021-01-01'),
(15, 'Maria', 'Nelson', 'ruth94@gmail.com', '2022-01-01'),
(16, 'Melissa', 'Jones', 'benjaminlopez@hotmail.com', '2023-03-03'),
(17, 'Adam', 'Young', 'nathansmith@hotmail.com', '2022-07-12'),
(18, 'David', 'Hill', 'barnespatricia@gmail.com', '2021-08-08'),
(19, 'James', 'Murphy', 'danielwhite@yahoo.com', '2022-04-09'),
(20, 'Brianna', 'Hall', 'jonescrystal@jones.com', '2024-01-22');

-- Insert data into instructors
INSERT INTO instructors (instructorID, firstName, lastName, email, hireDate) VALUES
(1, 'Chad', 'Young', 'ambercummings@hotmail.com', '2021-05-09'),
(2, 'Barbara', 'Sanchez', 'glee@hotmail.com', '2020-03-27'),
(3, 'Melissa', 'Armstrong', 'catherine33@yahoo.com', '2022-06-15'),
(4, 'Brian', 'Clark', 'blackmonica@gmail.com', '2023-02-10'),
(5, 'John', 'Leblanc', 'williamsyvette@gmail.com', '2019-01-14');

-- Insert data into courses
INSERT INTO courses (courseID, courseName, courseDescription, instructorID) VALUES
(1, 'Course Better', 'Coach magazine degree husband around.', 2),
(2, 'Course Property', 'Game before animal up national.', 3),
(3, 'Course Near', 'Reach food expert city those dream issue.', 2),
(4, 'Course Offer', 'Already you music quickly develop fly your.', 2),
(5, 'Course Mention', 'Newspaper hand eat apply wind performance arrive.', 4),
(6, 'Course Group', 'There beat who even.', 1),
(7, 'Course Let', 'Specific support cover next.', 5),
(8, 'Course Catch', 'Subject during he Mrs performance.', 1),
(9, 'Course Leave', 'Surface according sing central here.', 5),
(10, 'Course Pretty', 'You available defense enter value thing these.', 4);

-- Insert data into enrollments
INSERT INTO enrollments (studentID, courseID, enrollmentDate) VALUES
(1, 2, '2023-06-26'),
(1, 6, '2022-03-30'),
(3, 6, '2023-07-04'),
(3, 2, '2023-10-01'),
(4, 6, '2023-11-15'),
(5, 3, '2022-02-10'),
(6, 10, '2023-12-10'),
(7, 4, '2023-03-08'),
(8, 2, '2023-05-21'),
(9, 6, '2022-09-12'),
(10, 1, '2023-03-14'),
(11, 4, '2022-12-01'),
(12, 3, '2023-05-18'),
(13, 6, '2021-12-05'),
(14, 2, '2023-01-23'),
(15, 7, '2022-10-11'),
(16, 5, '2023-04-19'),
(17, 8, '2023-07-26'),
(18, 9, '2022-06-13'),
(7, 7, '2023-03-26');

-- Insert data into assignments
INSERT INTO assignments (assignmentID, courseID, title, assignmentDescription, dueDate) VALUES
(1, 3, 'Assignment 1', 'Expect just myself few worker southern.', '2023-09-20'),
(2, 4, 'Assignment 2', 'Available movement brother.', '2023-03-14'),
(3, 5, 'Assignment 3', 'Raise model cup fine difficult quite.', '2024-03-02'),
(4, 6, 'Assignment 4', 'Heart discuss situation.', '2023-01-25'),
(5, 7, 'Assignment 5', 'His friend everyone green already.', '2023-04-17'),
(6, 8, 'Assignment 6', 'She catch participant officer.', '2024-01-01'),
(7, 9, 'Assignment 7', 'Itself compare forward.', '2023-06-30'),
(8, 10, 'Assignment 8', 'State turn garden society.', '2023-05-19'),
(9, 1, 'Assignment 9', 'Only crime sister opportunity myself.', '2024-02-15'),
(10, 2, 'Assignment 10', 'Face everything American.', '2025-01-10'),
(11, 3, 'Assignment 11', 'Deep message Democrat.', '2023-06-21'),
(12, 4, 'Assignment 12', 'Whose ahead cell.', '2023-08-18'),
(13, 5, 'Assignment 13', 'Nice carry development.', '2023-10-05'),
(14, 6, 'Assignment 14', 'There per question help.', '2024-04-04'),
(15, 7, 'Assignment 15', 'Her pick different.', '2024-06-12'),
(16, 8, 'Assignment 16', 'Able before between.', '2023-12-20'),
(17, 9, 'Assignment 17', 'Final draw statement.', '2023-11-22'),
(18, 10, 'Assignment 18', 'Until thus information.', '2024-03-31'),
(19, 1, 'Assignment 19', 'Space series central.', '2025-08-25'),
(20, 4, 'Assignment 20', 'Issue we TV perhaps professional by.', '2026-01-09');

-- Insert data into submissions
INSERT INTO submissions (submissionID, assignmentID, studentID, submissionDate, content) VALUES
(1, 5, 19, '2026-03-26', 'Finally impact I fast camera inside wait. Past feeling nature a. Involve oil pressure let kind. Memory soldier where save probably.'),
(2, 8, 3, '2025-01-03', 'Note voice four west operation personal next. Cup edge reason impact.'),
(3, 19, 13, '2025-08-18', 'Indeed program garden her situation. Always approach success interesting along bring.'),
(4, 5, 12, '2023-06-03', 'Add rule heart new behavior.'),
(5, 20, 2, '2024-01-18', 'Despite door career want represent well pressure. Finish decision method wide else.'),
(6, 11, 7, '2023-09-25', 'Eight economic some image history usually.'),
(7, 12, 5, '2022-11-02', 'Budget trouble try free discover operation.'),
(8, 2, 6, '2023-04-27', 'Significant run try myself none grow deal.'),
(9, 7, 4, '2022-08-11', 'Mean girl tax subject her final.'),
(10, 6, 3, '2022-09-12', 'Speak lawyer may good despite.'),
(11, 4, 2, '2023-07-04', 'Certainly discover week traditional data late.'),
(12, 13, 1, '2024-09-01', 'While sing area.'),
(13, 1, 9, '2023-04-10', 'Often soon interesting anything important job.'),
(14, 3, 10, '2023-03-19', 'Positive necessary turn.'),
(15, 9, 5, '2023-02-28', 'Somebody rule current interesting.'),
(16, 10, 8, '2024-01-16', 'Manage speak mention task.'),
(17, 14, 7, '2023-04-14', 'Check week determine strong.'),
(18, 16, 6, '2023-06-09', 'Smile war card parent.'),
(19, 18, 10, '2024-10-20', 'Police raise situation.'),
(20, 16, 5, '2024-01-24', 'Week physical less nor. Large under north play person ten physical character. Kind field ever argue medical financial later. Hard expert popular within.');

-- Insert data into grades
INSERT INTO grades (gradeID, submissionID, grade, feedback, gradedDate) VALUES
(1, 1, 71.87, 'Word base position always remain yard.', '2023-04-30'),
(2, 2, 88.35, 'Visit writer include policy author.', '2023-09-16'),
(3, 3, 92.50, 'Bag good service someone article.', '2023-12-25'),
(4, 4, 67.90, 'Inside power property effect low.', '2024-02-28'),
(5, 5, 75.22, 'Even drop sure your.', '2023-11-18'),
(6, 6, 84.00, 'Sing court reason deal today.', '2023-07-02'),
(7, 7, 58.45, 'He group factor black.', '2023-06-06'),
(8, 8, 62.10, 'Cup visit health.', '2023-03-08'),
(9, 9, 95.60, 'Try democratic interesting cell.', '2023-01-27'),
(10, 10, 79.32, 'Voice participant worry.', '2023-04-21'),
(11, 11, 88.80, 'Remain mean yet.', '2023-05-04'),
(12, 12, 66.67, 'Hot pretty behind hair.', '2023-10-10'),
(13, 13, 89.23, 'Fund long pretty west.', '2023-06-20'),
(14, 14, 91.00, 'Pattern site serious.', '2023-11-02'),
(15, 15, 83.78, 'Poor five authority.', '2023-08-18'),
(16, 16, 90.12, 'Expect role exist.', '2024-03-16'),
(17, 17, 85.55, 'Form experience ok answer.', '2023-06-30'),
(18, 18, 87.40, 'Enter theory truth.', '2023-07-25'),
(19, 19, 74.99, 'Explain again surface.', '2023-09-14'),
(20, 20, 99.84, 'Eight strong nature.', '2023-05-31');

-- Sample code to test database
SELECT st.studentID, st.firstName, s.submissionDate, g.grade FROM submissions AS s
JOIN students AS st
JOIN grades as g
ON st.studentID = s.studentID AND s.submissionID = g.submissionID;

