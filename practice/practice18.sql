/* 1번 */
select * from student;
select * from department;


select 
    s.name,
    s.deptno1,
    d.dname
from student s, department d
where 
    s.deptno1 = ( select deptno1 from student where name = 'Anthony Hopkins' )
    AND s.deptno1 = d.deptno
order by s.name;


/* 2번 */
select * from professor;
select * from department;

select 
    p.name,
    p.hiredate,
    d.dname
from professor p, department d
where 
    p.hiredate > ( select hiredate from professor where name = 'Meg Ryan' )
    AND p.deptno = d.deptno
order by hiredate;



/* 3번 */
select * from student;

select 
    name,
    weight
from student
where weight > ( select AVG(weight) 
                    from student
                    where deptno1 = 201 );
                    


/* 4번 */
select * from emp2;
select * from dept2;


select 
    e.empno,
    e.name,
    e.deptno
from emp2 e, dept2 d
where 
    e.deptno = d.dcode
    AND d.area = 'Pohang Main Office';








