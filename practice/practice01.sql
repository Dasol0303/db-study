select * from student;

select 
 name || '''s ID : ' || ID || ', WEIGHT is ' || weight || 'kg' AS "ID AND WEIGHT"
from student;


/*==========================================================*/
select * from emp;

select 
 ename || '(' || job || ') , ' || ename || '''' || job || '''' AS "NAME AND JOB"
from emp;

/*==========================================================*/
select * from emp;

select 
 ename || '''s sal is $' || sal AS "Name and Sal"
from emp;