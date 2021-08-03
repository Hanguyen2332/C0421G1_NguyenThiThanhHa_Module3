-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang LÀ  Platinium -->  Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng 
-- Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ. 
-- TenLoaiKhachHang : CType --> đặt phòng+ tổng Tiền: ==> Contract - ACS - Service

-- BAD WAY (3 lỗi) : 1241. Operand should contain 1 column(s)  // 


UPDATE customer
SET customer_type_id = (select type_id from customer_type where c_type_name = 'Diamond')
WHERE (
SELECT  CD.cd_id,CT.contract_id, CT.customer_id, C.customer_name,C.customer_type_id, CT.date_end_contract, 
service_name, SUM(S.rental_fee+ COALESCE(CD.cd_qty*ACS.accompanied_fee)) AS total_payment
FROM contract CT
LEFT JOIN customer C ON CT.customer_id = C.customer_id
-- LEFT JOIN customer_type CType ON CType.type_id = C.customer_type_id
LEFT JOIN service S ON CT.service_id = S.service_id
LEFT JOIN contract_detail CD ON CT.contract_id = CD.contract_id
LEFT JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
WHERE  YEAR(CT.date_end_contract) = 2019  AND  C.customer_type_id = (select type_id from customer_type where c_type_name = 'Platinium')
GROUP BY C.customer_id
HAVING SUM(S.rental_fee+CD.cd_qty*ACS.accompanied_fee) >= 10
);

-- GOOD WAY (XEM VIDEO): 

CREATE TEMPORARY TABLE IF NOT EXISTS temp 
(
SELECT CD.cd_id,CT.contract_id, CT.customer_id, C.customer_name,C.customer_type_id, CT.date_end_contract, 
service_name, SUM(S.rental_fee+ COALESCE(CD.cd_qty*ACS.accompanied_fee)) AS total_payment
FROM contract CT
LEFT JOIN customer C ON CT.customer_id = C.customer_id
-- LEFT JOIN customer_type CType ON CType.type_id = C.customer_type_id
LEFT JOIN service S ON CT.service_id = S.service_id
LEFT JOIN contract_detail CD ON CT.contract_id = CD.contract_id
LEFT JOIN accompanied_service ACS ON ACS.accompanied_id = CD.accompanied_id
WHERE  YEAR(CT.date_end_contract) = 2019  AND  C.customer_type_id = (select type_id from customer_type where c_type_name = 'Platinium')
GROUP BY C.customer_id
HAVING SUM(S.rental_fee+CD.cd_qty*ACS.accompanied_fee) >= 10
);

SELECT * from temp;

UPDATE customer
SET customer_type_id = (select type_id from customer_type where c_type_name = 'Diamond')
WHERE customer_id IN (
SELECT  customer_id
FROM temp
);