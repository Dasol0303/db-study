
/********************************************************************/
1. 조회하기 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;
* : 전체 ALL

select * from dept;
SELECT * FROM DEPT;
--대소문자 상관없이 인식 가능!!

테이블 구조 확인 (Describe)
DESC 테이블명;

desc dept;



select * from fruit;
select * from loan;
select * from product; --product 테이블에 있는 모든 컬럼 데이터 조회

select * from emp;
select mgr, hiredate from emp; --emp 테이블에서 mgr, hiredate 컬럼만 조회

-- 가독성
SELECT * 
FROM emp;
--All(*) 한 번 날려보고 조회할 세부사항 고르기!!

SELECT
    empno,
    ename,
    comm
FROM emp;

DESC emp;

/********************************************************************/
--컬럼명 별도로 지정하기 (컬럼 별칭)
SELECT 컬럼명 AS "컬럼별칭",
       컬럼명 "컬럼별칭",
       컬러명 컬럼별칭
FROM 테이블명;

select empno AS "사원번호", --empno employeaNumber
       ename "사원이름", 
       job 직업,
       sal "급여 데이터" --별칭에 띄어쓰기를 포함하고 싶으면 ""로!! 근데 거의 안씀! 띄어쓰기를 잘 안해서
from emp;


/********************************************************************/
--조회 데이터 리터럴 값 활용
select '문자', 12313 FROM 테이블명; --문자는 작은 따옴표로 감싸주기! ''
select '문자', 12313 FROM dual; --dual 임시테이블
select '문자 테스트' AS "문자확인컬럼헤더", 123+123 연산결과 from dual;

select '이것은 문자', 12313, loc, dname from dept;
select '안녕' from emp;

-- 요 부분은 사실상 사용할 일이 없다아~
select '"문자"' from dual;
select '문자''작은따옴표' from dual;
select q'[여기 안에다가 문자를 " 입력 ' 하면 ' 됩니다]' from dual;


/********************************************************************/
--DISTINCT 중복제거
select * from emp;
select DISTINCT job from emp; --job 중복제거
select DISTINCT (job) from emp; --job 을 괄호 안에 넣을 수도 있다! 두 가지 방법이 있다우

select distinct deptno from emp;
select DISTINCT deptno, job from emp; --여러개 컬럼 조합해서 중복 제거

select DISTINCT(job), sal from emp; --두개 컬럼 조합 중복제거 : job을 sal에 합쳐서 중복제거하겠다! 라는 의미
select DISTINCT job, sal from emp; --위랑 같은 결과
select job, sal from emp;



/********************************************************************/
-- || 연결연산자 앞뒤로 이어붙이기
SELECT '오늘' || '너무덥다' FROM dual;

select '부서번호:' || deptno AS "부서번호" from dept; -- 깔끔하게 AS로 목차? 쪽 이름도 바꾸기 ㅎㅎ

select '부서번호:' || (deptno+100) AS "부서번호" from dept; --우선순위를 정해줘서 더하기를 괄호로 감쌈
-- 숫자 타입 확인하기 : 옆에 테이블에 들어가서 DATA_TYPE 확인하기! (숫자: number)
-- 빠르게 확인하기 : 테이블명; 이 있는 곳에 마우스 커서 두고 shift + F4 누르기 


/********************************************************************/
조건 WHERE 절
필터링, 찾으려고 하는 조건

SELECT ...
FROM ...
WHERE ...
;


select *
from emp;

select *
from emp
where sal > 2500; -- sal 중 2500 초과하는 직원의 모든 정보 조회


select ename
from emp
where sal > 2500; -- sal 중 2500 초과하는 직원의 이름을 조회

select *
from emp
where job = 'SALESMAN';

select *
from emp
where deptno = 10;

select *
from emp
where deptno <> 10; --다르다는 의미! (!=랑 같은 의미!!)
--where deptno != 10;


select * 
from student   --50~70kg 조회
--where weight >= 50 AND weight <= 70;
where weight BETWEEN 50 AND 70; -- 부등호를 사용하지 않아도 between으로 대체 가능!

select *    --1~3학년만 조회
from student
--where grade >=1 AND grade <= 3;
--where grade BETWEEN 1 AND 3;
--where grade = 1 OR grade = 2 OR grade = 3;
--where grade <> 4;   -- grade != 4
where grade IN (1,2,3); -- 여기있는 1,2,3만 보겠다!

-- 2학년 4학년만 조회
select * 
from student
--where grade IN (2,4);
--where grade = 2 OR grade = 4;
--where grade != 1 AND grade <> 3;
where grade NOT IN (1,3); -- () 안에 있지 않은 것 출력!


/********************************************************************/
LIKE 패턴 검색(문자)
    % : 아무갯수나 들어올 수 있음 0~n 개
    _ : 그 위치에 한개를 나타냄
    
select * 
from emp
--where ename LIKE '%M%'; -- 어느 위치에 있는 m인지 상관없이 이름에 m이 들어가있으면 다 나온다!!
--where ename LIKE 'M%'; --첫 글자가 m으로 시작하면서 그 뒤에 알파벳이 얼마나 들어오든 상관없다!! 
--where ename LIKE '%M'
--where ename LIKE '_M%';   -- SMITH
where ename LIKE '__M%';    -- JAMES



select * from emp
--where comm is null; -- ~ = null 이 아니라 is null 혹은 is not null의 형태로 작성해야 한다!!
where comm is not null;

select * 
from emp
--where hiredate = '81/05/01'
--where hiredate = '1981-05-01' -- YYYY-MM-DD(이렇게 입력해도 같다고 인식!!)-> DATE 타입이기 때문에~
where hiredate <= '1981-05-01';




/********************************************************************/
정렬 ORDER BY
* 정렬을 명시하지 않으면 순서보장X
ORDER BY 정렬기준 컬럼명 [ASC|DESC] [오름차순|내림차순]

--순서!
SELECT ...
FROM ...
WHERE ...
ORDER BY ...

--where 가 없으면
SELECT ...
FROM ...
ORDER BY ...
;


select * 
from student
--order by name; -- 기본 오름차순
order by name asc; -- 기본이 오름차순이라 잘 안씀!

select * 
from student
order by name desc; -- 내림차순 

-- 학년 기준 내림차순 -> 이름, 학년만 보여주기!
select name, grade 
from student
order by grade desc;

--1,2,3 학년 중에 키순으로 내림차순 정렬
select *
from student
where grade IN (1,2,3)
order by height desc;

--1,2,3 학년 중에 각 학년 별(오름차순/내림차순) 키순으로 내림차순 정렬
select *
from student
where grade IN (1,2,3)
order by grade desc, height;

select *
from student
where grade IN (1,2,3)
order by height, grade desc;

select * 
from student
order by birthday desc;



/********************************************************************/
집합연산자
UNION 합집합 (합치고 중복제거)
UNION ALL 합집합 (전부 다 합치기 중복제거X)
INTERSECT 교집합
MINUS 차집합

    *조건(제약)
        1. 컬럼 갯수 동일
        2. 컬럼 데이터형(타입) 동일
        3. 컬럼명은 달라도 상관없음

--학생들(student) 중 101번 학과 학생과 102번 학과 학생들 모음 조회
select * 
from student
where deptno1 IN (101, 102);

select * 
from student
where deptno1 = 101
UNION ALL
select * 
from student
where deptno1 = 102; -- 두 식을 만들고 그 사이를 합치기!!

--101학과에 속한 학생들과 교수들을 조회
select studno, name, deptno1 
from student
where deptno1 = 101
UNION ALL
select profno, name, deptno -- > 이렇게 쓰면 갯수 충족O!!(순서도 합치려는 식과 같게!!)
from professor
where deptno = 101;
-- student는 12개 professor는 10개라서 갯수 충족X


select studno 식별번호, name, deptno1 학과, tel 연락처   --컬럼별칭 설정
from student
where deptno1 = 101
UNION ALL
select profno, name, deptno, null -- 앞 식에 있는 컬럼명 사용됨!! (studno  name deptno1 tel)
from professor
where deptno = 101  -- 위에는 있고 아래 식에는 없을 때 나타내고 싶으면 없는 쪽에 null 을 줘서 어거지로 맞추기 ㅎ
order by name; -- 정렬 order by


select * 
from student
where deptno1 = 101
INTERSECT   --교집합
select * 
from student
where deptno2 = 201;


select * 
from emp
where job = 'SALESMAN' AND comm > 0
MINUS -- 차집합
select * 
from emp -- 다른테이블 (이전 수상 받은 직원들의 목록) 일 수도 있다!
where hiredate < '1982-01-01';


