select PRODUCT.*, CART.MID from  PRODUCT,CART WHERE PRODUCT.ID=CART.PID;
select PRODUCT.* from  PRODUCT,CART WHERE PRODUCT.ID=CART.PID;
select PRODUCT.* from  PRODUCT,(select * from cart where CART.PID='abcd') WHERE (select * from cart where CART.MID='abcd').PID=PRODUCT.ID;

select * from CART where CART.MID='abcd';
(select * from CART where CART.MID='abcd').PID;
select 
select * from cart;

select * from product where id='anchorBoxId_24733';

select PRODUCT.*  from  PRODUCT,CART WHERE PRODUCT.ID=CART.PID;

select CART.PID from CART where CART.MID='abcd';

select PID from CART where MID='abcd';

select PRODUCT.*,CART.MID from  PRODUCT,CART WHERE  IN (select PID from CART where MID='abcd')  PRODUCT.ID ;
select productBuy.name,cate from product,productBuy where productBuy.id = '1' and product.name = (select name from productBuy where thum ='2');


이거 실행되는거
select CART.*, PRODUCT.* from  PRODUCT WHERE  PRODUCT.ID IN (select PID from CART where MID='abcd');

select CART.* from  CART WHERE  PRODUCT.ID IN (select PID from CART where MID='abcd');

select CART.*, PRODUCT.* from  PRODUCT WHERE  PRODUCT.ID IN (select PID from CART where MID='abcd');

SELECT CART.QUANTITY , PRODUCT.* FROM CART, PRODUCT WHERE PRODUCT.ID=CART.PID AND CART.MID='abcd';

UPDATE CART SET QUANTITY=99 WHERE MID='abcd' and PID='anchorBoxId_15268';

CREATE TABLE SYSTEM.DEAL (
	NUM NUMBER,
	MID VARCHAR2(100),
	PID VARCHAR2(100),
	DEALDATE VARCHAR2(100)
);

CREATE SEQUENCE DEALNUM START WITH 1 INCREMENT BY 1 MAXVALUE 2100000000 CYCLE NOCACHE;
 "DEALNUM" 으로 한개씩 증가

 
 select * from deal ;
SELECT  PRODUCT.IMGADDR,PRODUCT.NAME,PRODUCT.PRICE,DEAL.QUANTITY FROM PRODUCT,DEAL WHERE   PRODUCT.ID  IN (select PID from DEAL where MID='abcd');

SELECT  PRODUCT.IMGADDR,PRODUCT.NAME,PRODUCT.PRICE,DEAL.QUANTITY,DEAL.DEALDATE  FROM PRODUCT,DEAL WHERE  DEAL.MID='abcd' AND PRODUCT.ID =  DEAL.PID ORDER BY DEAL.DEALDATE ;

SELECT  PRODUCT.IMGADDR,PRODUCT.NAME,PRODUCT.PRICE,DEAL.QUANTITY FROM PRODUCT,DEAL WHERE EXISTS  (select PID from DEAL where MID='abcd');
 
SELECT * FROM PRODUCT WHERE NAME LIKE '%가이거%' ;

select * from TEST where NAME like '%홍길동%';

 SELECT id,p_name FROM member WHERE p_name LIKE '%프린터%'


