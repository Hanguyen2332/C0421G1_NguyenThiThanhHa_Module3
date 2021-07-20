USE student_managemant2;
-- Display all students have name starts with 'H' literal:
SELECT*FROM student
WHERE student_name LIKE 'H%';

-- Display all classes starting from tháng 12:
SELECT*FROM class
WHERE MONTH(start_day) = 12;

-- Displays all subjects have credit between 3-5. 
SELECT*FROM `subject`
WHERE credit BETWEEN 3 AND 5;

-- Change the ClassID of the student named 'Hung' to 2:
SET SQL_SAFE_UPDATES = 0;
UPDATE student
SET class_id = 2
WHERE student_name = 'Hung';

-- Display student infor:
SELECT S.Student_name, SB.Sub_Name, M.mark
FROM mark M
INNER JOIN student S ON S.student_id = M.student_id
INNER JOIN `subject` SB ON SB.sub_id = M.sub_id
ORDER BY M.mark ASC, S.Student_name DESC;



