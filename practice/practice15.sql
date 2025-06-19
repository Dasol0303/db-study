/* 1번 */
select * from student;
select * from score;
select * from hakjum;

select 
    stu.studno As "학번",
    stu.name As "이름",
    s.total As "점수",
    h.grade As "학점"
from student stu, score s, hakjum h
where 
    stu.studno = s.studno
    AND s.total BETWEEN h.min_point AND h.max_point
order by total desc;


/* 2번 */
select * from student;
select * from score;
select * from hakjum;

select 
    stu.studno As "학번",
    stu.name As "이름",
    s.total As "점수",
    h.grade As "학점"
from student stu, score s, hakjum h
where
    stu.deptno1 IN (101, 102)
    AND stu.studno = s.studno
    AND s.total BETWEEN h.min_point AND h.max_point
order by s.total desc;





/* 3번 */
select * from student;
select * from department;
select * from professor;

select 
    s.name,
    s.grade,
    p.name,
    p.deptno,
    d.dname
from professor p , student s, department d
where 
    s.profno = p.profno
    AND p.deptno != 301     -- 제외할 거 제외하고
    AND p.deptno = d.deptno;    -- 연결해주기!




