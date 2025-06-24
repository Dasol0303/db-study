/***************************************/
DDL 제약조건

select * from new_table3;

DEFAULT : 저장되는 값이 없을때 저장할 기본 값

CREATE TABLE new_table3
(
    no NUMBER(3) DEFAULT 0,
    name VARCHAR2(16) DEFAULT 'Empty',
    birth DATE DEFAULT SYSDATE
);

INSERT INTO new_table3
VALUES (1, 'namel', TO_DATE('2020-02-02'));

select * from new_table3;

INSERT INTO new_table3
VALUES (2, null, TO_DATE('2020-02-02'));

INSERT INTO new_table3 (no, birth)
VALUES (3, TO_DATE('2020-02-02')); -- 이름 지정을 안해서 디폴드값인 Empty가 들어간다!

INSERT INTO new_table3 (no, name)
VALUES (4, 'myname2');



UNIQUE : 중복되지 않는 유일한 값
NOT NULL : null이 들어오는것이 불가 (Nullable NO)
무결성 (Integrity) : 데이터가 올바르게! 일관되게! 유지!

CHECK : 저장이 가능한 범위를 지정

CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE,
    name VARCHAR2(16) NOT NULL,
    birth DATE 
);


INSERT INTO tt01
VALUES (1, 'namel', SYSDATE);

INSERT INTO tt01
VALUES (1, null, SYSDATE); --NOT NULL이라서 불가!!

INSERT INTO tt01 (no, birth)
VALUES (2, SYSDATE); --NOT NULL이라서 불가!! -> name이 null로 표기되기 때문에 null로 인식해서 불가!!

INSERT INTO tt01
VALUES (2, 'name2', SYSDATE);

select * from tt01;

INSERT INTO tt01
VALUES (2, 'name3', SYSDATE); 
--무결성 제약 조건 오류!! > unique 때문에! -> 유니크를 걸어주면 중복된 값은 오류 사항!!



CREATE TABLE tt02
(
    no NUMBER(3) 
        CONSTRAINT tt02_no_uk UNIQUE,
    name VARCHAR2(16) 
        CONSTRAINT tt02_name_nn NOT NULL,
    birth DATE,
    score NUMBER(3)
        CONSTRAINT tt03_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT  tt03_pass_ck CHECK (pass IN ('Y', 'N'))
        -- Y랑 N만 저장하도록 만들어준다!
);

NUMBER(자리수)
NUMBER(전체자리수, 소수점자리수)
NUMBER(6,3) 전체 6자리, 소수점 3자리     123.456(O)      1234.56(X)
--6,3 => 전체가 6자리인데 소숫점 3자리까지도 넣어주겠다~(대신 소수점 자리까지 신경써서 데이터 넣어줘야함!)
NUMBER 라고만 표기 : 38자리까지 가능~

OracleDB 데이터 타입 
숫자/문자/날짜    NUMBER/VARCHAR2/DATE

boolean True/False X 테이블에 저장 불가 => 오라클에는 테이블에 저장하는 부분이 없다!
    True/False
    1/0
    T/F
    Y/N
    true/false 
    => 문자 혹은 숫자 형태로 저장

INSERT INTO tt02
VALUES (1, 'name1', SYSDATE, 60, 'Y');

INSERT INTO tt02
VALUES (1, 'name1', SYSDATE, 60, 'Y');  --중복 UNIQUE 제약

INSERT INTO tt02
VALUES (2, null, SYSDATE, 60, 'Y');  --이름 NOT NULL 제약

INSERT INTO tt02
VALUES (2, 'name2', SYSDATE, 850, 'Y'); --score 점수범위 제약 (0~100)

INSERT INTO tt02
VALUES (2, 'name2', SYSDATE, 70, 'Q'); --pass 가능범위 제약 ('Y', 'N')

INSERT INTO tt02
VALUES (2, 'name2', SYSDATE, 70, 'N');

COMMIT;
select * from tt02;


