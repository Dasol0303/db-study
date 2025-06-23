/* 1번 */
select * from student;
select * from department;

select deptno1, MAX(height)
from student
group by deptno1;

select 
    d.dname,
    s.height As "MAX_HEIGHT",
    s.name,
    s.height
from student s, department d
where 
    (deptno1, height)
    IN
    (select deptno1, MAX(height)
    from student
    group by deptno1)
    AND s.deptno1 = d.deptno;

/* 2번 */
select * from student;

select 
    A.grade, 
    A.name, 
    A.height,
    (select AVG(B.height) from student B where B.grade = A.grade) avg_height
from student A
where A.height > (select AVG(B.height) from student B where B.grade = A.grade)
order by A.grade;

select grade, AVG(height) from student group by grade;


select *
from (select grade, AVG(height) from student group by grade) A, student B
where A.grade = B.grade;


