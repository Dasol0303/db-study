/* 1번 */
select * from professor;


select 
    deptno,
    name,
    DECODE(deptno, 101, DECODE(name, 'Audie Murphy', 'BEST!')) As "DECODE"
from professor;


/* 2번 */
select * from professor;

select 
    deptno,
    name,
    DECODE(deptno, 101, DECODE(name, 'Audie Murphy', 'BEST!', 'GOOD!')) As "비고"
from professor;


/* 3번 */
select * from professor;

select 
    deptno,
    name,
    DECODE(deptno, 101, DECODE(name, 'Audie Murphy', 'BEST!', 'GOOD!'), 'N/ A') As "비고"
from professor;


/* 4번 */
select * from student;

select 
    name,
    jumin,
    DECODE(SUBSTR(jumin, 7, 1) , 1, '남자', 2, '여자') As "성별"
from student
where deptno1 IN (101);

/* 5번 */
select * from student;

select 
    name,
    tel,
    -- DECODE
    DECODE( INSTR(tel, ')'), 
        3,DECODE(REPLACE(SUBSTR(tel, 1, 3), ')', ''), 02, '서울'), 
        4, DECODE(SUBSTR(tel, 1, 3), 031, '경기', 051, '부산', 052, '울산', 055, '경남'))  As "지역명",
    DECODE(SUBSTR(tel, 1, 3), '02)', '서울', '경남') As "지역명02",
    -- CASE
    CASE SUBSTR(tel, 1, INSTR(tel, ')')-1)
        WHEN '02' THEN '서울'
        WHEN '031' THEN '경기'
        WHEN '055' THEN '경남'
        WHEN '051' THEN '부산'
        WHEN '052' THEN '울산'
    END As "지역명 03"
from student
where deptno1 IN (101);
