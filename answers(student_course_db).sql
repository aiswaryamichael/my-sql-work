-- Create a database named `education_db` and create the following two tables:

	create database education_db;
    
    use education_db;

-- *Course

--  `course_id` – Primary Key, Auto Increment
--  `course_name` – NOT NULL, UNIQUE
--  `duration`
--  `fee`

	create table course(course_id int primary key not null auto_increment,
						course_name varchar(20) not null unique,
                        duration int,
                        fee int);

-- Student

--  `student_id` – Primary Key, Auto Increment
--  `student_name` – NOT NULL
--  `email` – UNIQUE
--  `age`
--  `gender`
--  `mark`
--  `courseid` – Foreign Key referencing `Course(courseid)`

	create table student(student_id int primary Key auto_increment,
						 student_name varchar(20) not null,
                         email varchar(20) unique,
                         age int,
                         gender enum("male","female"),
                         mark int,
                         courseid int, 
                         Foreign Key(courseid) references course(course_id));
                         

-- Insert records

	insert into course(course_name,duration,fee) 
				values('mechanics',3,10000),
					  ('physics',2,5000),
                      ('chemistry',6,6000),
                      ('python',3,30000),
                      ('java',9,20000);


	insert into student(student_name,email,age,gender,mark,courseid)
				 values('swetha','swetha@gmail.com',22,'female',80,1),
					   ('aiswarya','aiswarya07@gmail.com',22,'female',85,2),
                       ('aparna','aparna@gmail.com',22,'female',67,3),
                       ('arun','arun@gmail.com',12,'male',34,4),
                       ('amal','amal@gmail.com',15,'male',23,3);
-- ### Questions

-- 1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.

	select * from student where mark>80 order by mark desc;

-- 2. Write a query to find the highest mark, lowest mark, and average mark of all students.

	select max(mark),min(mark),avg(mark) from student;

-- 3. Write a query to display the top 5 students based on their marks.

	select * from student order by mark limit 5;

-- 4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.

	select student_name,mark,age from student where age between 18 and 25 order by age;

-- 5. Write a query to find the number of students in each course.

	select courseid,count(*) from student group by courseid;
    
-- 6. Write a query to display the courses that have more than 2 students.

	select courseid,count(*) from student group by courseid having count(*)>2;

-- 7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.

	select student_name,mark,course_name from course inner join student on course.course_id=student.courseid;

-- 8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.

	select course_name,student_name from course left join student on course.course_id=student.courseid;

-- 9. Write a query to display students whose marks are greater than the overall average mark using a subquery.

	select student_name,mark from student where mark>(select avg(mark) from student);

-- 10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.

	select course_name,student_name,mark from course join student on course.course_id=student.courseid where mark=(select mark from student order by mark desc limit 1 offset 1);
    
-- ### Git Repository Task

-- 1. Create a new GitHub repository for this SQL practice task.
-- 2. Create a file named `answers.sql` and write the SQL queries for all 10 questions in it.
-- 3. Commit and push the file to your GitHub repository.
-- 4. Make the repository public and share the GitHub repository link*.
