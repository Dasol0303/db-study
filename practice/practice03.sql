/*=======1번========*/
select deptno As "부서번호", dname As "부서이름", loc As "위치"
from dept;

/*=======2번========*/
select * from professor;

select name || '(' || id || ')' As "교수정보", position, hiredate As "입사일자", email As "이메일"
from professor;


