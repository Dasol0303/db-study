/************************************************/
시퀀스 (Sequence)
PK 용으로 사용하거나 순차적인 데이터를 표현하기 위해 사용하는 숫자 값

호출 할 때마다 자동 증가


시퀀스 생성

CREATE SEQUENCE 시퀀스이름
INCREMENT BY 1 --증가할 값 (보통은 1 -> 1씩 증가한다~)
START WITH 1 --시작 값
MINVALUE 1 --최소값
MAXVALUE 10 --최대값
CYCLE | NOCYCLE  --순환 여부    default : NOCYCLE
CACHE 20 | NOCACHE -- 숫자 메모리에 미리 저장해둘 갯수 (기본값 : 20)
;


시퀀스 삭제
DROP SEQUENCE 시퀀스 이름

시퀀스 호출(사용)
시퀀스이름.nextval 다음값 호출(사용)
시퀀스이름.currval 현재값 확인
;


/************************************************/
--PK 설정 / 활용

CREATE TABLE seq_test
(
    no NUMBER(6) PRIMARY KEY,
    name VARCHAR2(32)
);

--수동으로 체크하고 저장
select * from seq_test;

INSERT INTO seq_test VALUES(1, '이름1');
INSERT INTO seq_test VALUES(2, '이름2');

--서브쿼리로 활용 (갯수 COUNT)
select COUNT(*) from seq_test;      --현재갯수
select COUNT(*)+1 from seq_test;    --다음 들어갈 no 값

INSERT INTO seq_test VALUES( ( select COUNT(*)+1 from seq_test ) , '이름3');
INSERT INTO seq_test VALUES( ( select COUNT(*)+1 from seq_test ) , '이름4');
INSERT INTO seq_test VALUES( ( select COUNT(*)+1 from seq_test ) , '이름5');


DELETE from seq_test;
INSERT INTO seq_test VALUES( ( select COUNT(*)+1 from seq_test ) , '이름1');
-- 처음은 0이라고 생각하고 1부터 해도 됨!!

select * from seq_test;


--테이블 데이터를 어떻게 관리?
--삭제를 어떻게 처리? 가입자 정보 탈퇴 시?
    1) 삭제 (delete from ...)
    2) 삭제된 것처럼 상태 값 관리

--탈퇴시 -> 삭제하는 방식으로 관리
select * from seq_test;
--3번 사용자 탈퇴
select *
--delete 
from seq_test 
where no = 3;

INSERT INTO seq_test VALUES( ( select COUNT(*)+1 from seq_test ) , '이름6'); --3이 사라져서 5랑 PK 중복!!


--서브쿼리로 활용 (마지막 NO 값, MAX)
select MAX(no) from seq_test;   --현재 no 최대값
select MAX(no) + 1 from seq_test;   --다음에 사용할 no 값
select NVL( MAX(no) + 1, 1 ) from seq_test;   --현재 no 최대값
select NVL( MAX(no), 0 ) + 1 from seq_test;   --다음에 사용할 no 값

INSERT INTO seq_test VALUES( ( select MAX(no) + 1 from seq_test ) , '이름6');

select * from seq_test
order by no;

delete 
from seq_test 
where no = 6;

--기존 데이터가 없을 시, MAX(no) -> NULL 인식
INSERT INTO seq_test VALUES( ( select MAX(no) + 1 from seq_test ) , '이름1');
--null인 상태에서 MAX는 0으로 변환 X !!!!(COUNT는 해줌 ㅎ) 근데 원래도 null은 0으로 인식 안해줌

INSERT INTO seq_test VALUES( ( select NVL( MAX(no), 0 ) + 1 from seq_test ) , '이름1');
INSERT INTO seq_test VALUES( ( select NVL( MAX(no), 0 ) + 1 from seq_test ) , '이름2');
INSERT INTO seq_test VALUES( ( select NVL( MAX(no), 0 ) + 1 from seq_test ) , '이름3');

--no 중복되지 않게 사용 -> 시퀀스 사용
--T_테이블명  V_View명
CREATE SEQUENCE seq_seq_test_pk --시퀀스_이름(만들었던 사용할 테이블? 같은뎅)_만드는 목적
INCREMENT BY 1
START WITH 1;
--MIN / MAX
--CACHE
--NOCYCLE

select seq_seq_test_pk.nextval from dual;   --다음 차례 seq 진행값 호출
--누를 때마다 증가하는데 지나간 버스~ 이미 사용된 것처럼 처리됨
select seq_seq_test_pk.currval from dual;   --현재 seq 값

INSERT INTO seq_test VALUES(seq_seq_test_pk.nextval, 'A');
INSERT INTO seq_test VALUES(seq_seq_test_pk.nextval, 'B');
INSERT INTO seq_test VALUES(seq_seq_test_pk.nextval, 'C');
INSERT INTO seq_test VALUES(seq_seq_test_pk.nextval, 'D');

select * from seq_test
order by no;



--PK
1 2 3 4 5 6 ...
CL1 CL2 CL3 CL4...      'CL' || seq.nextval
SH1 SH2 SH3 SH4...      'SH' || seq.nextval


--시퀀스 값을 1부터 다시 시작하도록 조정 (삭제하고 다시하는 게 더 나음~)
DROP SEQUENCE seq_seq_test_pk;

CREATE SEQUENCE seq_seq_test_pk
INCREMENT BY 1
START WITH 1;

select seq_seq_test_pk.nextval from dual;


--다음 시퀀스 값 조정

--현재값 확인
select seq_seq_test_pk.nextval from dual;

--다음에 불렀을때 1이 될수 있게 값 조정
ALTER SEQUENCE seq_seq_test_pk INCREMENT BY -8;
ALTER SEQUENCE seq_seq_test_pk MINVALUE 0;
select seq_seq_test_pk.nextval from dual; --0으로 만들기

--다시 원상 복구
ALTER SEQUENCE seq_seq_test_pk INCREMENT BY 1;

--시퀀스 다시 사용
select seq_seq_test_pk.nextval from dual;


