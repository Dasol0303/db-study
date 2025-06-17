
/*********************************************/
단일행 함수

select * from dual;
dual : 더미 데이터가 들어있는 임시로 사용하는 테이블

select INITCAP('abc') from dual;

select ename, INITCAP(ename)
from emp;

select name, LOWER(name), UPPER(name) -- 소문자, 대문자 바꾸기! 
from student;

select name, LENGTH (name)
from student;

select LENGTH('asdoijf'), LENGTHB('asdoijf'),
        LENGTH('한글'), LENGTHB('한글') -- 한글 한글자 3byte
from dual; -- 글자 길이 세어주는 기능!!

--이름이 알파벳 5자 이상만 조회
select * 
from emp
where LENGTH(ename) >= 5; -- ename의 글자수를 센 후 비교식으로 원하는 값 뽑아내기!!

select '아침' || '점심', CONCAT('아침', '점심')
from dual;

select '아침' || '점심' || '저녁', CONCAT( CONCAT('아침', '점심'), '저녁') 
from dual;
-- CONCAT('아침', '점심') 앞이랑 뒤랑 이어붙이겠다는 의미로 2개까지만 사용가능!

-- SUBSTR(대상값/컬럼명, 시작지점(1~), 자릿수)
select
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -4, 2) -- 마이너스는 뒤부터 자릿수 뽑는 의미!! (숫자를 앞이 아니라 뒤에서부터 세기 시작)
from dual;

-- INSTR (대상값/칼럼명, 찾는값)
-- INSTR (대상값/칼럼명, 찾는값, 시작위치)
-- INSTR (대상값/칼럼명, 찾는값, 시작위치, 몇번째값)
select
    INSTR ('2025-06-01 10:25:48', '-'),
    INSTR ('2025-06-01 10:25:48', ':'),
    INSTR ('2025-06-01 10:25:48', '-', 7), -- 7번째 글자부터 -가 몇 번째 숫자인지를 뽑겠다!!
    INSTR ('2025-06-01 10:25:48', ':', 15),
    INSTR ('2025-06-01 10:25:48', '-', 1, 2)
from dual;

select 
    tel,
    INSTR(tel, ')')
from student;   -- 010-1234-5678    055)381-2158 (지역번호 표기)


select
    LPAD('문자', 10, '-'), -- 10자리를 채우기 위해 지정 문자 앞에 -를 지정 갯수대로 채우겠다!!
    RPAD('123', 6, '*'), -- 6자리를 채우기 위해 지정 문자 뒤에 *을 지정 갯수대로 채우겠다!!
    LPAD(5, 2, 0),
    LPAD(15, 2, 0) -- 2자릿수 뽑기!!
from dual;


-- TRIM 공백제거
select
    '*' || LTRIM(' abcd ') || '*',
    '*' || RTRIM(' abcd ') || '*',
    TRIM(' abcd '),
    LTRIM('*abcd*', '*') 
-- 특정 문자 지정해서 없애기
from dual;

select
    REPLACE('abcd', 'c', '/')
-- 지정한 문자 바꾸기!!
from dual;

select 
    birthday,
    REPLACE(birthday, '/', '$')
from student;


/*********************************************/
--숫자

select
    ROUND(1.67),    --반올림
    ROUND(1.67, 1),  --소숫점 첫번째 자릿수까지 반올림을 하겠다!!
    ROUND(1.64578, 3),
    ROUND(1.64578, 0),
    ROUND(357.123, -1),  --60.12 기준 0 => 0 / 6 => -1 / 1=> 1
    TRUNC(1.456),    --버림
    TRUNC(1.456, 2),
    MOD(15, 4),      --나머지   
    CEIL(123.123),   --인접 큰 정수
    FLOOR(123.123),  --인접 작은 정수
    POWER(6, 3)      -- 6의 3제곱(6*6*6)
from dual;

select 
    rownum, -- 행 번호
    CEIL(rownum/3) As "그룹번호",   --1/3 = 0.33... 2/3 = 0.66...   3/3 = 1
                                   --4/3 = 1.33...->2  5/3 = 1.66->2   6/3 = 2
    CEIL(rownum/4) As "팀구분",
    empno, 
    ename 
from emp;
--where rownum <= 5;


/*********************************************/
--날짜

select
    null,
    SYSDATE,    --현재날짜
    SYSTIMESTAMP,    --현재날짜시간
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'), --앞 날짜에서 뒤 날짜를 뺀 값을 month로 환산
    MONTHS_BETWEEN('2024-11-05', '2024-06-21'),  -- 4.5개월?
    ADD_MONTHS(SYSDATE, 3)
from dual;


select
    ADD_MONTHS(SYSDATE, 3),
    ADD_MONTHS(SYSDATE, -8),
    LAST_DAY(SYSDATE),       -- 30 31 28 29 (마지막 날이 달마다 다름)
    NEXT_DAY(SYSDATE, '수'), -- 작성 시점의 날 기준으로 가장 가까운 날짜를 찾아주는 듯?
    NEXT_DAY(SYSDATE, '토')
from dual;

select
    SYSDATE,
    ROUND(SYSDATE), --작성 시점의 날 기준 다음날
    TRUNC(SYSDATE),  --작성 시점의 날 기준 당일?
    TRUNC(SYSDATE, 'DD'),    --Year Month Day / DD => Day 기준으로 버리겠다!
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE + 7, -- 일자 단위로 플러스
    --다음달의 첫날
    TRUNC (ADD_MONTHS(SYSDATE, 1), 'MM'),
    LAST_DAY(SYSDATE)+1, -- 마지막 날에서 하루 더하기
    --전월의 마지막 날
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
    TRUNC(SYSDATE, 'MM')-1 --다음 달에서 하루 빼기
from dual;











