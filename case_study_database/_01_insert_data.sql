USE furama_management;
-- insert ViTri:
INSERT INTO position (position_name)
VALUE ('Lễ Tân'), ('Phục vụ'), ('Chuyên viên'), ('Giám sát'),  ('Quản lý'), ('Giám đốc');
 -- insert TrinhDo:
 INSERT INTO `level` (level_name)
VALUE ('Trung cấp'), ('Cao đẳng'), ('Đại học'), ('Sau đại học');
  -- insert BoPhan:
INSERT INTO section (section_name)
VALUE ('Sale – Marketing'),('Hành Chính'), ('Phục vụ'), ('Quản lý');
  -- insert LoaiKhach:
INSERT INTO customer_type (c_type_name)
VALUE ('Diamond'), ('Platinium') ,('Gold'), ('Silver'), ('Member');
  -- insert KieuThue:
INSERT INTO rental_type (type_name)
VALUE ('Hour'), ('Day') ,('Month'), ('Year');
  -- insert LoaiDichVu:
INSERT INTO  service_type(type_name)
VALUE ('Villa'), ('House') ,('Room');

  -- insert NhanVien:
 INSERT INTO  employee (employee_name,position_id,level_id,section_id,date_of_birth,id_card,salary,phone,email,address)
VALUE ('Lương Thế Kiệt', 1, 1, 2, '1997-06-24', '1234556',7,'0909123456','kietque@gmail.com','Quang Tri'),
('Trần Thị Mộng Du', 2, 3, 4, '1992-11-07', '93978675',8,'0936231026','mongdu@gmail.com','Hải Châu'),
('Văn Minh Tuấn', 3, 3, 4, '1988-03-17','95672301',12, '0365127783', 'tuan@yahoo.com', 'Quảng Nam'),
('Đỗ Bá Đạo', 6, 4, 4, '1977-02-11','23409135',25, '0999333999', 'badao@outlook.com', 'Liên Chiểu'),
('Tăng Thanh Hà', 4, 2, 1, '1985-09-19','26345903',15, '0364923789', 'hatang@.gmail.com', 'Huế'),
('Đồng Văn Phụt', 2, 1, 3, '1995-01-16','42671890',6, '0983401297', 'dongphuc@.gmail.com', 'Bình Định'),
('Đồng Văn Tài', 1, 2, 1, '1993-05-10','86059271',8, '0367019236', 'taidong@.gmail.com', 'Lào Cai');
 
   -- insert KhachHang:
 INSERT INTO  customer (customer_type_id,customer_name,date_of_birth,id_card,phone,email,address)
VALUE (1,'Võ Thị Kiều Diễm','1993-11-24', '3519068','0909888467','diemvo@gmail.com','Vinh'),
(2, 'Châu Thị Bích Trâm','1975-12-24', '19804891','0986058250','chautram@gmail.com','Quảng Trị'),
(3, 'Lê Văn Mạnh', '1982-04-01','24509135','0984378013', 'manhle@yahoo.com', 'Đà Nẵng'),
(4, 'Trần Đức Hạnh','1963-09-03','30314056', '0310290270', 'hanhtran@outlook.com', 'Quảng Bình'),
(5,'Đồng Văn Nhật', '1997-08-08','901309540', '0989134257', 'dongnhat@.gmail.com', 'Hà Tĩnh'),
(1,'Nguyễn Thị Thanh Hà','1995-11-11', '241445602','0905336771','thanhha2332@gmail.com','Quảng Ngãi'),
(4, 'Lê Văn Mạnh', '1988-01-11','080923567','0347890123', 'vanmanh@yahoo.com', 'Hà Nội');

   -- insert DichVu: 
INSERT INTO service (service_name,area,floors,max_person,rental_fee,rental_type_id,service_type_id,`status`)
VALUE ('Villa-hướng biển', 120, 3, 8, 10, 3, 1, 'Đang sử dụng'),
('House-hướng vườn', 150, 2, 5, 400, 4, 2, 'Khả dụng'),
('Room-Standard', 55, 1, 1, 1,2, 3, 'Khả dụng'),
('Villa-song lập', 120, 3, 8, 10, 3, 1, 'Đang sử dụng'),
('House-liền kề', 100, 2, 6, 13, 3, 2, 'Khả dụng'),
('Room-Deluxe', 70, 1, 2, 2, 2, 3, 'Đang sử dụng');

-- insert ConTract:
INSERT INTO  contract(employee_id,customer_id,service_id,date_make_contract,date_end_contract,deposit)
VALUE (1,2,1,'2019-10-15', '2019-11-15',5),
(2,3,3,'2019-12-22', '2019-12-29',1),
(6,1,1,'2019-11-05', '2019-11-10',5),
(3,5,6,'2018-11-05', '2018-11-25',3),
(3,2,2,'2018-03-22', '2018-05-22',7),
(4,2,4,'2018-07-05', '2018-10-05',15),
(5,4,3,'2021-08-12', '2021-08-18',1),
(1,5,6,'2020-07-07', '2020-07-27',2),
(2,3,3,'2021-02-28', '2021-03-10',4);

-- insert DichVuDiKem:
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
INSERT INTO accompanied_service (accompanied_name,accompanied_fee,unit,`status`)
VALUES('Dọn phòng 24/7',5, '$','Khả dụng'),
('Quầy bar',10, '$','Khả dụng'),
('Giặt ủi',7, '$','Khả dụng'),
('Sân Golf',50, '$','Khả dụng'),
('Fitness',10, '$','Không khả dụng'),
('Đón tiễn Sân bay',0, '$','Khả dụng'),
('Massage',15, '$','Không khả dụng'),
('Bữa sáng',20, '$','Khả dụng');

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng ( một lần duy nhất. )

-- Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
INSERT INTO contract_detail (contract_id,accompanied_id,cd_qty) 
VALUE (1, 1, 4),
(2, 2, 1),
(4, 3, 2),
(5, 4, 3),
(6, 3, 5),
(2, 5, 2),
(3, 7, 1);




