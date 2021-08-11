USE furama_management_jsp_servlet;

INSERT INTO position (position_name)
VALUES ("Lễ tân"),("Phục vụ"), ("Chuyên viên"), ("Giám sát"), ("Quản lý"), ("Giám đốc");

INSERT INTO education_degree (education_degree_name)
VALUES ("Trung cấp"),("Cao đẳng"), ("Đại học"), ("Sau đại học");

INSERT INTO division (division_name)
VALUES ("Sale – Marketing"),("Hành Chính"), ("Phục vụ"), ("Quản lý");

INSERT INTO customer_type (customer_type_name)
VALUES ("Diamond"),("Platinium"), ("Gold"), ("Silver"), ("Member");

INSERT INTO service_type (service_type_name)
VALUES ("Villa"),("House"), ("Room"); 

INSERT INTO rent_type (rent_type_name, rent_type_cost)   -- rent_type_cost ?????????????????? ----
VALUES ("YEAR",),("MONTH"), ("DAY",2000000),("HOUR"); 

-- Ngoài ra, resort còn cung cấp các dịch vụ đi kèm như massage, karaoke, thức ăn, nước uống, thuê xe di chuyển tham quan resort.






