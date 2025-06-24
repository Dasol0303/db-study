CREATE TABLE temp_professor
AS
SELECT * FROM professor;


select * from temp_professor;

UPDATE temp_professor
SET bonus = 200
WHERE position = 'assistant professor';

select position from temp_professor where name = 'Sharon Stone';

UPDATE temp_professor
SET pay = pay * 1.15
WHERE 
    position = ( 
                    select position 
                    from temp_professor 
                    where 
                    name = 'Sharon Stone' )
    AND pay < 250;





