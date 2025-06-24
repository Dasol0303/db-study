/***************************************/
DDL 제약조건 KEY

PK(Primary Key) 기본키
FK(Foreign Key) 외래키
-- 요 두개만 기억하자! 유일한 식별자를 맡아주는 역할

select * from student;  -- => profno -> professor
select * from emp;  -- => deptno -> dept;

CREATE TABLE tt03
(
    no NUMBER(3) PRIMARY KEY, --기본키 세팅! (NOT NULL 하고 UNIQUE가 자동으로 걸림!) => 테이블 당 하나만 설정 가능!
    name VARCHAR2(16) NOT NULL,
    birth DATE 
);

CREATE TABLE tt04
(
    no NUMBER(3) PRIMARY KEY,   --PK 한개만 존재 제약때문에 설정 불가
    id VARCHAR2(32) PRIMARY KEY,   --PK 한개만 존재 제약때문에 설정 불가
    name VARCHAR2(16) NOT NULL,
    birth DATE 
); -- 오류! PRIMARY KEY는 테이블 당 하나만 설정이 가능하기 때문에 오류사항~


CREATE TABLE tt04
(
    no NUMBER(3),
    id VARCHAR2(32),
    name VARCHAR2(16) NOT NULL,
    birth DATE,
    CONSTRAINT tt04_pk PRIMARY KEY (no, id) --두개의 컬럼을 묶어서 PK로 설정
    --PK설정을 한 번 하겠다! > 그런데 컬럼 두 개를 묶어서 하겠따!
);



/***************************************/
외래키 FK : 다른 테이블에 있는 키값을 참조하는 컬럼
            - 참조하는 테이블(부모테이블)에 존재하는 값만 사용 가능(+null)
            - 외래키 설정된 부모테이블에서 자신을 참조하는 사직테이이블의 데이터가 존재하면, 삭제 불가
            
외래키 삭제 조건
ON DELETE CASCADE;  --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터를 NULL 값으로 변경


DROP TABLE T_MEMBER;

CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32)
);
--T_ => TABLE
--V_ => VIEW
CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32),
    --club_id REFERENCES T_CLUB(id)   --외래키 설정 FK
    --club_id REFERENCES T_CLUB(id) ON DELETE CASCADE  --외래키 설정 FK
    club_id REFERENCES T_CLUB(id) ON DELETE SET NULL  --외래키 설정 FK
);

select * from t_club;
INSERT INTO T_CLUB VALUES(1, '독서');
INSERT INTO T_CLUB VALUES(2, '게임');
INSERT INTO T_CLUB VALUES(3, '등산');
INSERT INTO T_CLUB VALUES(4, '낚시');

select * from t_member;
INSERT INTO T_MEMBER VALUES(1, '이름1', 2);
INSERT INTO T_MEMBER VALUES(2, '이름2', 1);
INSERT INTO T_MEMBER VALUES(3, '이름3', 1);

select *
from t_member m, t_club c
where m.club_id = c.id;

INSERT INTO T_MEMBER VALUES(3, '이름3', 1); --member PK id 중복!
INSERT INTO T_MEMBER VALUES(4, '이름4', null);
INSERT INTO T_MEMBER VALUES(5, '이름5', 8); 
--부모 키가 없습니다 오류! => FK에 해당하는 T_CLUB의 id에 8이 존재하지 않아서 불가!!
INSERT INTO T_MEMBER VALUES(5, '이름5', 4); 

select *
--delete
from t_club     --해당 값을 참조하는 외부 데이터가 있으면 삭제 불가
where id = 4;
--자식 레코드 발견 오류로 삭제 불가!! => 지우려면 자식부터 지우고 지워야한다!!

select *
--delete
from t_member   --외래키 설정된 상태로 참조하는 데이터를 먼저 삭제
where id = 5;









