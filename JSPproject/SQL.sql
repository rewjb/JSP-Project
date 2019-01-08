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
select PRODUCT.* from  PRODUCT WHERE  PRODUCT.ID IN (select PID from CART where MID='abcd');