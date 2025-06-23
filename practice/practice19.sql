/* 1번 */
select * from emp2;

select 
    name,
    position,
    pay
from emp2
where pay > ( select MIN(pay) from emp2 where position = 'Section head' );


/* 2번 */
select * from student;

select 
    name,
    grade,
    weight
from student
where weight < ( select MIN(weight) from student where grade = 2 );



/* 3번 */
select * from emp2;
select * from dept2;

select 
    dd.dname,
    ee.name,
    ee.pay
from emp2 ee, dept2 dd
where ee.pay < ( select 
                    MIN( pay )
                from ( select
                            AVG(e.pay) pay
                        from emp2 e, dept2 d
                        where e.deptno = d.dcode group by d.dname) )
AND ee.deptno = dd.dcode
order by dd.dname desc;


/* 다른 사람 풀이~ */
select
    d.dname,
    e.name,
    e.pay
from emp2 e, dept2 d
where e.deptno = d.dcode
    AND pay < (select MIN(AVG(pay)) from emp2 group by deptno)
order by e.name desc;


-- 쌤 풀이! (불필요한 게 좀 있었넹...ㅎ)
select 
    d.dname,
    e.name,
    e.pay
from emp2 e, dept2 d
where pay < ( select 
                    MIN( pay )
                from ( select
                            AVG(pay) pay
                        from emp2
                        group by deptno) )
AND e.deptno = d.dcode
order by d.dname desc;
