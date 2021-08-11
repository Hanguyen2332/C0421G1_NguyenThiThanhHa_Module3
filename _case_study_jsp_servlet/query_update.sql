use furama_management_jsp_servlet;

DELIMITER //
DROP PROCEDURE show_list;
CREATE PROCEDURE show_list()

BEGIN
select*
from customer;
END;

DELIMITER //

INSERT INTO customer(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
values (1,"Minh Anh","1995-11-11",0,"12345678","0985347213","thanhha2509@gmail.com","Cẩm Lệ, Đà Nẵng");

select*
from customer;


delete
from customer;



select  C.customer_type_id, customer_type_name,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address
from customer C
inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id;
