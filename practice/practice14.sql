/* 1번 */
select * from emp;

select 
    deptno As "부서번호",
    AVG(sal) As "평균급여"
from emp
group by deptno
having AVG(sal) >= 2000;


/* 2번 */
select * from panmae;

select 
    p_date As "판매일자",
    SUM(p_qty) As "판매수량",
    SUM(p_total) As "판매금액"
from panmae
group by p_date;


/* 3번 */
select * from panmae;

select 
    p_date As "판매일자",
    p_code As "상품코드",
    SUM(p_qty) As "판매수량",
    SUM(p_total) As "판매금액"
from panmae
group by ROLLUP ( p_date, p_code );






