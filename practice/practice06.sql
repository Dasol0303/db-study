/*=========== 1번 ===========*/
select * from emp;

select 
    ename, 
    REPLACE ( ename, SUBSTR (ename, 3, 2), '--' ) As "REPLACE"
from emp
where deptno = 20;


/*=========== 2번 ===========*/
select * from student;

select 
    name, 
    REPLACE (jumin, SUBSTR (jumin, 7, 7), '-/-/-/-') As "주민뒷자리숨김"
from student
where deptno1 = 101;


/*=========== 3번 ===========*/
select * from student;

select 
    name,
    tel,
    REPLACE (tel, SUBSTR(tel, 5, 3), '***') As "REPLACE",
    SUBSTR (tel, 1, 4) || '***' || SUBSTR (tel, 8, 5) As "REPLACE2",
    SUBSTR (tel, 1, 4) || '***' || SUBSTR (tel, -5, 5) As "REPLACE3",
    CONCAT (CONCAT (SUBSTR (tel, 1, 4), '***'), SUBSTR (tel, -5, 5)) As "REPLACE4"
from student
where deptno1 = 102;


/*=========== 4번 ===========*/
select * from student;

select 
    name,
    tel,
    REPLACE (tel, SUBSTR(tel, 9, 4), '****') As "REPLACE",
    SUBSTR(tel, 1, 8) || '****' As "REPLACE2"
from student
where deptno1 = 101;


/*=========== 응용 ===========*/
select * from student;

select 
    name,
    tel,
    -- REPLACE (tel, SUBSTR(tel, 9, 4), '****') As "REPLACE",
    INSTR (tel, ')') 괄호위치,
    INSTR (tel, '-') 빼기위치,
    INSTR (tel, '-') - INSTR (tel, ')') - 1 가운데자리수길이,
    SUBSTR(tel, INSTR(tel, ')') + 1, INSTR (tel, '-') - INSTR (tel, ')') - 1) 가운데자리,
    SUBSTR(tel, 1, INSTR(tel, ')'))
    || LPAD('*', INSTR (tel, '-') - INSTR (tel, ')') - 1, '*')
    || SUBSTR(tel, -5, 5) As "가운데 자리에 별표 넣기"
    
from student;

-- 지정 갯수대로 문자넣기
select LPAD('*', 4, '*')
from dual;

select LPAD('*', 3, '*') -- 앞에 *문자를 하나 넣어주는 이유 : 아무것도 안넣으면 null로 인식되기 때문에 아무거나 넣음!
from dual;


select
    name,
    tel,
    ')까지' || '***' || '뒷자리'
from student
where (INSTR(tel, '-') - INSTR(tel, ')') - 1) = 3
UNION ALL
select
    name,
    tel,
    ')까지' || '****' || '-뒷자리'
from student
where (INSTR(tel, '-') - INSTR(tel, ')') - 1) = 4;
