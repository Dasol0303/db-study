/***************************************/
DML
데이터 저장 INSERT
데이터 수정 UPDATE
데이터 삭제 DELETE
데이터 병합 MERGE

--데이터 조회 (SELECT)


INSERT 저장

INSERT INTO 테이블명 (컬럼명...)
VALUES (데이터 값...)

--전체 컬럼에 데이터를 저장 + 순서 맞춰서 저장하는 경우 -> 컬럼명 작성 생략 가능
INSERT INTO 테이블명 
VALUES (데이터 값...)
;

insert into new_table (no, name, birth) -- 데이터 저장하겠다!
VALUES (1, '이름1', SYSDATE);
 
select * from new_table;

insert into new_table (name, birth, no)
values ('이름2', SYSDATE, 2);

insert into new_table (birth, name, no)
-- values ('2024-12-12', '이름3', 3)
values (TO_DATE('2024-12-12'), '이름3', 3); --여기가 정석!

insert into new_table -- 컬럼명 생략
values (4, '이름4', SYSDATE);

insert into new_table (no, name)
values (5, '이름5');

insert into new_table
values (6, '이름6', null);

INSERT ALL
INTO new_table values(7, '이름7', null)
INTO new_table values(8, '이름8', SYSDATE)
INTO new_table values(9, '이름9', TO_DATE('2023-01-30'))
select * from dual;



select * from new_table2;

-- 다른 테이블의 다른 데이터를 조회해서 저장
INSERT INTO new_table2
SELECT 10, '이름10', SYSDATE FROM dual;

INSERT INTO new_table2
SELECT no, name, birth FROM new_table;

INSERT INTO new_table2
SELECT no, name, birth FROM new_table
where no < 5;



테이블 수정 UPDATE

UPDATE 테이블명
SET 컬럼명 = 값,
    컬럼명 = 값 --이렇게 늘릴 수 있다!!
WHERE 조건;

select * from dept3;
--Seoul Branch Office -> Incheon Branch Office

UPDATE dept3
SET area = 'Incheon Branch Office'
--select * from dept3       -- 조건 확인용으로 가운데에 주석 하나 달아주기!
WHERE area = 'Seoul Branch Office';

UPDATE dept3
SET dname = 'Sales First Team';
--where dcode = 1008;
-- !!!!**주의**!!!!   where절을 빼먹으면 데이터 전체가 바뀐다!! (조건지정 필수ㅠㅠ)

CREATE TABLE professor2
AS
SELECT * FROM professor;

select * from professor2;

--bonus 받는 교수들의 보너스를 +100 증가
UPDATE professor2
SET bonus = bonus + 100
--select * from professor2
WHERE bonus is not null;

commit;     확정
rollback;   되돌리기(취소)


select * from professor2;


--insert, update, delete (DML)

select * from new_table2;

insert into new_table2
values (99, '이름99', SYSDATE);


DELETE 데이터 삭제 (rollback 가능 : 자동 commit이 아닌경우)

DELETE FROM 테이블명
WHERE 조건;

select * from dept3;

select *
--delete    -- !!!!**습관화 들이기**!!!! 전부 다 지우는 실수를 줄여준다! ㄷㄷ
from dept3
where dcode = 1007; 
--delete를 주석 처리하고 > 지우려는 항목 확인 후 > delete부터 드래그로 필요부분 잡아서 실행!

commit;


