/********************************************************************/
일반함수

NVL
값이 null일 때 기본값(처리할 값)

select 
    sal,
    comm,
    (sal*12)+comm, -- 이렇게만 쓰면 null값은 여전히 null 값이 나옴
    (sal*12)+NVL(comm, 0) As "NVL사용"-- (comm, 0)=> null값이 있으면 null값을 0으로 치환하겠다~
from emp;


select
    sal*12+comm As "NVL미사용"
from emp
where comm is not null
UNION ALL
select
    sal*12 As "NVL미사용"
from emp
where comm is null;


select NVL(123, 0), NVL(null, 0) from dual;



NVL2

select
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '없다') As "NVL2(null, '있다', '없다')"
    -- NVL2 => 삼항연산자랑 비슷!   (조건식) ? true:false
from dual;


DECODE

DECODE(10, 10, DECODE(10, 10, '같다', DECODE(10, 10, '같다', '다르다')), '다르다')
-- DECODE도 삼항연산자처럼 중첩이 가능하다!!

select
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 10, '같다'),
    DECODE(10, 20, '같다'), -- '같다' 뒤에 null이 있는 형태
    DECODE(10, 20, '같다', null),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', '아니다'),
    --    (10, 20, '20이다', ~ 요기에서 10이 있는 자리가 기준! 10이랑 비교해서 순번에 맞춰서 인식한 후 맞는 쪽 출력해줌!
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다'),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', null),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', null)
from dual;
-- 비교식이랑 삼항연산자랑 합쳐진 느낌?

select 
    name,
    deptno,
    DECODE(deptno, 101, '컴공', 102, '전기', 103, '기계', 201, '물리', '그 외 문과') As "전공",
    '전공학과: ' || DECODE(deptno, 101, '컴공', 102, '전기', 103, '기계', 201, '물리', '그 외 문과') As "전공02"
from professor;


CASE 문 

select 
    grade || '학년'
from student;

-- 1,2 저학년  3,4 고학년
select
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년', '없음. 1~4여야하는데...') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        --WHEN 1,2 THEN '저학년' => 오류!
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
       --ELSE '그 외' 
    END 고저구분,
    
    CASE
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END As "범위로구분"
    
from student;

