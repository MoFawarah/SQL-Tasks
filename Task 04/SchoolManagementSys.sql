CREATE DATABASE SchoolManagementSys;

use SchoolManagementSys;


create schema Student;
create schema Course;

create schema Assignment;

create schema Attendance;




-- table 01 >> Students
create table Student.Students (
student_id int identity (1,1),
name varchar (50) not null,
date_of_birth date not null,
address varchar(50),

constraint Students_pk primary key (student_id) );


-- table 02: FamilyInfo:
-- A student can have one family info (one to one)
 CREATE TABLE Student.FamilyInfo (
 family_id int identity (1,1),
 student_id int unique not null,
 fatherName varchar (20),
 fatherEmail varchar (50),
 fatherPhone varchar (15),

 constraint FamilyInfo_pk primary key (family_id),
 constraint FamilyInfo_Students_fk foreign key (student_id)
 references Student.Students (student_id) 
 );


 -- table 03 Courses:
create table Course.Courses (
course_id int identity (1,1),
course_name varchar (50), 

constraint Courses_pk primary key (course_id)

);

-- table 04 Courses_Students: Junction Table (Many to Many)
-- A student can have many courses and a course can have many students ^^

create table Course.Courses_Students (
student_id int,
course_id int,

constraint Courses_Students_fk1 foreign key (student_id)
references Student.Students (student_id),

constraint Courses_Students_fk2 foreign key (course_id)
references Course.Courses (course_id),

constraint Courses_Students_pk primary key (student_id, course_id)
);


-- table 05: Classes

-- a course can be taught in many different classes (halls) - one to many
create table Course.Classes (
class_id int identity (1,1),
course_id int,
class_name varchar (50),
class_hall varchar (100),

constraint Classes_pk primary key (class_id),

constraint Classes_fk foreign key (course_id)
references Course.Courses (course_id)
);

-- table 06: Students_Classes
-- A student can be in too many classes and a class can have too many studetns - many to many

create table Course.Students_Classes (
student_id int,
class_id int,

constraint Students_Classes_fk1 foreign key (student_id)
references Student.Students (student_id) ,

constraint Students_Classes_fk2 foreign key (class_id)
references Course.Classes(class_id),

constraint Students_Classes_pk primary key (student_id, class_id),
);

-- table 07: Assignments
create table Assignment.Assignments (
assignment_id int identity (1,1),
assignment_name varchar (50) not null,
assignment_date date not null,

constraint Assignments_pk primary key (assignment_id),
);

--Alter table Assignment.Assignments
--add status varchar (50);

--select * from Assignment.Assignments;

--update Assignment.Assignments
--set status = 'pass'
--where assignment_id between 1 and 6;

--update Assignment.Assignments
--set status = 'fail'
--where assignment_id = 7;


-- table 08: Assignments_Students
-- a student can have many Assignments and an Assignment can have many students
create table Assignment.Assignments_Students (
assignment_id int,
student_id int,

constraint Assignments_Students_fk1 foreign key (assignment_id)
references Assignment.Assignments (assignment_id),

constraint Assignments_Students_fk2 foreign key (student_id)
references Student.Students(student_id),

CONSTRAINT Assignments_Students_pk PRIMARY KEY (assignment_id, student_id)

);

-- table 09: Attendance
-- a class can have many Attendance and a student can have many Attendance
-- one to many (student and Attendance)
-- one to many (class and Attendance)
create table Attendance.Attendance (
attendance_id int identity (1,1),
attendance_date date,
absence_type varchar (100),
absence_reason varchar (255),

student_id int,
class_id int,

constraint Attendance_pk primary key (attendance_id),

constraint Attendance_fk1 foreign key (student_id)
references Student.Students (student_id) ,

constraint Attendance_fk2 foreign key (class_id)
references Course.Classes (class_id)
);


-- Insert data into Students table
INSERT INTO Student.Students (name, date_of_birth, address)
VALUES 
('Ahmad', '2005-01-15', 'Amman'),
('Sara', '2006-04-22', 'Irbid'),
('Ali', '2007-07-10', 'Zarqa'),
('Laila', '2008-09-05', 'Aqaba'),
('Hassan', '2009-11-20', 'Mafraq'),
('Aisha', '2006-02-12', 'Madaba'),
('Khaled', '2007-06-18', 'Salt'),
('Huda', '2008-08-14', 'Jarash'),
('Yasin', '2005-12-25', 'Tafila'),
('Noor', '2006-03-30', 'Karak'),
-- Additional students without matching data in other tables
('Omar', '2005-05-10', 'Amman'),
('Rania', '2006-07-22', 'Irbid');



-- Insert data into FamilyInfo table
INSERT INTO Student.FamilyInfo (student_id, fatherName, fatherEmail, fatherPhone)
VALUES 
(1, 'Mohammad', 'mohammad@gmail.com', '0791234567'),
(2, 'Omar', 'omar@gmail.com', '0792345678'),
(3, 'Yousef', 'yousef@gmail.com', '0793456789'),
(4, 'Hani', 'hani@gmail.com', '0794567890'),
(5, 'Abdullah', 'abdullah@gmail.com', '0795678901'),
(6, 'Mahmoud', 'mahmoud@gmail.com', '0796789012'),
(7, 'Fahad', 'fahad@gmail.com', '0797890123'),
(8, 'Sami', 'sami@gmail.com', '0798901234');

-- Insert data into Courses table
INSERT INTO Course.Courses (course_name)
VALUES 
('Math'),
('Science'),
('History'),
('English'),
('Art'),
-- Additional courses without matching data in other tables
('Music'),
('PE');

-- Insert data into Courses_Students table
INSERT INTO Course.Courses_Students (student_id, course_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 1),
(6, 2),
(7, 3),
-- No matching student_id for the next record
(11, 5),
-- Additional records without matching student_id or course_id
(8, 6),
(9, 7);

-- Insert data into Classes table
INSERT INTO Course.Classes (course_id, class_name, class_hall)
VALUES 
(1, 'Math Class A', 'Hall 1'),
(2, 'Science Class B', 'Hall 2'),
(3, 'History Class C', 'Hall 3'),
(4, 'English Class D', 'Hall 4'),
(5, 'Art Class E', 'Hall 5'),
-- Additional classes without matching course_id
(6, 'Geography Class F', 'Hall 6'),
(7, 'Physics Class G', 'Hall 7');

-- Insert data into Students_Classes table
INSERT INTO Course.Students_Classes (student_id, class_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
-- Additional records without matching student_id or class_id
(8, 6),
(8, 7);

-- Insert data into Assignments table
INSERT INTO Assignment.Assignments (assignment_name, assignment_date)
VALUES 
('Math Homework', '2023-09-15'),
('Science Project', '2023-09-20'),
('History Essay', '2023-09-25'),
('English Reading', '2023-09-30'),
('Art Drawing', '2023-10-05'),
-- Additional assignments without matching data in other tables
('Music Performance', '2023-10-10'),
('PE Drill', '2023-10-15');

-- Insert data into Assignments_Students table
INSERT INTO Assignment.Assignments_Students (assignment_id, student_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
-- Additional records without matching assignment_id or student_id
(6, 8),
(7, 9);

-- Insert data into Attendance table
INSERT INTO Attendance.Attendance (attendance_date, absence_type, absence_reason, student_id, class_id)
VALUES 
('2023-09-15', 'Absent', 'Sick', 1, 1),
('2023-09-16', 'Late', 'Traffic', 2, 2),
('2023-09-17', 'Absent', 'Family event', 3, 3),
('2023-09-18', 'Present', '', 4, 4),
('2023-09-19', 'Absent', 'Medical', 5, 5),
-- Additional records without matching student_id or class_id
('2023-09-20', 'Late', 'Overslept', 8, 6),
('2023-09-21', 'Absent', 'Vacation', 9, 7);

insert into Attendance.Attendance (attendance_date, absence_type, absence_reason, student_id, class_id)
Values ('2023-10-15', 'Absent', 'Grandpa Death', 1, 1),
('2023-10-15', 'Absent', 'Sleeping', 1, 5),
('2023-11-01', 'Absent', 'Grandpa Death', 1, 2),
('2023-12-15', 'Absent', 'Grandpa Death', 1, 3);


select * from Student.Students ;
-- Q 01:
Select * from Student.Students 
where date_of_birth = '2005-01-15';

-- Q 02:
select * from Course.Courses
where course_name = 'Math';

-- Q 03:
Alter table Student.Students
Add Email varchar (50);

-- Q 04: 
insert into Student.Students (name, date_of_birth, address, Email)
Values ('Hatem', '1998-07-28', 'Ajloun', 'hatem@gmail.com');

-- Q 05:
select S.name, F.fatherName, F.fatherPhone from Student.Students S
inner join Student.FamilyInfo F
on S.student_id = F.student_id;

-- Q 06:
Select S.student_id, S.name, CC.course_id, CC.course_name from Student.Students S
inner join Course.Courses_Students CS
on S.student_id = CS.student_id
inner join Course.Courses CC
on CC.course_id = CS.course_id;

-- Q 07:
select S.student_id, S.name, AA.assignment_id, AA.assignment_name, AA.status from Student.Students S
inner join Assignment.Assignments_Students AAS
on S.student_id = AAS.student_id
inner join Assignment.Assignments AA
on AA.assignment_id = AAS.assignment_id
where AA.status = 'pass';

--Q 08:
select * from Attendance.Attendance;


select * from Student.Students S
inner join Attendance.Attendance AA
on S.student_id = AA.student_id
where attendance_date between '2023-09-15' and '2023-09-18' and absence_type in ('absent', 'late') ;

-- Q 09:
select count(*) "Number of absenses", S.student_id, S.name from Student.Students S
full outer join Attendance.Attendance AA
on S.student_id = AA.student_id
group by S.student_id, S.name
having count(*) > 4;
