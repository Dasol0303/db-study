/* 1번 */
select * from professor;

select 
    profno,
    name,
    pay,
    bonus,
    TO_CHAR((pay*12+NVL(bonus, 0)), '999,999') As "TOTAL"
from professor
where deptno IN (201);


/* 2번 */
select * from emp;

select 
    empno,
    ename,
    comm,
    NVL2(comm, 'Exist', 'NULL') As "NVL2"
from emp
where deptno IN (30);


/* 2번 - 스스로 학습~ 번외루~ */
-- ** 범위 지정은 case로!!!!
select * from emp;

select 
    empno,
    ename,
    comm,
    CASE
        WHEN comm >= 0 THEN 'Exist'
        WHEN comm is null THEN 'NULL'
    END As "NVL2"
from emp
where deptno IN (30);

