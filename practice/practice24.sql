CREATE TABLE temp_dept2
AS
SELECT * FROM dept2;

select * from temp_dept2;

INSERT INTO temp_dept2 VALUES ( 9010, 'temp_10', 1006, 'temp area' );

INSERT INTO temp_dept2 VALUES ( 9020, 'temp_20', null, (select dname from temp_dept2 where dcode=1006));
INSERT INTO temp_dept2 VALUES ( 9020, 'temp_20', 1006, null);


CREATE TABLE new_professor
AS
SELECT 
    profno,
    name,
    pay,
    bonus
FROM professor
where profno <= 3000;

select * from new_professor;

UPDATE new_professor
SET bonus = 100
where name = 'Winona Ryder';



