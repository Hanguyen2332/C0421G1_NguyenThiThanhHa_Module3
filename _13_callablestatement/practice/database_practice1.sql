USE demo;

-- // get_user_by_id //----- -- 
DELIMITER //
DROP PROCEDURE IF EXISTS get_user_by_id;
CREATE PROCEDURE get_user_by_id (user_id INT) 
BEGIN

 select id, user_name,email,country
 from users
 where id = user_id;
 
END;
// DELIMITER ;

call get_user_by_id(9);

-- // insert_user  //----- -- 
DELIMITER //
CREATE PROCEDURE insert_user ( user_name varchar(120),
 email varchar(220),
 country varchar(120)) 
BEGIN

insert into  users (user_name,email,country)
values (user_name,email,country);

END;
// DELIMITER ;

call insert_user ("Kim Thi","thi@gmail.com","Viet Nam");