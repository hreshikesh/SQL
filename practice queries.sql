create database practice;
use practice;
//create

create table human_info(
names varchar(30),
age integer,
place varchar(10),
email varchar(15),
phoneNo long);

//alter

1.ADD column

alter table human_info  add work varchar(10);

2.modify column

alter table human_info modify name varchar(10);
alter table human_info modify email varchar(25);

3.rename the column

-- alter table human_info rename column names to human_name varchar(10);

alter table human_info change names human_name varchar(20);

4.drop

alter table human_info drop column work;


//insert 
INSERT INTO human_info VALUES
('Ravi Kumar',      28, 'Bangalore', 'ravi@gmail.com',     9876543210),
('Anita Sharma',    32, 'Mysore',    'anita@gmail.com',    9123456780),
('Suresh Patil',    25, 'Udupi',     'suresh@gmail.com',   9988776655),
('Priya Rao',       29, 'Mangalore', 'priya@gmail.com',    9090909090),
('Kiran Shetty',    31, 'Karwar',    'kiran@gmail.com',    9871203456),
('Meena Joshi',     24, 'Shimoga',   'meena@gmail.com',    9123459876),
('Harish Gowda',    27, 'Belgaum',   'harish@gmail.com',   9564781230),
('Deepa Nair',      33, 'Kannur',    'deepa@gmail.com',    9876504321),
('Vivek Kulkarni',  26, 'Kasargod',  'vivek@gmail.com',    9321654780),
('Lakshmi Menon',   30, 'Hubli',     'lakshmi@gmail.com',  9001209876);
insert into human_info values('ram',   20, 'Hubli',     'ram@gmail.com',  9001209875);
insert into human_info values('lakme',   20, 'mangalore',     'lakme@gmail.com',  9001209875);
insert into human_info values('lakme',   20, 'mangalore',     'lakme@gmail.com',  9001209875);



//CRUD

create---
read

select

select * from human_info;

select human_name from human_info;

select human_name from human_info where email="ravi@gmail.com";

select * from human_info where age>30;

select human_name,email from human_info where age<28;


update

update human_info set phoneNo=9123456780 where human_name="Anita Sharma";

update human_info set age=29,email="priya3@gmail.com" where human_name="Priya Rao";


delete

delete  from human_info where human_name="Deepa Nair";


// Filtering & Sorting Data 

1.between

select * from human_info where age between 20 and 30

select human_name,email from human_info where phoneNo between 9876543210 and 9001209876;

select human_name from human_info where place="mysore" and age =32;


2.in--
select * from human_info where place in("bangalore","mysore","mangalore"); 

not in--
select * from human_info where phoneNo not in(9876543210,9123456780,9090909090) ;


3.like--
% → any number of characters

_ → exactly one character


select human_name from human_info where human_name like "%a";
select human_name from human_info where human_name like "a%";  
select human_name from human_info where human_name like "%sh%";  
select human_name from human_info where human_name like "r_m";  

4.null and not null--

select human_name from human_info where human_name is not null;  

5.orderby 

select * from human_info  order by age asc;
select * from human_info  order by age desc;
select * from human_info  order by age asc, place desc ;

6.limit
//to retreive top 5 young people
select * from human_info order by age asc limit 5; 
//to 3 place in desc
select place from human_info order by place desc limit 3;



Aggregate Functions & Grouping

1.count()

select count(*) from human_info where age>25;

2.groupby

select place,count(*) from human_info group by place;

3.avg,

//find avg of age per place
select place,avg(age) from human_info 
group by place;
//max and min age per place


4.having
//show places with 2 people
select human_name,place,count(*) as count from human_info
group by place having count(*)>=2

//Count people by place and age
select age,place,count(*) as count from human_info
group by  place,age 


//joints

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30),
    email VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    department VARCHAR(30),
    instructor VARCHAR(50)
);
Drop table enrollments;

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO students VALUES
(1, 'Alice', 20, 'Female', 'New York', 'alice@mail.com'),
(2, 'Bob', 21, 'Male', 'Chicago', 'bob@mail.com'),
(3, 'Charlie', 19, 'Male', 'Boston', 'charlie@mail.com'),
(4, 'David', 22, 'Male', 'Dallas', 'david@mail.com'),
(5, 'Eva', 20, 'Female', 'New York', 'eva@mail.com'),
(6, 'Frank', 23, 'Male', 'Chicago', 'frank@mail.com'),
(7, 'Grace', 21, 'Female', 'Boston', 'grace@mail.com'),
(8, 'Hannah', 20, 'Female', 'Dallas', 'hannah@mail.com'),
(9, 'Ian', 19, 'Male', 'Chicago', 'ian@mail.com'),
(10, 'Judy', 22, 'Female', 'Boston', 'judy@mail.com');

select * from students;


INSERT INTO courses VALUES
(101, 'Mathematics', 4, 'Science', 'Dr. Smith'),
(102, 'Physics', 3, 'Science', 'Dr. Johnson'),
(103, 'Chemistry', 4, 'Science', 'Dr. Lee'),
(104, 'Biology', 3, 'Life Science', 'Dr. White'),
(105, 'Computer Science', 5, 'Engineering', 'Dr. Brown');


select * from courses;


INSERT INTO enrollments VALUES
(1, 1, 101, '2025-01-10', 'A'),
(2, 1, 102, '2025-01-15', 'B'),
(3, 2, 103, '2025-02-01', 'A'),
(4, 3, 101, '2025-02-05', 'B'),
(5, 4, 104, '2025-03-10', 'C'),
(6, 5, 105, '2025-03-12', 'A'),
(7, 6, 105, '2025-03-15', 'B'),
(8, 7, 103, '2025-04-01', 'A'),
(9, 8, 102, '2025-04-05', 'B'),
(10, 10, 101, '2025-05-10', 'A');

select * from enrollments;

1.Innner Join

Q)List students with the courses they enrolled in.

select s.student_name,c.course_id,e.grade 
from enrollments e
inner join students s on e.student_id=s.student_id 
inner join courses c on c.course_id=e.course_id;

select * from students,courses,enrollments;


2.Left Join

 Q)Show all students and their courses (even if they haven’t enrolled yet)
 
 select * from
 students s
 left join enrollments e on e.student_id=s.student_id
 left join courses c on c.course_id=e.course_id;
 
 
 3.right join
 
 q) Show all courses and students taking them (including courses with no students yet)
 select * from students s
 right join enrollments e on e.student_id = s.student_id
 right join courses c on c.course_id=e.course_id
 
 
 4. Full join(union)
 Q)Show all students and courses, matching where possible
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id

UNION

SELECT s.student_name, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
 
 
 5.cross join
 
 q): Pair every student with every course.
 
 select s.student_name ,c.course_name from
 students s
 Cross join courses c;
 
 
 6.Self Join
 
 q)Students from the same city(both student name is diffrent)
 
 select s.student_name as st1,s1.student_name as st2,s.city from
 students s
 Inner join students s1 on s.city=s1.city and s1.student_id != s.student_id;
 
 CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20),
    dept_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'John', 101, 50000),
(2, 'Sara', 102, 60000),
(3, 'Mike', 101, 55000),
(4, 'Linda', 103, 70000),
(5, 'James', NULL, 45000);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');


CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(30)
);

INSERT INTO Projects VALUES
(201, 1, 'Recruitment Drive'),
(202, 2, 'System Upgrade'),
(203, 4, 'Market Research'),
(204, 6, 'Audit Compliance');

select * from  Employees,Departments,Projects;

 
 

    

 
 
 
 
 





 








