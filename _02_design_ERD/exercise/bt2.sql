drop database if exists sales_management;
create database sales_management;
use sales_management;
create table customer (
customer_id INT primary key auto_increment,
customer_name VARCHAR(50) NOT NULL,
customer_age INT
);
create table `order` (
order_id VARCHAR (30) primary key,
customer_id INT NOT NULL,
order_date datetime,
order_total_price decimal(18,2) default 0,
FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

create table product (
product_id VARCHAR(30) primary key,
product_name VARCHAR(50) NOT NULL,
product_price decimal(18,2)
);

create table order_detail (
order_id VARCHAR (30),
product_id VARCHAR(30),
order_qty INT,
primary key (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES `order` (order_id),
FOREIGN KEY (product_id) REFERENCES product (product_id)
);


