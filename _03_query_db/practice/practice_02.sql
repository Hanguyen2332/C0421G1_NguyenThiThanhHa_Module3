USE student_managemant2;
-- display all student:
SELECT*FROM student;

-- display students are studying:
SELECT*FROM student
WHERE `status` = true;

-- display Subjects have credit >=10h:
SELECT*FROM `subject`
WHERE credit < 10;

-- display students of class A1:
SELECT student_id, student_name, class_name
FROM student
INNER JOIN class ON student.class_id = class.class_id
WHERE class.class_name = 'A1';

-- display mark's 'CF':
SELECT S.student_id, S.student_name, SB.sub_name, M.mark
FROM mark M
INNER JOIN student S ON M.student_id = S.student_id
INNER JOIN `subject` SB ON M.sub_id = SB.sub_id
WHERE SB.sub_name = 'CF';

