select * from emp2;

select 
    empno As "사번",
    name  As "이름",
    birthday  As "생년월일",
    hobby As "취미",
    pay As "급여",
    pay * 1.5 As "성과급",
    REPLACE(SUBSTR(emp_type, 1, 9), ' e', '') || ' family' As "직원 분류",
    tel,
    CASE
        WHEN pay > 35000001 AND pay <= 4500000 THEN '하'
        WHEN pay > 45000001 AND pay <= 60000000 THEN '중'  
        WHEN pay > 60000001 THEN '상'
        ELSE '화이팅'
    END As "급여수준"

from emp2
where  
    TO_CHAR(birthday, 'YY') BETWEEN 70 AND 79
    AND SUBSTR(tel, 1, 3) IN ('02)', 031);
