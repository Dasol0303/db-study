/*========= 1번 =========*/
select * from student;

select 
    name As "이름", 
    LPAD (REPLACE (birthday, '/', ''), 2, 0) As "년도",
    SUBSTR (REPLACE (birthday, '/', ''), 3, 2) As "월",
    SUBSTR (REPLACE (birthday, '/', ''), 5, 2) As "일"
from student;

/*========= 2번 =========*/
select 
    name, 
    tel,
    INSTR(tel, ')') As "괄호위치"
from student
where deptno1 IN (201);


/*========= 3번 =========*/
select 
    name, 
    tel,
--    INSTR(tel, '3') As "괄호위치" 
    INSTR(tel, '3') As "3의 위치" 
    -- 3이 있는 tel 먼저 찾고 적용!!
from student
where deptno1 IN (101);


/*========= 4번 =========*/
select 
    name, 
    tel,
    REPLACE (SUBSTR(tel, 1, 3), ')', '') As "지역번호",
    SUBSTR (tel, 1, INSTR (tel, ')')-1 ) As "쌤 풀이"
from student
where deptno1 IN (201);





