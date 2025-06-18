/*********************************************/
복수행 함수

COUNT(대상) 갯수세기

select 
    COUNT(*)
from emp;

--식별자 / 기본키(Primary key = PK)
select 
    COUNT(empno),
    COUNT(mgr),
    COUNT(comm), -- null을 제외하고 카운트!
    -- comm => 같이 쓸 수 없음! (칼럼 리스트가 너무 많아서?)
    null -- => 값이 하나인 건 쓸 수 있는 듯!
from emp;

select COUNT(*)
from emp
where comm is not null;
-- 조건 걸어두고 원하는 값 찾아내기! (where 먼저 작성 후 select 작성)

select COUNT(*)
from student
where grade=4; -- ex) 4학년이 몇 명이냐!

select COUNT(empno), SUM(sal)
from emp;

--10, 20부서에 총 몇 명? 총 급여 얼마씩?
select COUNT(empno), SUM(sal)
from emp
where deptno IN (10, 20);

select
    SUM(height),
    AVG(height),
    MAX(height),
    MIN(height),
    ROUND(STDDEV(height), 2), -- 오 응용가능 개꿀 ㅎ
    VARIANCE(height)
from student;


/*********************************************/
GROUP BY 그룹화

그룹화 결과에 대해 조건 -> HAVING

SELECT ... 
FROM ...
WHERE ...
GROUP BY ... 컬럼대상 대상을 기준으로 그룹지어서 계산
            GROUP BY 에 명시한 컬럼은 SELECT 조회에 사용 가능
HAVING
ORDER BY ...

-- 각 학년 별 평균키 (모아서 보고싶다!)

select '1학년', AVG(height)
from student
where grade = 1
UNION ALL
select '2학년', AVG(height)
from student
where grade = 2
UNION ALL
select '3학년', AVG(height)
from student
where grade = 3
UNION ALL
select '4학년', AVG(height) -- grade, AVG(height) => 불가!
from student
where grade = 4;


select 
    -- AVG(grade) || '학년', (된다!!ㅎㅎ)
    grade, -- grop by 를 사용하면 이렇게 쓰는 거 가능!
    AVG(height)
from student
group by grade
order by grade;

select studno, AVG(height)
from student
GROUP BY studno;


select grade, AVG(height) avgh
from student
where grade IN (1,2,3)
group by grade
order by avgh; -- 위에서 정해준 'avgh' 라는 이름 사용 가능! 
--order by 2; -- 2번 기준으로 정렬하겠다
--order by AVG(height) desc;
--order by grade desc;



select deptno, AVg(sal)
from emp
group by deptno
having AVG(sal) >= 2000; -- where하고 다른 개념!


1) 급여가 1600 이상인 직원들 대상, 부서별 평균 급여
select deptno, AVG(sal) 
from emp
where sal >= 1600
group by deptno;
-- 먼저 where로 조건 맞추고(걸러내고) select로 원하는 칼럼 출력 후 group by 설정!

2) 부서별 평균 급여가 1600 이상인 경우, 부서별 평균 급여

select deptno, AVG(sal) 
from emp
--where sal >= 1600
group by deptno
having AVG(sal) >= 1600;


--
학생 각 학년별 평균 몸무게
평균 몸무게 65키로 이상

select grade, AVG(weight)
from student
GROUP BY grade
HAVING AVG(weight) >= 65;

--
학생 4학년을 제외하고 각 학년별 평균 몸무게
평균 몸무게 65키로 이상

select grade, AVG(weight)
from student
where grade != 4 -- where 절로 제외!
GROUP BY grade
HAVING AVG(weight) >= 65;


select deptno, job, AVG(sal), COUNT(*)
from emp
group by deptno, job;







