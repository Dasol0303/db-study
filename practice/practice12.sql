/* 1번 */
select * from student;

select 
    name,
    jumin,
    birthday,
    TO_CHAR(birthday, 'MM') As "월",
    CASE
        WHEN TO_CHAR(birthday, 'MM') >= 1 AND TO_CHAR(birthday, 'MM') <= 3 THEN '1분기'
        WHEN TO_CHAR(birthday, 'MM') >= 4 AND TO_CHAR(birthday, 'MM') <= 6 THEN '2분기'
        WHEN TO_CHAR(birthday, 'MM') >= 7 AND TO_CHAR(birthday, 'MM') <= 9 THEN '3분기'
        WHEN TO_CHAR(birthday, 'MM') >= 10 AND TO_CHAR(birthday, 'MM') <= 12 THEN '4분기'
    END As "분기"
from student;



/* 2번 */
select * from emp;

select 
    empno,
    ename,
    sal,
    CASE 
        WHEN sal >= 1 AND sal < 1001 THEN 'Level 1'
        WHEN sal >= 1001 AND sal <= 2000 THEN 'Level 2'
        WHEN sal >= 2001 AND sal <= 3000 THEN 'Level 3'
        WHEN sal >= 3001 AND sal <= 4000 THEN 'Level 4'
        WHEN sal > 4001 THEN 'Level 5'
    END As "급여등급"
from emp;

