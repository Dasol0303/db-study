/*=========== 1번 ===========*/
select 
    studno As "번호", 
    name As "이름", 
    id As "아이디"
from student
where height BETWEEN 160 AND 175
UNION ALL
select 
    deptno,
    name,
    id
from professor
where deptno IN (101,102,103,201) AND bonus is null;


/*=========== 2번 ===========*/
select * from student;

select  
    '이름:' || name As "이름",
    '아이디:' || id As "아이디",
    '주민번호:' || 
    SUBSTR (jumin, 1, 6) || '-' || SUBSTR (jumin, 7)
    As "주민번호"
from student;





