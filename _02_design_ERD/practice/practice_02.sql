DROP database IF exists quan_ly_diem_thi;
CREATE DATABASE quan_ly_diem_thi;
USE quan_ly_diem_thi;
CREATE TABLE hoc_sinh (
ma_hs INT PRIMARY KEY auto_increment,
ten_hs VARCHAR(50),
ngay_sinh datetime,
lop VARCHAR(10),
gioi_tinh VARCHAR (20)
);

CREATE TABLE giao_vien ( 
ma_gv INT PRIMARY KEY auto_increment,
ten_gv VARCHAR(50),
sdt VARCHAR (11)
);

CREATE TABLE mon_hoc (
ma_mh VARCHAR(20) PRIMARY KEY,
ten_mh VARCHAR(20) NOT NULL,
giao_vien_ma_gv INT,
foreign key (giao_vien_ma_gv)
references giao_vien(ma_gv)
);
CREATE TABLE bang_diem (
ma_hs INT,
ma_mh VARCHAR (20),
diem_thi float NOT NULL,
ngay_kt DATETIME,
primary key (ma_hs,ma_mh),
foreign key(ma_hs) references hoc_sinh(ma_hs),
foreign key(ma_mh) references mon_hoc(ma_mh)
);