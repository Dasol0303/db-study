select * from panmae;
select * from product; -- 상품코드
select * from gift; --

-- 1월 1일에는 포인트가 200

select 
    TO_CHAR( TO_DATE (p.p_date, 'YYYYMMDD'), 'YYYY-MM-DD') As "판매일자",
    p.p_code As "상품코드",
    pr.p_name As "상품명",
    TO_CHAR( pr.p_price, '999,999' ) As "상품가",
    p.p_qty As "구매수량",
    TO_CHAR( pr.p_price * p.p_qty, '999,999' ) As "총금액",
    TO_CHAR( pr.p_price * p.p_qty * 100, '999,999' ) As "적립포인트",
    DECODE ( SUBSTR( TO_CHAR( TO_DATE (p.p_date, 'YYYYMMDD'), 'YYYY-MM-DD'), 6 ), 
            '01-01', TO_CHAR( pr.p_price * p.p_qty * 200, '999,999,999' ),
               TO_CHAR( pr.p_price * p.p_qty * 100, '999,999,999' )) As "새해 2배 적립포인트",
    g.gname As "사은품명",
    TO_CHAR( g.g_start, '999,999,999' ) As "포인트 start",
    TO_CHAR( g.g_end, '999,999,999' ) As "포인트 end"

from panmae p, product pr, gift g
where 
    p.p_code = pr.p_code
    AND 
        DECODE ( SUBSTR( TO_CHAR( TO_DATE (p.p_date, 'YYYYMMDD'), 'YYYY-MM-DD'), 10 ), 
                1, TO_CHAR( pr.p_price * p.p_qty * 200),
                   TO_CHAR( pr.p_price * p.p_qty * 100))
        BETWEEN g.g_start AND g.g_end
order by p.p_date;



