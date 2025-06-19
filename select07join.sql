/*********************************************/
Join

select * from emp;

select * from dept;

-- Join 기준 deptno 가 같은!

--select empno, ename, dname, loc, e.deptno, d.deptno     --, deptno(칼럼 이름이 겹쳐서 오류!)
select e.empno, e.ename, d.dname, d.loc, d.deptno  
--어느 테이블에서 가져온 값인지 정확하게 표기해주는 편이 좋다!
from emp e, dept d
where e.deptno = d.deptno; -- emp에 있는 deptno와 dept에 있는 deptno를 대조해 같은 값을 합쳐주겠다!


select *
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;
-- 작성 방식이 다를 뿐 위랑 같다!


select *
from emp e, dept d; -- join 조건 누락 -> 카티션 곱 발생(양쪽 케이스가 합쳐지는 모든 경우를 나열한 것이란 이야기~)
--where e.deptno = d.deptno;


select * from student;
select * from professor;
--student <-  join(profno) -> professor


--select *
select 
    s.name, p.name, s.studno, p.profno, p.email
from student s, professor p
where s.profno = p.profno;

-- 위랑 같은 결과!
select 
    s.name, p.name, s.studno, p.profno, p.email
from student s INNER JOIN professor p
ON s.profno = p.profno;
-- 허점! => profno가 null인 애들은 제외시킨다!


INNER JOIN, OUTER JOIN
-- outer join => 비교 중 누락된 값으로 제외된 친구들을 제외시키지 않는다!

select COUNT(*) from student;
select * from student;


select *
from student s, professor p
--where s.profno = p.profno(+); -- (+) => outer join 하겠다는 의미!
--where p.profno = s.profno(+); -- 밑에 outer join처럼 방향 바꿔서 기준점 바꾸는 로직
where p.profno(+) = s.profno; -- 플러스 기호 위치에 따라서도 기준점 바꾸기 가능!

select *
from student s LEFT OUTER JOIN professor p 
--from student s RIGHT OUTER JOIN professor p 
--from professor p LEFT OUTER JOIN student s 
--from professor p RIGHT OUTER JOIN student s 
-- outer join을 쓰려면 left, right 중 기준이 되는 친구를 하나 정해줘야 함! 방향 정해주기!
ON s.profno = p.profno;


select COUNT(*) from professor; -- 16명

select
    s.name, p.name, s.studno, p.profno, p.email
from professor p, student s
where p.profno = s.profno(+);


/* 작은 문제 1 */
select * from student;
select * from professor;

-- INNER JOIN
select 
    s.name As "STU_NAME",
    p.profno As "PROFNO",
    p.name As "PROF_NAME"
from student s INNER JOIN professor p
ON s.profno =  p.profno;

-- where
select 
    s.name As "STU_NAME",
    p.profno As "PROFNO",
    p.name As "PROF_NAME"
from student s, professor p
where s.profno =  p.profno;

-------------다른 풀이~-------------
select s.name, p.profno, p.name
from student s, professor p
where s.deptno1 = 101
AND s.profno = p.profno;



/* 작은 문제 2 */
select * from student;
select * from department;
select * from professor;


select 
    s.name,
    d.dname,
    p.name
from student s, professor p, department d
where s.profno = p.profno AND s.deptno1 = d.deptno;

--------------------INNER JOIN--------------------------
select 
    s.name,
    d.dname,
    p.name
from 
    student s 
    INNER JOIN professor p 
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;
    

-- 1) 학생명, 학생의 학과명, 교수명
select * from student;
select * from professor;
select * from department;

select 
    s.name,
    s.deptno1,
    d.dname,
    p.name,
    p.deptno
from student s, professor p, department d
where s.profno = p.profno
AND d.deptno = s.deptno1;


-- 2) 학생명, 교수의 학과명, 교수명
select 
    s.name,
    s.deptno1,
    d.dname,
    p.name,
    p.deptno
from student s, professor p, department d
where s.profno = p.profno
AND d.deptno = p.deptno;
--AND s.deptno1 <> p.deptno;


-- 3) 학생명, 학생 학과번호, 학생의 학과명, 교수명, 교수학과번호, 교수의 학과명
select 
    s.name,
    s.deptno1,
    ds.dname,
    p.name,
    p.deptno,
    dp.dname
from student s, professor p, department dp, department ds
where s.profno = p.profno
    AND dp.deptno = p.deptno -- 학과 <-> 교수
    AND ds.deptno = s.deptno1;-- 학과 <-> 학생

select 
    s.name,
    s.deptno1,
    s.profno,
    d.dname,
    p.name,
    p.deptno,
    p.profno
from student s, professor p, department d
where s.profno = p.profno
AND d.deptno = p.deptno
AND d.deptno = s.deptno1;



/*********************************************/
비등가 Join

select * from customer;
select * from gift;

select * 
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end;
-- where ~ => 요 줄에 있는 식을 비등가?라고 하는 듯??

select * from hakjum;



Self Join

select * from emp;


select *
from emp e1, emp e2
where e1.mgr = e2.empno; -- 이런식으로연ㄹㅇ결이될ㄴ것ㅇ닏나아ㅏ...................졸ㄹㅈ렺워ㅠㅠㅠ

select * from emp2;

select A.empno As "내사번", A.name As "내이름", A.pempno As "상사사번", B.name As "상사이름"
from emp2 A, emp2 B
where A.pempno = B.empno;

