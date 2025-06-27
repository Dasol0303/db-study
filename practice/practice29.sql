CREATE TABLE product_quiz
(
    product_id INTEGER NOT NULL,
    product_code VARCHAR(8) NOT NULL,
    price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);


select * from product_quiz;

select COUNT(*) from product_quiz where price >= 0 AND price < 10000;
select COUNT(*) from product_quiz where price >= 10000 AND price < 20000;
select COUNT(*) from product_quiz where price >= 20000 AND price < 30000;
select COUNT(*) from product_quiz where price >= 30000 AND price < 40000;


-- 가격단위로 그룹으로 묶어서 잘 처리를~
select
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END price_group,
    count(*) products
from product_quiz
group by 
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END
order by price_group;




select price price_group, count(*) products
from (
    select
        CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END price
    from product_quiz
)
group by price
order by price_group;



--table

CREATE TABLE product_quiz_t_price_check
(
    price_group NUMBER(6),
    products NUMBER(3)
);

select * from product_quiz_t_price_check;

INSERT INTO product_quiz_t_price_check VALUES (0, (select COUNT(*) from product_quiz where price >= 0 AND price < 10000));
INSERT INTO product_quiz_t_price_check VALUES (10000, (select COUNT(*) from product_quiz where price >= 10000 AND price < 20000));
INSERT INTO product_quiz_t_price_check VALUES (20000, (select COUNT(*) from product_quiz where price >= 20000 AND price < 30000));
INSERT INTO product_quiz_t_price_check VALUES (30000, (select COUNT(*) from product_quiz where price >= 30000 AND price < 40000));



--시퀀스!
CREATE SEQUENCE product_quiz_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

/* 3번 */
select product_quiz_seq.currval from dual;
-- => 현재 값 확인 
select product_quiz_seq.nextval from dual;
-- => 다음 값 사용

/* 4번 */
select * from product_quiz_t_price_check;

INSERT INTO product_quiz_t_price_check VALUES ( 0, (select COUNT(*) from product_quiz where price >= 0 AND price < 10000) );
INSERT INTO product_quiz_t_price_check VALUES ( 10000, (select COUNT(*) from product_quiz where price >= 10000 AND price < 20000) );
INSERT INTO product_quiz_t_price_check VALUES ( 20000, (select COUNT(*) from product_quiz where price >= 20000 AND price < 30000) );
INSERT INTO product_quiz_t_price_check VALUES ( 30000, (select COUNT(*) from product_quiz where price >= 30000 AND price < 40000) );




--악! 실수!! 삭제하고 다시하자ㅠㅠ
DROP SEQUENCE product_quiz_seq;
DELETE FROM product_quiz_t_price_check;
