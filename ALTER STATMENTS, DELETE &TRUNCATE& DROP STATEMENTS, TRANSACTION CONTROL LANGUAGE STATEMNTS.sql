USE TRAINING;

-- AUTO INCREMENT
CREATE TABLE USERS(
USERID INT UNIQUE AUTO_INCREMENT,
USERNAME VARCHAR(50),
CITY VARCHAR(50)
);

INSERT INTO USERS (USERNAME,CITY) VALUES ('RAKEYSHH','PUNE'),('VIKAS','MUMBAI'),('MANDAR','KOLHAPUR'),('RAMYA','GOKAK');
SELECT * FROM USERS;

INSERT INTO USERS VALUES(11,'SWAPNIL','GADHINGLAJ');
SELECT * FROM USERS;
INSERT INTO USERS (USERNAME,CITY) VALUES ('TRIVYA','GOKAK'); -- AUTO INCREMENT FROM PREV CUST ID
SELECT * FROM USERS;

-- ALTER STATEMENTS--
-- ADDING COLUMN--
ALTER TABLE CUSTOMERS 
ADD COLUMN COUNTRY VARCHAR(50);

SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS VALUES (7,'MADDY',29,'M','KOLHAPUR','INDIA'),(9,'JOHN',37,'M','SATARA','INDIA');
SELECT * FROM CUSTOMERS;

SET SQL_SAFE_UPDATES=0;
UPDATE CUSTOMERS SET COUNTRY='INDIA' WHERE COUNTRY IS NULL;

SELECT * FROM CUSTOMERS;

ALTER TABLE CUSTOMERS 
ADD COLUMN PROFESSION VARCHAR(50) DEFAULT 'SOFTWARE ENGINEER';
SELECT * FROM CUSTOMERS;

-- REMOVING COLUMN--
ALTER TABLE CUSTOMERS
DROP COLUMN COUNTRY;

SELECT * FROM CUSTOMERS;

-- MODIFY THE COLUMN--
DESC CUSTOMERS;
ALTER TABLE CUSTOMERS
MODIFY COLUMN CITY VARCHAR(20) DEFAULT 'NEW DELHI';
DESC CUSTOMERS;

ALTER TABLE CUSTOMERS
MODIFY COLUMN CUST_NAME VARCHAR(50) UNIQUE;
DESC CUSTOMERS;

-- RENAMING THE COLUMN--
ALTER TABLE CUSTOMERS
RENAME COLUMN CITY TO PLACE;

SELECT * FROM CUSTOMERS;

-- RENAMING THE TABLE--
ALTER TABLE CUSTOMERS
RENAME TO CUSTOMERS1;

RENAME TABLE CUSTOMERS1 TO CUSTOMERS;

-- ADDING PRIMARY KEY CONSTRAINT--
SELECT * FROM PRODUCT;
ALTER TABLE PRODUCT
ADD PRIMARY KEY (PROD_ID);

DESC PRODUCT;

-- ADDING CHECK CONSTRAINT--
ALTER TABLE PRODUCT
MODIFY COLUMN AMOUNT INT CHECK(AMOUNT>0);
DESC PRODUCT;

SELECT * FROM PRODUCT;
INSERT INTO PRODUCT VALUES(107,'TOY',0); -- ERROR SINCE CHECK CONSTRAINT ON AMOUNT
INSERT INTO PRODUCT VALUES  (108,'TOYGUN',1000);

SELECT * FROM CUSTOMERS;

-- DELETE ,TRUNCATE, DROP STATEMENTS--
-- DELETE STATMENT CAN BE USED FOR DELETE ONE/MANY/ALL ROWS

SELECT * FROM PRODUCT;
DELETE FROM PRODUCT WHERE PROD_ID=101;
DELETE FROM PRODUCT WHERE AMOUNT>30000;
SELECT * FROM PRODUCT;
DELETE FROM PRODUCT;
SELECT * FROM PRODUCT;

-- TRUNCATE STAEMENT CAN BE USED TO DELETE ALL RECORDS--
SELECT * FROM USERS;
TRUNCATE TABLE USERS;
SELECT * FROM USERS;

-- IF DELETE STATEMENT THEN ROLLBACK CAN BE POSSIBLE BUT IF TRUNCATE STATEMENT THEN ROLLBACK CANT BE POSSIBLE. TRUNCATE IS FASTER THAN DELETE--
-- DROP STATEMENT WILL DELETE THE ENTIRE DATA AS WELL AS TABLE--
 SELECT * FROM CUSTOMERS;
 DROP TABLE CUSTOMERS;
 
 SELECT * FROM CUSTOMERS; -- ERROR SINCE TABLE NOT EXIST DUE TO DROP STATEMENT
 
 -- TRANSACTION CONTROL LANGUAGE--
 -- COMMIT AND ROLLBACK--

START TRANSACTION;
SELECT * FROM ORDERS;
DELETE FROM ORDERS WHERE CUSTID IN (1001,1002);
COMMIT; -- TO SAVE CHANGES PERMANANTLY
SELECT * FROM ORDERS;

-- ROLLBACK
SELECT * FROM ORDERS;
START TRANSACTION;
DELETE FROM ORDERS;
ROLLBACK;
SELECT * FROM ORDERS;
START TRANSACTION;
DELETE FROM ORDERS WHERE CUSTID IN (1003,1004); 
SELECT * FROM ORDERS;
COMMIT;

-- DELETE CAN BE ROLLBACK BUT TRUNCATE CANT BE ROLLBACK--

-- SAVEPOINT--
START TRANSACTION;
SELECT * FROM COUNTRY;
SAVEPOINT P1;
UPDATE COUNTRY SET COUNTRYNAME='USA' WHERE COUNTRYNAME='UNITED STATES';
SELECT * FROM COUNTRY;
SAVEPOINT P2;
UPDATE COUNTRY SET PEOPLECOUNT=2013469875 WHERE COUNTRYID=1;
SELECT * FROM COUNTRY;
SAVEPOINT P3;
DELETE FROM COUNTRY WHERE COUNTRYNAME='NEPAL';
SELECT * FROM COUNTRY;
SAVEPOINT P4;
DELETE FROM COUNTRY WHERE COUNTRYID=8;
SELECT * FROM COUNTRY;
ROLLBACK TO SAVEPOINT P4;
ROLLBACK;

SELECT * FROM COUNTRY;