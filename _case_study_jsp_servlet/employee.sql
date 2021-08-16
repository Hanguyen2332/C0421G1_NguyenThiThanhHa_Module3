USE furama_management_jsp_servlet;

-- /position
select position_id,position_name
from position;

-- //division
select division_id,division_name
from division;

-- //degree
select education_degree_id,education_degree_name
from education_degree;

-- //INSERT
INSERT INTO employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,
division_id)
VALUE ("Trần Minh Phú","1986-07-11","123456789",8000000,"0913337770","phu@furama.com","Huế",1,2,3);

-- //tim findById
select employee_id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,
division_id,user_name
FROM employee 
WHERE employee_id = 9;

-- //employee select:
select employee_id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,E.position_id,E.education_degree_id,
E.division_id,user_name,Edu.education_degree_name,D.division_name,P.position_name
FROM employee E 
INNER JOIN education_degree Edu ON Edu.education_degree_id = E.education_degree_id
INNER JOIN division D ON D.division_id = E.division_id
INNER JOIN position P ON P.position_id = E.position_id;


-- //delete
DELETE 
FROM employee
WHERE employee_id = 2;

-- //update
UPDATE employee
SET employee_name = "Phạm Quốc Anh",employee_birthday = "1978-11-10",employee_id_card = '120056700' ,employee_salary = 12000000,employee_phone = '0913338888',
employee_email = 'quocanh@furama.com',employee_address = "Cần Thơ",position_id = 2, education_degree_id = 3,
division_id = 2,user_name = null
WHERE employee_id = 9;