/* 1번 */
select * from student;
select * from department;

select 
    s.name As "STU_NAME",
    s.deptno1 As "DEPTNO1",
    d.dname As "DEPT_NAME"
from student s, department d
where s.deptno1 = d.deptno;


/* 2번 */
select * from emp2;
select * from p_grade;

select 
    e.name,
    e.position,
    e.pay,
    p.s_pay As "LOW PAY",
    p.e_pay As "HIGH PAY"
from emp2 e LEFT OUTER JOIN p_grade p
ON 
    e.position = p.position
where e.position is not null;


/* 3번 */
select * from emp2;
select * from p_grade;

select 
    e.name As "NAME",
    (2010 - TO_CHAR( e.birthday, 'YYYY' )) + 1 As "한국나이",
    e.position As "지금 포지션",
    p.position As "그 나이에 맞는 포지션"
from emp2 e, p_grade p
where (2010 - TO_CHAR( e.birthday, 'YYYY' )) + 1 BETWEEN s_age AND e_age
order by (2010 - TO_CHAR( birthday, 'YYYY' )) + 1;


/* 4번 */
select * from customer;
select * from gift;


select 
    c.gname,
    c.point,
    DECODE ( c.point, 0, '', 'Notebook' ) As "GNAME_1"
from customer c, gift g
where 
    c.point BETWEEN g.g_start AND g.g_end
    AND (
        select 
            g_start
        from gift
        where gname = 'Notebook') < c.point;


/* 5번 */
select * from professor;

select 
    B.profno,
    B.name,
    B.hiredate,
    ( select 
        COUNT( A.hiredate ) 
    from professor A 
    where A.hiredate < B.hiredate ) count
from professor B
order by count;


/* 6번 */
select * from emp;

select 
    B.empno,
    B.ename,
    B.hiredate,
    ( select 
        COUNT( A.hiredate ) 
    from emp A 
    where A.hiredate < B.hiredate ) count
from emp B
order by hiredate;



