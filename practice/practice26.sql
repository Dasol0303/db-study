/*
1. 다음 두 명령어는 어떤 기능을 수행하는 명령어인지 작성하고,
두 기능의 차이점이 있다면 설명하시오.

DELETE FROM 테이블명;
=> 테이블 내부의 행을 모두 삭제하는 기능, 테이블 자체는 존재
=> rollback 가능

TRUNCATE TABLE 테이블명;
=> 테이블 내부의 행을 모두 삭제하는 기능, 테이블 자체는 존재
=> rollback 불가능
*/


/* 2번 */
CREATE TABLE T_MEMBER_POINT
(
    id NUMBER(6),
    no NUMBER(6),
    member_id VARCHAR2(24) NOT NULL,
    member_point NUMBER(3),
    member_date DATE DEFAULT (SYSDATE),
    CONSTRAINT t_member_point_pk PRIMARY KEY (id, no)
);

select * from T_MEMBER_POINT;


/* 3번 */
CREATE SEQUENCE T_MEMBER_POINT_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE;


/* 4번 */

--select T_MEMBER_POINT_PK_SEQ.nextval from ( select MAX(no) from T_MEMBER_POINT where id = 1 );
--select (select no from T_MEMBER_POINT_PK_SEQ where id = 1).nextval from dual;
--select T_MEMBER_POINT_PK_SEQ.nextval from dual where id = 1;



INSERT INTO T_MEMBER_POINT VALUES ( T_MEMBER_POINT_PK_SEQ.nextval, 
                                    (select NVL(MAX(no), 0) + 1 from T_MEMBER_POINT where member_id = '김씌'), 
                                    '김씌', 90, TO_DATE('2025-03-25'));
INSERT INTO T_MEMBER_POINT VALUES ( T_MEMBER_POINT_PK_SEQ.nextval, 
                                    (select NVL(MAX(no), 0) + 1 from T_MEMBER_POINT where member_id = '이씌'), 
                                    '이씌', 80, SYSDATE );
INSERT INTO T_MEMBER_POINT VALUES ( T_MEMBER_POINT_PK_SEQ.nextval, 
                                    (select NVL(MAX(no), 0) + 1 from T_MEMBER_POINT where member_id = '학쒸'), 
                                    '학쒸', 0, SYSDATE );


select * from T_MEMBER_POINT;



--악! 실수!! 삭제하고 다시하자ㅠㅠ
DROP SEQUENCE T_MEMBER_POINT_PK_SEQ;
DELETE FROM T_MEMBER_POINT;
DROP TABLE T_MEMBER_POINT;

