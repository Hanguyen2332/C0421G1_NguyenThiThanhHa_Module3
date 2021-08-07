drop database if exists demo;
CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 user_name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(user_name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(user_name, email, country) values('Thai An','an@che.uk','Viet Nam');

select id,user_name,email,country
from users;

insert into users(user_name, email, country) 
values('Minh','minh@codegym.vn','Viet Nam'),
 ('Song Joong Ki','songki@codegym.vn','Korean'),
  ('Luu','luu@codegym.vn','China');

--  select id, user_name,email,country
--  from users
--  where id = 6;
 
 delete 
 from users
 where id in (10,11,12);
 
 update users
 set user_name = "Nhat",email = "Nhat",country = "Nhat"
 where id = 3;
 
select id, user_name,email,country
from users
where country Like "%Viet%";

select id, user_name,email,country
from users
order by user_name;