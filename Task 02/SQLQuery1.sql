CREATE DATABASE SchoolSystem;

USE SchoolSystem

CREATE TABLE Teachers (
ID int primary key,
teacherName varchar (50),
)

CREATE TABLE TeachersDetails (
ID int primary key,
teacherDeatils varchar (100), 
ID_Teachers int unique foreign key references Teachers (ID)

) 

CREATE TABLE Courses (
ID int primary key,
courseName varchar (50),
ID_Teachers int foreign key references Teachers (ID)
)

CREATE TABLE Students (
ID int primary key,
studentName varchar (50),
)

Create Table Students_Teachers (
ID_Teachers int foreign key references Teachers (ID),
ID_Students int foreign key references Students (ID)
);


Create Table Students_Courses (
ID_Students int foreign key references Students (ID),
ID_Courses int foreign key references Courses (ID),
);

INSERT INTO Teachers (ID, teacherName) VALUES
(1, 'Yman BB'),
(2, 'Nancy Rami'),
(3, 'Malek TT'),
(4, 'Tuga YY'),
(5, 'Hosam UU');

delete from Teachers;


INSERT INTO Students(ID, studentName) VALUES
(1, 'Mohammad Fawareh'),
(2, 'Rami Bilal'),
(3, 'Khalid Milly'),
(4, 'Sami Faoud'),
(5, 'Rania Mohammad');

INSERT INTO TeachersDetails (ID, teacherDeatils, ID_Teachers) VALUES
(1, 'Experienced in Mathematics and Science.', 1),
(2, 'Specializes in Literature and Language Arts.', 2),
(3, 'Background in History and Social Studies.', 3),
(4, 'Expertise in Computer Science and Programming.', 4),
(5, 'Skilled in Music and Fine Arts.', 5);

INSERT INTO Courses (ID, courseName, ID_Teachers) VALUES
(1, 'Mathematics', 1),
(2, 'Literature', 2),
(3, 'History', 3),
(4, 'Computer Science', 4),
(5, 'Music Appreciation', 5);


INSERT INTO Students_Teachers (ID_Teachers, ID_Students) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO Students_Courses (ID_Students, ID_Courses) VALUES
(1, 1),
(1, 2),
(2, 3),
(4,3),
(5, 5);

truncate table Students_Courses;

select * from Students;
select * from Students_Courses;
select * from TeachersDetails;

