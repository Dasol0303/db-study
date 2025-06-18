/*========== 1번 ==========*/
select * from emp;

select 
    empno,
    ename,
    TO_CHAR((sal * 12) + comm, '99,999') As "SALARY"
from emp
where ename IN ('ALLEN');

/*========== 2번 ==========*/
select * from emp;

select 
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD') As "HIREDATE",
    TO_CHAR((sal * 12) + comm, '$999,999') As "SALARY",
    '$' || TO_CHAR(((sal * 12) + comm) + (((sal * 12) + comm) * 0.15), 'fm999,999') As "15%인상"
    -- 'fm999,999' => fm은 공백을 없애주겠다는 의미인듯!
from emp
where comm is not null;

