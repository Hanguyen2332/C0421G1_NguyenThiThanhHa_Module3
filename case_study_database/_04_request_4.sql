USE furama_management;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
-- SELECT  SUBSTRING_INDEX (employee_name, ' ', -1)
-- FROM employee;
SELECT *
FROM employee
WHERE (employee_name like '%_%_%_ K%' or employee_name like  '%_%_ H%'  or employee_name like '%_%_%_ T%')
AND CHAR_LENGTH (employee_name) <= 15 ;
-- test
SELECT *
FROM employee
WHERE (SUBSTRING_INDEX(employee_name, ' ', -1) like 'K%' 
or SUBSTRING_INDEX(employee_name, ' ', -1) like  'H%' 
or  SUBSTRING_INDEX(employee_name, ' ', -1) like 'T%')
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

SELECT CTD.cd_id, C.customer_id, C.customer_name, CType.c_type_name, CT.contract_id,  
CT.date_make_contract, CT.date_end_contract, (S.rental_fee + COALESCE(CTD.cd_qty*ACS.accompanied_fee,0) ) AS total_payment
FROM contract CT
RIGHT JOIN customer C ON CT.customer_id = C.customer_id
INNER JOIN customer_type CType ON CType.type_id = C.customer_type_id
LEFT JOIN service S ON S.service_id = CT.service_id
LEFT JOIN contract_detail CTD ON CT.contract_id = CTD.contract_id
LEFT JOIN accompanied_service ACS ON CTD.accompanied_id = ACS.accompanied_id;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được 
-- Khách hàng thực hiện đặt (từ TRONG quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select S.service_id, S.service_name, S.area, S.rental_fee, SType.type_name
from service S 
LEFT join service_type SType on S.service_type_id = SType.type_id
where not exists (select * from contract C where C.service_id = S.service_id
and date_make_contract between '2019-01-01' and '2019-03-31');

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả 
-- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  
-- trong năm 2019.
select  DISTINCT (S.service_id), S.service_id, S.service_name, S.area, S.rental_fee, SType.type_name
from service S 
INNER join service_type SType on S.service_type_id = SType.type_id
where exists (select * from contract C where C.service_id = S.service_id
and (YEAR(date_make_contract) = 2019)
 );
 
SELECT S.service_id, S.service_name, S.area, S.rental_fee, SType.type_name
FROM service S
INNER JOIN service_type SType ON S.service_type_id = SType.type_id
INNER JOIN  contract CT  ON CT.service_id = S.service_id
WHERE year(CT.date_make_contract) = 2018
AND CT.service_id NOT IN (
SELECT service_id 
FROM contract 
WHERE YEAR (date_make_contract) = '2019'
);

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- C1:
SELECT DISTINCT customer_name
FROM customer;
-- C2:
SELECT customer_name
FROM customer
group by customer_name;
-- C3:
SELECT customer_name
FROM customer
UNION
SELECT customer_name
FROM customer;

-- 9.	Lấy ra số lượng HĐ trong mỗi tháng của năm 2019
SELECT MONTH (date_make_contract) AS 'Month' , COUNT(contract_id) AS number_of_contract
FROM contract 
WHERE YEAR (date_make_contract) = 2019
GROUP BY (MONTH (date_make_contract));

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
--  (được tính dựa trên việc count các IDHopDongChiTiet).
SELECT C.contract_id, C.date_make_contract,C.date_end_contract,C.deposit, COUNT(CD.cd_id) AS accompanied_number
FROM contract_detail CD
RIGHT JOIN contract C ON C.contract_id = CD.contract_id
GROUP BY contract_id;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” 
-- và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
SELECT ACS.accompanied_id, ACS.accompanied_name, C.customer_name, CType.c_type_name
FROM accompanied_service ACS
INNER JOIN contract_detail CD ON ACS.accompanied_id = CD.accompanied_id
INNER JOIN contract CT ON  CD.contract_id = CT.contract_id
INNER JOIN customer C ON CT.customer_id = C.customer_id
INNER JOIN customer_type CType ON CType.type_id = C.customer_type_id
WHERE CType.c_type_name = 'Diamond'  AND address IN ('Vinh', 'Quảng Ngãi');

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
-- 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
SELECT CT.contract_id, E.employee_name, C.customer_name, C.phone, S.service_id, S.service_name, CT.deposit, COUNT(CD.cd_id) AS accompanied_number
FROM contract CT
INNER JOIN employee E ON E.employee_id = CT.employee_id
INNER JOIN customer C ON C.customer_id = CT.customer_id
INNER JOIN service S ON S.service_id = CT.service_id
INNER JOIN contract_detail CD ON CT.contract_id = CD.contract_id
WHERE  (CT.date_make_contract BETWEEN '2019-10-01' AND '2019-12-31') 
AND S.service_id NOT IN (
SELECT service_id
FROM contract
WHERE date_make_contract BETWEEN '2019-01-01' AND '2019-06-30'
)
-- AND NOT EXISTS (
-- SELECT service_id
-- FROM contract CT
-- WHERE CT.service_id = S.service_id  and (date_make_contract  BETWEEN '2019-01-01' AND '2019-06-30')
-- )
GROUP BY CT.contract_id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số 
-- lần sử dụng nhiều như nhau).  
SELECT ACS.accompanied_id,ACS.accompanied_name, COUNT(CD.accompanied_id) AS user_times
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
GROUP BY ACS.accompanied_id
HAVING COUNT(CD.accompanied_id) >= ALL (
SELECT COUNT(CD.accompanied_id)  
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
GROUP BY ACS.accompanied_id);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, 
-- TenDichVuDiKem, SoLanSuDung.

SELECT ACS.accompanied_id,ACS.accompanied_name, COUNT(CD.accompanied_id) AS user_times
FROM contract_detail  CD
INNER JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
GROUP BY ACS.accompanied_id
HAVING COUNT(CD.accompanied_id) = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được TỐI ĐA 3 hợp
--  đồng từ năm 2018 đến 2019.  COUNT(hd_id) , GROUP BY(NhanVien_id) 
SELECT E.employee_id, E.employee_name, L.level_name, S.section_name, E.phone, E.address, COUNT(CT.contract_id) AS contract_numbers
FROM employee E
INNER JOIN `level` L ON L.level_id = E.level_id
INNER JOIN section S ON S.section_id = E.section_id
INNER JOIN contract CT ON CT.employee_id = E.employee_id
WHERE CT.date_make_contract BETWEEN '2018-01-01' AND '2019-12-31'
GROUP BY E.employee_id
HAVING COUNT(CT.contract_id) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM employee E
WHERE E.employee_id NOT IN (
SELECT employee_id
FROM contract
WHERE date_make_contract BETWEEN '2017-01-01' AND '2019-12-31'
-- GROUP BY employee_id
IS NOT NULL
);
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang LÀ  Platinium -->  Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng 
-- Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ. 
-- TenLoaiKhachHang : CType --> đặt phòng+ tổng Tiền: ==> Contract - ACS - Service

CREATE TEMPORARY TABLE IF NOT EXISTS temp 
(
SELECT  CD.cd_id,CT.contract_id, CT.customer_id, C.customer_name,C.customer_type_id, CT.date_end_contract, 
service_name, SUM(S.rental_fee+ COALESCE(CD.cd_qty*ACS.accompanied_fee,0)) AS total_payment
FROM contract CT
LEFT JOIN customer C ON CT.customer_id = C.customer_id
LEFT JOIN service S ON CT.service_id = S.service_id
LEFT JOIN contract_detail CD ON CT.contract_id = CD.contract_id
LEFT JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
WHERE  YEAR(CT.date_end_contract) = 2019  AND  C.customer_type_id = (select type_id from customer_type where c_type_name = 'Platinium')
GROUP BY C.customer_id
HAVING SUM(S.rental_fee+COALESCE(CD.cd_qty*ACS.accompanied_fee,0)) >= 10
);

select*from temp;

UPDATE customer
SET customer_type_id = (select type_id from customer_type where c_type_name = 'Diamond')
WHERE customer_id IN  (
SELECT  customer_id
FROM temp
);

DROP TABLE temp;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
-- C1: xóa parent row , NHƯNG không xóa child-row:
SET FOREIGN_KEY_CHECKS=0;   -- tắt kiểm tra FK
DELETE 
FROM customer
WHERE customer_id IN  (
SELECT customer_id 
FROM contract
WHERE date_make_contract  < '2016-01-01'
);
-- C2: set trực tiếp khóa ngoại ở code CREATE (table contract) 'ON DELETE CASCADE' --> Nhưng: child-row cũng sẽ bị xóa

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
CREATE TEMPORARY TABLE IF NOT EXISTS temp_accompanied (
SELECT ACS.accompanied_id, ACS.accompanied_name, ACS.accompanied_fee, CT.date_make_contract, SUM(CD.cd_qty) AS use_times
FROM contract_detail CD
INNER JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
INNER JOIN contract CT ON CT.contract_id = CD.contract_id
WHERE YEAR(CT.date_make_contract) = 2019
GROUP BY CD.accompanied_id
HAVING  SUM(CD.cd_qty) >= 10
);
select * from temp_accompanied;
UPDATE accompanied_service
SET accompanied_fee = accompanied_fee*2
WHERE accompanied_id IN (
SELECT accompanied_id
FROM temp_accompanied 
);

DROP TABLE temp_accompanied;

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), 
-- HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
SELECT employee_id, employee_name, email, phone, date_of_birth, address
FROM employee
UNION 
SELECT customer_id, customer_name, email, phone, date_of_birth, address
FROM customer;

-- 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng 
-- cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”
CREATE VIEW view_employee AS
SELECT E.employee_id, E.employee_name,E.position_id, E.level_id,E.section_id,E.date_of_birth,E.id_card,E.address, CT.date_make_contract
FROM employee E
INNER JOIN contract CT ON CT.employee_id = E.employee_id
WHERE address LIKE '%Hải Châu%' AND CT.date_make_contract = '2019-12-12';

SELECT* FROM view_employee;

-- 22. Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành
-- “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE view_employee
SET address = 'Liên Chiểu, Đà Nẵng'
WHERE address = 'Hải Châu, Đà Nẵng'; 

SELECT* FROM view_employee;

-- 23.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1
--  tham số của Sp_1
delimiter //
CREATE PROCEDURE Sp_1 (id INT)
BEGIN
DELETE 
FROM customer
WHERE customer_id = id;
END;
// delimiter ;

CALL Sp_1 (1);
-- 24.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ 
-- liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
drop procedure Sp_2;
delimiter //
CREATE PROCEDURE Sp_2(employee_id INT,
customer_id INT,
service_id INT,
date_make_contract DATE,
date_end_contract DATE,
deposit INT)
 BEGIN
 IF employee_id IN (SELECT employee_id  FROM employee) 
 AND customer_id IN (SELECT customer_id  FROM customer) 
 AND service_id IN (SELECT service_id  FROM service) 
 THEN
 INSERT INTO contract (employee_id,customer_id,service_id ,date_make_contract,date_end_contract,deposit)
 VALUE (employee_id,customer_id,service_id ,date_make_contract,date_end_contract,deposit);
 else 
--  select 'Warning: foreign key value is not available!';
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: foreign key value is not available!';
end if;
end; 
 // delimiter ; 
--  ELSE
--  SELECT 'Warning: foreign key value is not available!';
-- --  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: foreign key value is not available!';
--  END IF;
--  END; 

CALL Sp_2 (2,2,2, '2017-11-03', '2017-11-07', 6);
CALL Sp_2 (15,25,35, '2017-11-03', '2017-11-07', 6);

-- 25.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong
--  ra giao diện console của database
DROP TRIGGER IF EXISTS Tr_1;
delimiter //
CREATE TRIGGER Tr_1 
AFTER DELETE  
ON contract for each row 
BEGIN
DECLARE result INT;
SET @result = (SELECT COUNT(contract_id) FROM contract);
END;
 // delimiter ; 
 
DELETE 
FROM contract
where contract_id = 17;
SELECT @result;

-- 36.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in
-- ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database
DROP TRIGGER IF EXISTS Tr_2;
delimiter //
CREATE TRIGGER Tr_2
BEFORE UPDATE  
ON contract for each row 
BEGIN 
DECLARE message VARCHAR(150);
SET message = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
IF (DATEDIFF (new.date_end_contract, old.date_make_contract) < 2) THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = message;
END IF;
END;
 // delimiter ; 
 UPDATE contract
 SET date_end_contract = '2019-12-13'
 WHERE contract_id = 2;
--  37.	Tạo user function thực hiện yêu cầu sau:
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
DELIMITER  //
DROP function IF EXISTS func_1;
CREATE FUNCTION func_1 () 
RETURNS INT
DETERMINISTIC
BEGIN 
declare result INT;
SET result = (
SELECT COUNT(service_id) 
FROM  
(SELECT S.service_id, CT.contract_id, SUM(S.rental_fee) as total_payment, COUNT(ct.service_id) 
FROM contract CT 
INNER JOIN service S ON CT.service_id = S.service_id
GROUP BY S.service_id
HAVING SUM(S.rental_fee) > 2) AS count_temp
);
RETURN result;
END;
// DELIMITER ;

SELECT func_1();

-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà Khách hàng đã thực hiện
--  thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của 
--  Khách hàng được truyền vào như là 1 tham số của function này.

DELIMITER  //
DROP function IF EXISTS func_2;
CREATE FUNCTION func_2 (p_customer_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN 
declare result INT;
SET result = (
SELECT MAX(DATEDIFF(date_end_contract,date_make_contract))
FROM contract
GROUP BY customer_id   -- ct: 1-1-1 , 2-2, 3  --> 3 nhóm: số 1, số 2, số 3 
HAVING MAX(DATEDIFF(date_end_contract,date_make_contract)) >= (  -- customer_id = 1  -->  CT_01: 2 ngày, CT_02: 4 ngày , CT_03: 6 ngày
SELECT DATEDIFF(date_end_contract,date_make_contract) AS date_diff
FROM contract
WHERE customer_id = 5
ORDER BY date_diff
LIMIT 1
-- GROUP BY contract_id
-- HAVING MAX(DATEDIFF(date_end_contract,date_make_contract)) 
)
);
RETURN result;
END;
// DELIMITER ;
SELECT func_2(1);




-- ------- TEST
DROP function IF EXISTS func_2;

DELIMITER  //
CREATE FUNCTION func_2 (p_customer_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN 
declare result INT;
SET result = (
SELECT DATEDIFF(date_end_contract,date_make_contract) AS date_diff
FROM contract
WHERE customer_id = p_customer_id
ORDER BY date_diff DESC
LIMIT 1
);
RETURN result;
END;
// DELIMITER ;
SELECT func_2(3);

--  38.	Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông
--  tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản ghi 
--  trong bảng HopDong) và những bản liên quan khác.
delimiter //
CREATE PROCEDURE Sp_3()
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM service
WHERE service_id IN (
SELECT service_id
FROM (
SELECT S.service_id
FROM service S
INNER JOIN service_type SType ON S.service_type_id = SType.type_id
INNER JOIN contract CT ON CT.service_id = S.service_id
WHERE SType.type_name = 'Room' AND
CT.date_make_contract BETWEEN '2015-01-01' AND '2019-12-31'
) AS temp
);
END;
// delimiter ;
DROP PROCEDURE Sp_3;
CALL Sp_3();


















