/*********************************************/
기타 복수행 함수

-- 부서와 직업별 평균 급여 및 사원수
select deptno, job, AVG(sal), COUNT(*)
from emp
group by deptno, job;


-- 부서별 평균 급여와 사원수
select deptno, AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp
group by deptno;


-- 전체 사원의 평균 급여와 사원수
select AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp;

-----------------------------------------------------------------------------------

select deptno, job, AVG(sal), COUNT(*)
from emp
group by deptno, job
UNION ALL
select deptno, null, AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp
group by deptno
UNION ALL
select null, null, AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp
order by deptno, 2;


select deptno, job, AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp
--group by ROLLUP(deptno, job);
--group by ROLLUP(job, deptno);
group by ROLLUP( (job, deptno) );
-- ROLLUP 없이 사용하면 오류! 근데 또 위에 UNION ALL로 묶어서 보는 것보다 더 간단해짐!!

-----------------------------------------------------------------------------------

-- 숫자는 처리되는 순서!!임!!
group by ROLLUP(deptno, job); -- 뒤에서부터 하나씩 없어짐!
1) deptno, job 그룹화 데이터  
2) deptno 그룹화 데이터       
3) () 그룹화 데이터           


group by ROLLUP( empno, deptno, job );
1) empno, deptno, job 
2) empno, deptno
3) empno
4) ()


group by ROLLUP( empno, (deptno, job) ); -- 괄호를 통해서 내가 한 번에 없어질게 뭐다! 를 알 수 있음!!
1) empno, deptno, job 
2) empno
3) ()



select deptno, job, AVG(sal) As "평균급여", COUNT(*) As "사원수"
from emp
group by CUBE(deptno, job);



순위 RANK()   OVER (order by 정렬기준대상)
그룹단위 순위 RANK() OVER (partition by 기준 order by 정렬기준대상)
DENSE_RANK()
                        -- group by

select 
    ename,
    sal,
    RANK() OVER (order by sal desc) As "급여순위", -- desc => 사용한 이유는 사용 안하면 급여 적은 사람이 1위가 되어서!
    DENSE_RANK() OVER (order by sal desc) As "급여순위"
    -- 공동을 구분하냐 안하냐의 차이! (공동이 있으면 다음 순위가 자동으로 +1이 되자나~~)
from emp
;
--order by sal;


select
    name,
    height,
    RANK() OVER (order by height desc) As "키순위", -- 키 순위()
    DENSE_RANK() OVER (order by height desc) As "키순위", -- 전체 기준!
    grade,
    RANK() OVER (partition by grade order by height desc) As "학년별 순위", -- 학년별 순위()
    DENSE_RANK() OVER (partition by grade order by height desc) As "학년별 순위" -- 전체 기준!
from student
order by grade; -- 학년별로 구분!









