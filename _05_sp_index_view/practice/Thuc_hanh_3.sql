USE `classicmodels`;
DELIMITER //
create procedure getcusbyid 
(IN cusNum int(11))
begin 
select * from customers where customerNumber=cusNum;
end //
DELIMITER ; 