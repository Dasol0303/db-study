/********************************************/
데이터 딕셔너리
오라클 DB에서 관련된 각종 정보를 확인할 수 있는 사전

접근 자료 구분

USER_   : 현재 로그인한 사용자가 소유한 객체 정보 조회
ALL_    : 현재 로그인한 사용자가 볼수 있는 모든 객체 정보 조회
DBA_    : DB 관리자 계정에서 DB 모든 객체 정보 조회


SELECT * FROM USER_TABLES;  --내가 만든 테이블 조회!
SELECT * FROM ALL_TABLES;   --존재하는 모든 테이블 조회!(내가 만든 것 포함)
--SELECT * FROM DBA_TABLES;   --관리자 권한으로 접근해야 볼 수 있음! CMD로 조회하면 볼 수 있음!

--몇 개는 아직 없어서 안보이지만 나중에 만들거!
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_OBJECTS; --검색을 빨리 하기 위해 꼬리표를 붙여놨다?
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_CONS_COLUMNS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

SELECT * FROM ALL_USERS;
SELECT * FROM USER_ROLE_PRIVS;


--테이블 정보 조회시 사용하기 좋은 테이블
SELECT * FROM TAB
WHERE tname LIKE '%DEPT%'; --테이블 이름들 있음!

SELECT * FROM TAB
WHERE tname LIKE '%MENU%';
--이름이 정확하게 기억 안나고 키워드로만 기억할 때 사용하기 좋음!!


