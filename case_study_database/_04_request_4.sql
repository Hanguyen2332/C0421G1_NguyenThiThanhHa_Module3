USE furama_management;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
-- SELECT  SUBSTRING_INDEX (employee_name, ' ', -1)
-- FROM employee;
SELECT *
FROM employee
WHERE (employee_name like '%_%_ K%' or employee_name like  '%_%_ H%'  or employee_name like '%_%_ T%')
AND CHAR_LENGTH (employee_name) <= 15 ;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT*
FROM customer
WHERE ((year(CURDATE())-year(date_of_birth)) BETWEEN 18 AND 50) AND address IN ('Đà Nẵng','Quảng Trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT C.customer_id, C.customer_name, CType.c_type_name, COUNT(CT.contract_id) AS use_times
FROM customer C
INNER JOIN contract CT ON C.customer_id = CT.customer_id 
INNER JOIN customer_type CType ON C.customer_type_id = CType.type_id
WHERE CType.c_type_name = 'Diamond'
GROUP BY C.customer_id
ORDER BY use_number;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu,  NgayLamHopDong, NgayKetThuc,
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và 
-- Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt 
-- phòng cũng phải hiển thị ra).

SELECT C.customer_id, C.customer_name, CT.contract_id, CType.c_type_name,
CT.date_make_contract, CT.date_end_contract
FROM contract CT
RIGHT JOIN customer C ON CT.customer_id = C.customer_id
INNER JOIN customer_type CType ON CType.type_id = C.customer_type_id
LEFT JOIN service S ON S.service_id = CT.service_id
LEFT JOIN contract_detail CTD ON CT.contract_id = CTD.contract_id
LEFT JOIN accompanied_service ACS ON CTD.accompanied_id = ACS.accompanied_id;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được 
-- Khách hàng thực hiện đặt (từ) TRONG quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select S.service_id, S.service_name, S.area, S.rental_fee, SType.type_name
from service S 
LEFT join service_type SType on S.service_type_id = SType.type_id
where not exists (select * from contract C where C.service_id = S.service_id
and date_make_contract between '2019-01-01' and '2019-03-31');

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả 
-- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  
-- trong năm 2019.






