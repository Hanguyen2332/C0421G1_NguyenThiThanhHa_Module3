USE demo;

-- // get_user_by_id //----- -- 
DELIMITER //
CREATE PROCEDURE get_user_by_id (user_id INT) 
BEGIN

 select id, user_name,email,country
 from users
 where id = user_id;
 
END;
// DELIMITER ;

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