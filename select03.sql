/*********************************************/
타입 변환

select 2 + '2' from dual;   --자동변환 (묵시적형변환)
select 2 || '2' from dual;

select 2 + TO_NUMBER('2') from dual;    --명시적 형변환


TO_CHAR
TO_NUMBER
TO_DATE


select
    TO_CHAR(12321),
    TO_CHAR(131.1232),
    SYSDATE,
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
from dual;

-- jumin 문자 SUBSTR
-- birthday 날짜 TO_CHAR
select 
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD')
from student;

select
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    SYSTIMESTAMP,
    TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
from dual;


select
    TO_NUMBER('123')
from dual;

select 
    TO_CHAR(1234, '999999'),
    TO_CHAR(1234, '0999999'),
    TO_CHAR(1234, '$999999'),
    '$' || 1234,
    TO_CHAR(1234, '9999.99'),
    TO_CHAR(1234123, '9,999,999')
from dual;


select
    TO_DATE('2025-01-05') + 3,
    TO_DATE('2025/01/05') + 3,
    TO_DATE('25/01/05') + 3,
    TO_DATE('20250425') + 3,
    LAST_DAY('2025-02-05'),
    LAST_DAY( TO_DATE('2025-02-05') ),
    TO_DATE( '2025-06-15', 'YYYY-MM-DD'),
    TO_DATE( '2025-06-15', 'YYYY/MM/DD'),
    TO_DATE('2025,04,20', 'YYYY,MM,DD') --이건 대신에 두개의 양식이 같아야 함 (앞에 , 썼으면 YYYY MM DD에도 , 써야함!)
from dual;
-- 어지간하면 변환 알아서 잘 해준다~

 




