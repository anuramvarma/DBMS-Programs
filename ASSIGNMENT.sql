create table student(rollno number(5) primary key, name varchar(20), age number(2), bname

varchar(5), perc number(5,2));

insert into student values(520, 'HARI', 18, 'CSE', 76.5);

insert into student values(420, 'ANIL', 19, 'ECE', 66.8);

insert into student values(304, 'KUMAR', 18, 'MECH', 69.5);

insert into student values(445, 'HARI', 19, 'ECE', 72.5);

insert into student values(550, 'RAJU', 19, 'CSE', 65);

insert into student values(1240, 'ANIL', 18, 'IT', 68.5);

_______________________________________________________________________________________

 INSERT INTO student VALUES (555,'REDDY',18,'CSE',60.5);

 DELETE FROM student WHERE rollno=550;

 UPDATE student SET perc=70 WHERE rollno=420;

 SELECT name FROM student WHERE bname='CSE' and perc>=90;

 SELECT *FROM student WHERE age between 18 and 20;

 ALTER TABLE student ADD email varchar(25);

 UPDATE student SET email='Kumar@gmail.com' WHERE rollno=304;

 SELECT *FROM student;

 ALTER TABLE student DROP COLUMN email;

 SELECT *FROM student;
