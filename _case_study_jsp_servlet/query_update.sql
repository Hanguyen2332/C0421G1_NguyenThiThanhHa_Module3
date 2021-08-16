use furama_management_jsp_servlet;

-- DELIMITER //
-- DROP PROCEDURE show_list;
-- CREATE PROCEDURE show_list()

-- BEGIN
select*
from customer;
-- END;

-- DELIMITER //

INSERT INTO customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
values ("KH-0001",1,"Lâm 5k","1998-01-11",1,"045698121","0985347213","lam2509@gmail.com","Yên Bái");
INSERT INTO customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
values ("KH-0002",1,"Minh Anh","1991-07-11",1,"123456789","0935123456","minhanh2509@gmail.com","Đà Nẵng");

INSERT INTO customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
values ("KH-0003",1,"Date Hà","1967-03-09",1,"121314150","0935123456","minhanh2509@gmail.com","Đà Nẵng");

select*
from customer;


-- find byId:
select customer_code,C.customer_type_id, customer_type_name,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address
from customer C
inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id
where customer_id = 5;

-- update:
UPDATE customer
SET customer_code = "KH-0006", customer_type_id = 2, customer_name = "Tuấn Tú", customer_birthday = "1983-02-07", customer_gender = 0, customer_id_card = "12935084",
customer_phone = "0913245678", customer_email = "nhadkf", customer_address = "Thai Lan"
WHERE customer_id = 13;


SET SQL_SAFE_UPDATES = 0;
delete
from customer
where customer_id = 3;


-- show Customer List: -- 
select  customer_id,customer_code,C.customer_type_id, customer_type_name,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address
from customer C
inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id;

-- customer Type:
select customer_type_id,customer_type_name
from customer_type;

-- customer Code
select customer_code
from customer;

-- customer IdCard
select customer_id_card
from customer;