DROP DATABASE IF EXISTS furama_management_jsp_servlet;
CREATE DATABASE furama_management_jsp_servlet;
USE furama_management_jsp_servlet;

CREATE TABLE position (
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR(45)
);

CREATE TABLE education_degree (
education_degree_id INT PRIMARY KEY AUTO_INCREMENT,
education_degree_name VARCHAR(45)
);

CREATE TABLE division (
division_id INT PRIMARY KEY AUTO_INCREMENT,
division_name VARCHAR(45)
);

CREATE TABLE customer_type (
customer_type_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_name VARCHAR(45)
);

CREATE TABLE service_type (
service_type_id INT PRIMARY KEY AUTO_INCREMENT,
service_type_name VARCHAR(45)
);

CREATE TABLE rent_type (
rent_type_id INT PRIMARY KEY AUTO_INCREMENT,
rent_type_name VARCHAR(45),
rent_type_cost DOUBLE
);

CREATE TABLE attach_service ( 
attach_service_id INT PRIMARY KEY AUTO_INCREMENT,
attach_service_name VARCHAR(45),
attach_service_cost DOUBLE,
attach_service_unit INT,
attach_service_status VARCHAR(45)
);

CREATE TABLE role_table (
role_id INT PRIMARY KEY AUTO_INCREMENT,
role_name VARCHAR(255)
);

CREATE TABLE user_table (
user_name VARCHAR(255) PRIMARY KEY,
user_password VARCHAR(255)
);

CREATE TABLE user_role (
role_id INT,
user_name VARCHAR(255),
PRIMARY KEY (role_id,user_name),
FOREIGN KEY (role_id) REFERENCES role_table (role_id),
FOREIGN KEY (user_name) REFERENCES user_table (user_name)
);



-- //employee//-- 
CREATE TABLE employee (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(45),
employee_birthday DATE,
employee_id_card VARCHAR(45),
employee_salary DOUBLE,
employee_phone VARCHAR(45),
employee_email VARCHAR(45),
employee_address VARCHAR(45),
position_id INT,
education_degree_id INT,
division_id INT,
user_name VARCHAR(255),
FOREIGN KEY (position_id) REFERENCES position (position_id),
FOREIGN KEY (education_degree_id) REFERENCES education_degree (education_degree_id),
FOREIGN KEY (division_id) REFERENCES division (division_id),
FOREIGN KEY (user_name) REFERENCES user_table (user_name)
);

-- //customer//-- 
CREATE TABLE customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_id INT,
customer_name VARCHAR(45),
customer_birthday date,
customer_gender BIT(1),
customer_id_card VARCHAR(45),
customer_phone VARCHAR(45),
customer_email VARCHAR(45),
customer_address VARCHAR(45),
FOREIGN KEY (customer_type_id) REFERENCES customer_type (customer_type_id)
);

-- //service//--  
CREATE TABLE service (
service_id INT PRIMARY KEY AUTO_INCREMENT,
service_name VARCHAR(45),
service_area DOUBLE,
service_cost DOUBLE,
service_max_people INT,
rent_type_id INT,
service_type_id INT,
standard_room VARCHAR(45),
description_other_convenience VARCHAR(45),
pool_area DOUBLE,
room_of_floors INT,
FOREIGN KEY (rent_type_id) REFERENCES rent_type (rent_type_id),
FOREIGN KEY (service_type_id) REFERENCES service_type (service_type_id)
);

-- //contract//--  
CREATE TABLE contract (
contract_id INT PRIMARY KEY AUTO_INCREMENT,
contract_start_date DATETIME,
contract_end_date DATETIME,
contract_deposit DOUBLE,
contract_total_money DOUBLE,
employee_id INT,
customer_id INT,
service_id INT,

FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
FOREIGN KEY (service_id) REFERENCES service (service_id)
);

-- //contract_detail//--   attach_service  attach_service_id
CREATE TABLE contract_detail (
contract_detail_id INT PRIMARY KEY AUTO_INCREMENT,
contract_id INT,
attach_service_id INT,
quantity INT,

FOREIGN KEY (contract_id) REFERENCES contract (contract_id),
FOREIGN KEY (attach_service_id) REFERENCES attach_service (attach_service_id)
);
