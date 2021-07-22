DROP DATABASE IF EXISTS furama_management;
CREATE DATABASE furama_management;
USE furama_management;
-- creat ViTri:
CREATE TABLE position (
position_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR (45)
);
-- creat BoPhan:
CREATE TABLE section (
section_id INT PRIMARY KEY AUTO_INCREMENT,
position_name VARCHAR (45)
);
-- creat TrinhDo:
CREATE TABLE `level` (
level_id INT PRIMARY KEY AUTO_INCREMENT,
level_name VARCHAR (45)
);

-- creat LoaiKhach:
CREATE TABLE customer_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
c_type_name VARCHAR (45)
);
-- creat KieuThue:
CREATE TABLE rental_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR (45)
);

-- creat LoaiDichVu:
CREATE TABLE service_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR (45)
);

-- creat NhanVien:
CREATE TABLE employee (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR (45),
position_id INT,
level_id INT,
section_id INT,
date_of_birth DATE,
id_card VARCHAR (45),
salary VARCHAR (45),
phone VARCHAR (45),
email VARCHAR (45),
address VARCHAR (45),
FOREIGN KEY (position_id) REFERENCES position (position_id),
FOREIGN KEY (level_id) REFERENCES `level` (level_id),
FOREIGN KEY (section_id) REFERENCES section (section_id)
);

-- creat KhachHang:
CREATE TABLE customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_type_id INT,
customer_name VARCHAR (45),
date_of_birth DATE,
id_card VARCHAR (45),
phone VARCHAR (45),
email VARCHAR (45),
address VARCHAR (45),
FOREIGN KEY (customer_type_id) REFERENCES customer_type (type_id)
);
-- creat DichVu:
CREATE TABLE service (
service_id INT PRIMARY KEY AUTO_INCREMENT,
service_name VARCHAR (45),
area INT,
floors INT,
max_person INT,
rental_fee INT,
rental_type_id INT,
service_type_id INT,
`status` VARCHAR (45),
FOREIGN KEY (rental_type_id) REFERENCES rental_type (type_id),
FOREIGN KEY (service_type_id) REFERENCES service_type (type_id)
);
-- creat HopDong:
CREATE TABLE contract (
contract_id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT,
customer_id INT,
service_id INT,
date_make_contract DATE,
date_end_contract DATE,
deposit INT,
total_payment INT,
FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
FOREIGN KEY (service_id) REFERENCES service (service_id)
);

-- creat DichVuDiKem:
CREATE TABLE accompanied_service (
accompanied_id INT PRIMARY KEY AUTO_INCREMENT,
accompanied_name VARCHAR (45),
accompanied_fee INT,
unit INT,
`status` VARCHAR (45)
);

-- creat DichVuDiKem:
CREATE TABLE contract_detail (
cd_id INT PRIMARY KEY AUTO_INCREMENT,
contract_id INT,
accompanied_id INT,
cd_qty INT,
FOREIGN KEY (contract_id) REFERENCES contract (contract_id),
FOREIGN KEY (accompanied_id) REFERENCES accompanied_service (accompanied_id)
);

