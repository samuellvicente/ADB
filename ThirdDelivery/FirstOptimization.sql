--CREATE INDEX amount_idx ON account (amount);
ALTER INDEX amount_idx UNUSABLE;
--ALTER INDEX amount_idx REBUILD;


ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

set serveroutput on
variable n number
exec :n := dbms_utility.get_time;

UPDATE Account 
SET amount = amount*2 
WHERE amount <= ALL(
        SELECT avg(amount) 
        FROM Account 
);

SELECT Name
    FROM Costumer
    INNER JOIN Person
        ON GovID = PersonGovID 
    INNER JOIN Account 
        ON CostumerID = CostumerCostumerID
    WHERE amount >= (
        SELECT MAX(amount) 
        FROM Account 
);


exec dbms_output.put_line((dbms_utility.get_time-:n)/100) ;

rollback;








