USE demo;

-- -------------------------- Update SP-- 
DELIMITER // 
DROP PROCEDURE IF EXISTS update_user;
CREATE PROCEDURE update_user(user_name varchar(120),
 email varchar(220),
 country varchar(120),id_sp int(3))

BEGIN
UPDATE users
SET user_name = user_name , email = email, country = country
WHERE id = id_sp;
END;

//DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

call update_user("Loan","thanhha@gmail.com","viet Nam",2);

-- -------------------------- delete SP-- 
DELIMITER // 
DROP PROCEDURE IF EXISTS delete_user;
CREATE PROCEDURE delete_user(id_sp int(3))
BEGIN

DELETE 
FROM users
WHERE id = id_sp;

END;
//DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

call delete_user(1);


-- -------------------------- show_list SP-- 
DELIMITER // 
DROP PROCEDURE IF EXISTS show_list;
CREATE PROCEDURE show_list()
BEGIN

select id,user_name,email,country
from users;

END;
//DELIMITER ;

call show_list();