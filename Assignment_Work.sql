create table dept(deptno number(2), dname  varchar2(20), loc  varchar2(15),  
constraint pk_dept primary key (deptno));
 
create table emp(empno  number(4), ename varchar2(10), job varchar2(9), mgr number(4), hiredate date,
sal number(7,2), comm number(7,2), deptno number(2), constraint pk_emp primary key (empno),
constraint fk_deptno foreign key (deptno) references dept (deptno));

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');

insert into emp values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'),  2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-7-1987','dd-mm-yyyy'), 3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'),  3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'),1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, null, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-1987', 'dd-mm-yyyy'), 1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);
insert into emp values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'),1300, null, 10);

---1) Display all the records in emp table
SELECT * FROM emp;
---2) Display all the records in emp table where employee belongs to deptno 10.
SELECT * FROM emp WHERE deptno=10;

---3) Display all the records in emp table where employee does not belong to deptno 30.
SELECT * FROM emp WHERE deptno<>10;

---4) Display total number of records in Emp table.
SELECT COUNT(*) FROM emp;

---5) Display emp table with salary descending order
SELECT * FROM emp ORDER BY sal desc;

---6) Display first five records in employee table
SELECT * FROM emp LIMIT 5;

---7) Display all the records in emp table order by ascending deptno, descending salary.
SELECT * FROM emp ORDER BY deptno asc ,sal desc;

---8) Display all employees those who were joined in year 1981.
SELECT * from emp where hiredate LIKE '%81';

---9) Display employee information who don’


---10) Display the records in emp table where MGR in 7698,7566 and sal should be greater then
---1500
select * from emp where mgr in(7698,7566) and sal > 1500;

---11) Display all employees where their salary is less then the Ford’s salary?

SELECT ename FROM emp
WHERE sal >(SELECT sal FROM emp WHERE ename = 'FORD');

---12) Display all the records in EMP table along with the row id.


---13) Write a query to display current date.
SELECT
  TRUNC(CURRENT_DATE) AS current_date
FROM dual;

---14) Display distinct job from emp table.
SELECT distinct job FROM emp;

-- 15) Write a query that displays the employee’s names with the first letter capitalized and all other
-- letters lowercase for all employees whose name starts with J, A, or M.
select concat(upper(substr(ename,1,1)),lower(substr(ename,2))) as name
    from emp
    where  upper(substr(ename,1,1)) in ('J','A','M');

-- 16) Write a query to display the employee name, department name of all employees who earn a
-- commission.
SELECT ename,dname FROM emp NATURAL JOIN dept WHERE comm IS NOT NULL;

--17) Display the empno, ename, sal, and salary increased by 15%
SELECT empno,ename,sal,(sal+(sal*0.15)) AS Updated_SALARY FROM emp;

--18) Display employee names and corresponding manager names


--19) Display all the departments where employee salary greater than average salary of that
--department

SELECT dname
FROM emp NATURAL JOIN dept
WHERE sal >(SELECT AVG(sal) FROM emp);

--20) Display employees where length of ename is 5
SELECT * FROM emp WHERE LENGTH(ename) = 5;

--21) Display all employees where ename start with J and ends with S
SELECT ename FROM emp
WHERE ename LIKE 'J%S' or ename LIKE 'J%s' or  ename LIKE 'j%S' or  ename LIKE 'j%s'

--22) Display all employees where employee does not belong to 10,20,40
SELECT ename
FROM emp NATURAL JOIN dept
WHERE deptno NOT IN (10,20,40);

--23) Display all employees where jobs does not belong to PRESIDENT and MANAGER.
SELECT ename FROM emp
WHERE job NOT IN ('PRESIDENT','MANAGER');

--24) Display the maximum salary in the emp table
SELECT MAX(sal) FROM emp;

--25) Display average salary for job SALESMAN
SELECT job,AVG(sal)
FROM emp
GROUP BY job
HAVING job ='SALESMAN';

--26) Display all ename where first character could be anything, but second character should be L.
SELECT ename
FROM emp
WHERE ename LIKE '_L%' or ename LIKE '_l%';

--27) Display nth highest and nth lowest salary in emp table
SELECT MAX(sal),MIN(sal) FROM emp;

--28) Display all the departments where department has 3 employees.

SELECT dname
    FROM dept
    WHERE deptno IN (SELECT deptno
                     FROM emp  
                     GROUP BY deptno
    HAVING COUNT(*) =3);

--29) Display sum of salary for each department.

SELECT SUM(sal),deptno
FROM emp
GROUP BY deptno;

--30) Display all department with Minimum salary and maximum salary?

SELECT MAX(sal),MIN(sal),deptno
FROM emp
GROUP bY deptno;

--31) Display all ename, empno, dname, loc from emp, dept table.

SELECT ename ,empno,dname,loc
FROM emp NATURAL JOIN dept;

--32) Display all the departments where department does not have any employees
SELECT dname FROM dept
    WHERE deptno NOT IN (SELECT deptno FROM emp);

--33) Display all the departments where department does have atleast one employee
SELECT dname FROM dept
    WHERE deptno  IN (SELECT deptno FROM emp);
--34) Display all employees those who are not managers.
SELECT ename from emp
WHERE job <> 'MANAGER';

--35) Display ename, deptno from emp table with format of {ename} belongs to {deptno}
SELECT ename,deptno FROM emp;

-- 36) Display all the records in emp table. The ename should be lower case. The job first character
-- should be upper case and rest of the character in job field should be lower case.
SELECT lower(ename),concat(upper(substr(job,1,1)),lower(substr(job,2))) AS job
FROM emp;

--37) Create table emp1 and copy the emp table for deptno 10 while creating the table

--39) Display all the records for deptno which belongs to employee name JAMES.
SELECT deptno FROM emp
WHERE ename = 'JAMES';

--40) Display all the records in emp table where salary should be less than or equal to ADAMS
--salary.
SELECT * FROM emp WHERE sal <=(SELECT sal FROm emp WHERE ename = 'ADAMS');

--41) Display all subordinate those who are working under BLAKE.

--42) Display who is making highest commission

SELECT ename FROM emp WHERE comm = (SELECT MAX(comm) FROM emp);

--43) Display ename, sal, grade, dname, loc for each employee.

SELECT ename,sal,job,dname,loc
FROM emp NATURAL JOIN dept;

--44) Display all employee whose location is DALLAS.
SELECT ename FROM emp NATURAL JOIN dept WHERE loc = 'DALLAS';

--45) Delete emp records for detpno 10 and 20
DELETE FROM emp WHERE deptno = 10 or deptno = 20;

--46) Delete all employees those are not getting any commission
DELETE FROM emp WHERE comm IS NULL;

--47) Delete the employees where employee salary is greater than average salary of his/her
--department.
DELETE FROM emp WHERE sal>(SELECT avg(sal)
    FROM emp
    GROUP BY deptno);

--48) Rename the employee name JONES to ANDY
UPDATE emp SET ename = 'ANDY' WHERE ename='JONES';

--49) Increase the salary 5% for employee those who are earning commission less then 1000
UPDATE emp SET sal=(sal+(sal*0.05)) WHERE comm<1000;

--98) Increase 100$ for employee who is making more then averge salary of his department.
UPDATE emp SET sal=(sal+100) WHERE sal>(SELECT AVG(sal) FROM emp);

SELECT * FROM emp;
--99) Increase 1% salary for employee who is making lowest salary in dept 10
UPDATE emp SET sal=(sal+(sal*0.01)) WHERE sal=(SELECT MIN(sal) FROM emp WHERE deptno= 10);

--100) Increase commission 10$ for employees those who are located in NEW YORK.
UPDATE emp SET comm=(comm+10) WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'NEW YORK')
