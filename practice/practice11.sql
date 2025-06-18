select * from emp;

select 
    ROUND(AVG(sal), 4) As "전체 sal급여 평균" 
from emp;


select 
    ROUND(AVG(sal), 4) As "30번부서사람들 평균급여"
from emp
where deptno IN (30);


select 
    deptno,
    ROUND(AVG(sal), 4) As "각부서별 평균 급여"
from emp
group by deptno
order by deptno;


select 
    deptno,
    COUNT(*) As "각부서별 인원",
    ROUND(AVG(sal), 4) As "각부서별 평균 급여",
    TRUNC(AVG(sal), 4) As "각부서별 평균 급여02"
from emp
group by deptno
order by deptno;


select 
    job,
    ROUND(AVG(sal), 4) As "각 직업별 평균 급여"
from emp
group by job
order by job;


select 
    job,
    MAX(sal) As "각 직업별 가장 높은 급여 얼마?"
from emp
group by job
order by job;


select 
    deptno,
    MAX(sal) As "각 부서별 가장 높은 급여 얼마?"
from emp
group by deptno
order by deptno;


/* 합쳐보기!! */
select 
    deptno,
    job,
    -- 1번 문제는 안합쳐진다ㅠ
    ROUND(AVG(sal), 4) As "30번부서사람들 평균급여",
    COUNT(deptno) As "각부서별 인원",
    ROUND(AVG(sal), 4) As "각부서별 평균 급여",
    ROUND(AVG(sal), 4) As "각 직업별 평균 급여",
    MAX(sal) As "각 직업별 가장 높은 급여 얼마?",
    MAX(sal) As "각 부서별 가장 높은 급여 얼마?"
from emp
group by deptno, job
order by deptno, job;








