CREATE TABLE T_MENU_12
(
    menu_id NUMBER(3) Primary Key,     
    menu_name VARCHAR2(128) NOT NULL,   
    menu_price NUMBER(10),
    menu_type VARCHAR2(64),
    menu_date DATE
    --개발일자면 칼럼 이름 => dev_date 가 좋을듯!!
);


INSERT ALL
INTO T_MENU_12 VALUES (1, '싸이버거', 6000, '완전식품', SYSDATE)
INTO T_MENU_12 VALUES (2, '콩나물비빔밥', 7000, '탄수화물', SYSDATE)
INTO T_MENU_12 VALUES (3, '닭가슴살', 3000, '단백질', SYSDATE)
INTO T_MENU_12 VALUES (4, '베트남쌀국수', 8000, '탄수화물', SYSDATE)
INTO T_MENU_12 VALUES (5, '라면', 2000, '밀가루', SYSDATE)
select * from dual;


select * from T_MENU_12;


UPDATE T_MENU_12
SET menu_price = 8500
where menu_name = '베트남쌀국수';


select *
--delete
from T_MENU_12
where menu_id = 5;


commit; --기념으로 커밋~ㅎ


