/* 1번 */
select * from professor;
select * from department;

select p.profno, p.name, d.deptno
from professor p, department d
where (d.deptno, p.hiredate) IN
            (select deptno, MIN(hiredate)
            from professor
            group by deptno)
    AND p.deptno = d.deptno;

/* 2번 */
select * from emp2;


select name, position, pay
from emp2
where ( position, pay ) IN (
                            select
                            position, MAX(pay) 
                            from emp2 
                            group by position);


