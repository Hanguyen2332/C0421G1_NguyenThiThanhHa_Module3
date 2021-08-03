drop database if exists sales_management;
create database sales_management;
use sales_management;
create table customer (
customer_id INT primary key auto_increment,
customer_name VARCHAR(50) NOT NULL,
customer_age INT
);
create table `order` (
order_id INT primary key AUTO_INCREMENT,
customer_id INT,
order_date datetime,
order_total_price INT null,
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

create table product (
product_id INT primary key AUTO_INCREMENT,
product_name VARCHAR(25) NOT NULL,
product_price INT
);

create table order_detail (
order_id INT,
product_id INT,
order_qty INT,
primary key (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES `order` (order_id),
FOREIGN KEY (product_id) REFERENCES product (product_id)
);


