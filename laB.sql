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
SELECT *FROM dept;

--1) Display all the records in emp table.
SELECT *FROM emp;
--2) Display all the records in emp table where employee belongs to deptno 10.
SELECT * FROM emp WHERE DEPTNO=10;
--3) Display all the records in emp table where employee does not belong to deptno 30.
SELECT * FROM emp WHERE DEPTNO!=30;
--4) Display total number of records in Emp table.
SELECT COUNT(*) AS TOTAL_RECORDS FROM emp;
--5) Display emp table with salary descending order.
SELECT *FROM emp ORDER BY sal desc;
--6) Display first five records in employee table.

--7)Display all the records in emp table order by ascending deptno, descending salary.
SELECT *FROM emp ORDER BY DEPTNO asc,sal desc;
--8)Display all employees those who were joined in year 1981.
SELECT *FROM emp WHERE HIREDATE LIKE '%81';
--9) Display employee information who don’

--10)Display the records in emp table where MGR in 7698,7566 and sal should be greater then 1500.
SELECT *FROM emp WHERE (MGR=7698 OR MGR=7566) AND sal>1500;
--11) Display all employees where their salary is less then the Ford’s salary?
SELECT *FROM emp WHERE sal<(SELECT sal FROM emp WHERE ENAME='FORD');
--12) Display all the records in EMP table along with the row I'd.

--13) Write a query to display current date.

--14) Display distinct job from emp table.
SELECT DISTINCT JOB FROM emp;
--15) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J,A,or M.
SELECT CONCAT(UPPER(SUBSTR(ENAME,1,1)),LOWER(SUBSTR(ENAME,2))) AS NAME FROM EMP WHERE UPPER(SUBSTR(ENAME,1,1)) IN ('J','A','M');
--16) Write a query to display the employee name, department name of all employees who earn a commission.
SELECT ENAME,DNAME FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND COMM IS NOT NULL;
--17) Display the empno, ename, sal, and salary increased by 15%.
SELECT EMPNO,NAME FROM emp 
