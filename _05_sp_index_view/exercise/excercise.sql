drop database demo_product;
create database demo_product;
use demo_product;
create table Products (
id INT primary key auto_increment,
product_Code VARCHAR(45),
product_Name VARCHAR(45),
product_Price DECIMAL (18,2),
product_Amount INT,
product_Description VARCHAR(100),
product_Status VARCHAR(30)
);

insert into products (product_Code,product_Name,product_Price,product_Amount,product_Description,product_Status)
values ('KM-0001', 'Khăn mặt', 30000, 50, 'Khăn lông mềm', 'còn hàng' ),
('KDR-0002', 'Kem đánh răng', 45000, 90, 'Kem đánh răng than hoạt tính', 'còn hàng' ),
('BCBC-0003', 'Bàn chải bồn cầu', 60000, 45, 'bàn chải bồn cầu 360 độ', 'còn hàng' ),
('Gif-0004', 'nước lau sàn gif', 50000, 20, 'nước lau sàn hương hoa oải hương', 'còn hàng' ),
('VIM-0005', 'Nước tẩy bồn cầu', 45000, null, 'đánh bay vi khuẩn', 'hết hàng' );

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_code ON products (product_Code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products
add index Composite_index (product_Name,product_Price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select*
from products 
where product_Code = 'Gif-0004';

-- xóa: 
DROP INDEX composite_index ON products;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products AS (
select  product_Code,product_Name,product_Price, product_Status
from products
); 
select*FROM v_products;

-- Tiến hành sửa đổi view
create or replace view  v_products as 
select id, product_Code,product_Name,product_Price, product_Status
from products
where product_Price = 45000;

-- Tiến hành xoá view
drop view v_products;

-- Bước 5: tạo store procedure
delimiter //
create procedure query_sp ()
begin
select*
from Products;
end;
// delimiter ;
drop procedure `query_sp`;
CALL query_sp();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure insert_sp (id INT, product_Code  VARCHAR(45),product_Name  VARCHAR(45),product_Price DECIMAL (18,2),product_Amount INT,
product_Description VARCHAR(100),product_Status VARCHAR(30))
begin
insert into Products
values (id, product_Code,product_Name,product_Price,product_Amount,product_Description,product_Status);
end;
// delimiter ;
drop procedure `insert_sp`;
CALL insert_sp(6,'KDR-0002', 'Kem đánh răng', 45000, 90, 'Kem đánh răng than hoạt tính', 'còn hàng' );

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_sp (p_id INT, p_product_price INT)
begin
update Products
set product_price = p_product_price
where id = p_id;
end;
// delimiter ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_sp (p_id INT)
begin
delete 
from Products
where id = p_id;
end;
// delimiter ;
call delete_sp(1);
