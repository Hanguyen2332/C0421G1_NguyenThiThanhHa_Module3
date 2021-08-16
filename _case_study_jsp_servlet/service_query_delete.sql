use furama_management_jsp_servlet;

INSERT INTO service (service_code,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,
description_other_convenience,pool_area,number_of_floors)
VALUE("DV-0001","Villa-oceanview","60",5000000,6,3,2,"4,5 sao","may say, ket sat, tu lanh",15,2);

-- Service select all-- 
SELECT service_id,service_code,service_name,service_area,service_cost,service_max_people,S.rent_type_id,S.service_type_id,standard_room,
description_other_convenience,pool_area,number_of_floors,rent_type_name,service_type_name
FROM service S
INNER JOIN service_type Stype ON S.service_type_id = Stype.service_type_id
INNER JOIN rent_type Rtype ON S.rent_type_id = Rtype.rent_type_id;



-- select rentType 
select rent_type_id,rent_type_name
from rent_type;

-- select service tYPE 
select service_type_id,service_type_name
from service_type;
--  insert:

select*
FROM service;

















