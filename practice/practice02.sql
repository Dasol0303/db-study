
/* ========= 1번 ============*/
--select * from emp;

select ename 
from emp
order by ename;

/* ========= 2번 ============*/
select deptno, sal 
from emp
order by deptno, sal desc;

/* ========= 3번 ============*/
select ename, sal 
from emp
where sal > 2000
order by sal desc;

/* ========= 4번 ============*/
select * from student;

select grade, birthday
from student
where grade !=1
order by birthday desc;


