/*========== 1번 ==========*/
select * from student;

select 
    studno,
    name,
    TO_CHAR(birthday, 'YYYY-MM-DD')
from student
where TO_CHAR(birthday, 'MM') = 1;

/*========== 2번 ==========*/
select * from emp;

select 
    empno,
    ename,
    hiredate
from emp
where (TO_CHAR(hiredate, 'MM')) = 1
UNION ALL
select 
    empno,
    ename,
    hiredate
from emp
where (TO_CHAR(hiredate, 'MM')) = 2
UNION ALL
select 
    empno,
    ename,
    hiredate
from emp
where (TO_CHAR(hiredate, 'MM')) = 3
order by ename asc, hiredate desc;


/*========== 2번 쌤 풀이 ==========*/
-- 1)
select * from emp;

select 
    empno,
    ename,
    hiredate
from emp
where TO_CHAR(hiredate, 'MM') IN ('01', '02', '03');

-- 2)
select * from emp;

select 
    empno,
    ename,
    hiredate
from emp
where 
    TO_CHAR(hiredate, 'MM') = '01'
    OR TO_CHAR(hiredate, 'MM') = '02'
    OR TO_CHAR(hiredate, 'MM') = '03'
;




