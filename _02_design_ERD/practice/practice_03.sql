DROP DATABASE IF EXISTS student_managemant2;
CREATE DATABASE student_managemant2;
USE student_managemant2;
CREATE TABLE class (
class_id INT PRIMARY KEY auto_increment,
class_name VARCHAR(60) NOT NULL,
start_day DATETIME NOT NULL,
`status` BIT
);

CREATE TABLE student (
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(30) NOT NULL,
address VARCHAR (50),
phone VARCHAR(20),
`status` BIT,
class_id INT NOT NULL,
FOREIGN KEY (class_id) references class(class_id)
);

CREATE TABLE `subject` (
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(30) NOT NULL,
credit tinyint NOT NULL default 1 check (credit>=1),
`status` BIT default 1
);

CREATE TABLE mark (
mark_id INT PRIMARY KEY auto_increment,
sub_id INT NOT NULL,
FOREIGN KEY (sub_id) references  `subject` (sub_id),
student_id INT NOT NULL,
FOREIGN KEY (student_id) references  student (student_id),
mark FLOAT DEFAULT 0 CHECK  (mark between 0 AND 100), 
exam_times TINYINT DEFAULT 1,
UNIQUE (sub_id,student_id)
);