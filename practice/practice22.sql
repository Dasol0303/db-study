select * from emp2;
select * from dept2;


select e.empno, e.name, e.deptno, d.dname, d.area, e.pay
from emp2 e, dept2 d
where 
e.deptno = d.dcode
AND e.pay > 
(
    select
        AVG(pay)
    from emp2 ee, dept2 dd
    where 
        ee.deptno = dd.dcode
        AND dd.area = (
            select area 
            from emp2 e, dept2 d
            where 
                e.deptno = d.dcode
                AND name = 'AL Pacino'
                ));

