use mohana

create table students(
student_id int primary key,
student_name varchar(50),
major varchar(100),
enrollment_year year
);

create table Courses(
course_id int primary key,
course_name varchar(100),
credits int,
department varchar(70)
);

create table enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
grade varchar(5),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
 );
 
 insert into  students values
 (1,'Alice','CS',2021),
 (2,'Bob','EE',2022),
 (3,'Carol','CS',2021),
 (4,'David','ME',2023);

 insert into Courses values
 (101,'Data Structures',3,'CS'),
 (102,'Circuits',4,'EE'),
 (103,'Thermodynamics',3,'ME'),
 (104,'Algorithms',3,'CS');
 
 insert into enrollments values
( 1,1,101,'A'),
(2,1,104,'B'),
(3,2,102,'B'),
(4,3,101,'A'),
(5,4,103,'C')

select*from students;
select*from courses;
select*from enrollments;

select major,count(*) as total_student,
GROUP_CONCAT(student_name) AS student_names from students  group by major

select s.student_id,e.enrollment_id,course_id from enrollments as e
left join students as s on e.student_id=s.student_id

-- groupby

select major ,count(*) as total_student from students group by major

select course_id,count(*) student_id from enrollments group by course_id

select student_id,count(*) as total_courses from students group by student_id

select department, avg(credits) as avg_credits from courses group by department

-- Get the total number of enrollments per course.

select course_id ,count(*) as total_enrollments from courses group by course_id

-- List how many students enrolled each year.
select enrollment_year,count(*) as enrolled_count from students group by enrollment_year

-- groupby & joins

-- q.Show each student's name and the number of courses they are enrolled in.

SELECT s.student_name , COUNT(*) AS TotalCourses
FROM Enrollments e
JOIN Students s ON e.Student_ID = s.Student_ID
GROUP BY s.student_name;

 -- List each course name and the number of students enrolled in it.
 select c.course_name,count(*) as total_student
 from courses as c group by c.course_name
 




 
 

