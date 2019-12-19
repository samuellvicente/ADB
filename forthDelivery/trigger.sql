--1 TRIGGER

CREATE OR REPLACE TRIGGER change_job
BEFORE INSERT ON RoleHIstory
REFERENCING NEW AS NEW OLD AS OLD

FOR EACH ROW
BEGIN
    UPDATE RoleHistory
    SET EndDate = CURRENT_DATE
    WHERE EmployeeEmployeeID = :NEW.EmployeeEmployeeID and EndDate IS NULL;
END;

--CENAS QUE USEI PARA TESTAR



--Select EmployeeEmployeeID, roleroleid, BranchBranchId, BeginDate, EndDate from RoleHistory WHERE employeeemployeeid = 3;

--delete from rolehistory where begindate like '%19.12.19%';
Rollback;

ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

SET TIMING ON;

DECLARE
    empID NUMBER := 1;
BEGIN
WHILE empID<5000
LOOP

INSERT INTO RoleHistory(RoleRoleID, EmployeeEmployeeID, BranchBranchId, BeginDate, EndDate) VALUES ( 1, empID, 1, CURRENT_DATE, NULL);
    
empID:=empID+1;
END LOOP;
END;






--1.1 TRIGGER

CREATE OR REPLACE TRIGGER verify_job
BEFORE INSERT ON RoleHIstory
REFERENCING NEW AS NEW OLD AS OLD

FOR EACH ROW
BEGIN
	dbms_output.enable; 
	IF(:NEW.RoleRoleID IN (1,2,3,4,5,6,7,8)) THEN
    	dbms_output.put_line( 'O JOB é valido' );
    ELSE 
    	RAISE_APPLICATION_ERROR( -20001, 
                             'O JOB é invalido' );
  		END IF;

END;

--CENAS QUE USEI PARA TESTAR

Rollback;

ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

SET TIMING ON;

DECLARE
    empID NUMBER := 1;
BEGIN
WHILE empID<5000
LOOP

INSERT INTO RoleHistory(RoleRoleID, EmployeeEmployeeID, BranchBranchId, BeginDate, EndDate) VALUES ( 8, empID, 1, CURRENT_DATE, NULL);
    
empID:=empID+1;
END LOOP;
END;



#2 TRIGGER

CREATE OR REPLACE TRIGGER deposit_money
AFTER INSERT ON Deposit
REFERENCING NEW AS NEW OLD AS OLD

FOR EACH ROW
BEGIN
    UPDATE Account
    SET Account.Amount = (Account.Amount + :NEW.Deposit.Amount)
    WHERE AccountID = :NEW.AccountAccountID;
END;

#CENAS QUE USEI PARA TESTAR


Rollback;

ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

SET TIMING ON;

DECLARE
    empID NUMBER := 1;
BEGIN
WHILE empID<5000
LOOP

INSERT INTO Deposit(AccountAccountID, DepositDate, Amount) VALUES (1, CURRENT_DATE, 1);

empID:=empID+2;
END LOOP;
END;

--CLOCK JOB


BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"SYSTEM"."CLOCK_EVENT"',
            job_type => 'PLSQL_BLOCK',
            job_action => 'DECLARE
    accid NUMBER := 1;
BEGIN
WHILE accid<2000
LOOP

UPDATE account set amount = amount + 1 where accountID = accid;

accid:=accid+1;
END LOOP;
END;',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => 'FREQ=SECONDLY;INTERVAL=10',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'Every 10 seconds the first 2000 accounts get 1 amount');

    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SYSTEM"."CLOCK_EVENT"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
  
    DBMS_SCHEDULER.enable(
             name => '"SYSTEM"."CLOCK_EVENT"');
END;


--TEST


ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH SHARED_POOL;

SET TIMING ON;

DECLARE
    accid NUMBER := 1;
BEGIN
WHILE accid<40000
LOOP

UPDATE account set amount = amount + 1 where accountID = accid;

accid:=accid+1;
END LOOP;
END;
