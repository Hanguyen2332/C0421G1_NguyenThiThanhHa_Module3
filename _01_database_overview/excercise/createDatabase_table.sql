DROP DATABASE IF EXISTS `student-management`;
CREATE DATABASE `student-management`;
CREATE TABLE `student-management`.`student`(
id INT NOT NULL,
`name` VARCHAR(50) NULL,
`age` INT NULL,
`country` VARCHAR(50) NULL,
PRIMARY KEY (`id`)
);
CREATE TABLE `class`(
`id` INT NOT NULL,
`name` VARCHAR(50) NULL,
PRIMARY KEY (`id`)
);
CREATE TABLE `teacher` (
`id` INT NOT NULL,
`name` VARCHAR(50) NULL,
`age` INT NULL,
`country` VARCHAR(50),
PRIMARY KEY (id)
);


