USE sales_management;
-- Insert customer:
INSERT INTO customer (customer_name,customer_age)
VALUES ('Minh Quan',10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

-- Insert Order:
INSERT INTO `order` (customer_id,order_date,order_total_price)
VALUES (1,'2006-03-21',Null),
(2,'2006-03-23', Null),
(1,'2006-03-16', Null);

-- Insert Product:
INSERT INTO product (product_name,product_price)
VALUES ('May Giat',3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

-- Insert OrderDetail:
INSERT INTO order_detail (order_id,product_id,order_qty)
VALUES (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Display:
SELECT order_id,order_date,order_total_price
FROM `order`;
-- Display customer + product:
SELECT OD.order_id, C.customer_name, P.product_name
FROM order_detail OD
INNER JOIN product P ON P.product_id = OD.product_id
INNER JOIN `order` O ON O.order_id = OD.order_id
INNER JOIN customer C ON C.customer_id = O.customer_id;
-- Display customer dit NOT buy any product:
SELECT C.customer_name, O.order_id 
FROM `order` O
RIGHT JOIN customer C ON C.customer_id = O.customer_id
WHERE O.order_id <=> NULL;
-- WHERE O.order_id IS NULL;   -->  if (O.order_id.euqals('NULL'))

-- display order_id, order_date,  total_price
SELECT OD.order_id,  O.order_date, OD.order_qty*P.product_price AS total_price
FROM order_detail OD
INNER JOIN product P ON P.product_id = OD.product_id
INNER JOIN `order` O ON O.order_id = OD.order_id;








