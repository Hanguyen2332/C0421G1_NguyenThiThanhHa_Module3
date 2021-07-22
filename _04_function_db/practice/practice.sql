USE student_managemant2;

-- Hiển thị số lượng sinh viên ở từng nơi:
SELECT  student_id, student_name, address, count(student_id) AS number_of_student
FROM student
GROUP BY (address);

-- Tính điểm trung bình các môn học của mỗi học viên:
SELECT S.student_id, S.student_name, AVG(M.mark)
FROM student S
INNER JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id,S.student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15:
SELECT S.student_id, S.student_name, AVG(M.mark)
FROM student S
INNER JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id
HAVING AVG (M.mark) >=15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.student_id, S.student_name, AVG(M.mark) AS avg_mark
FROM student S 
INNER JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id
HAVING avg_mark >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);
--
--  10, 10 >= ALL (10, 10)
--      27               >= (22,25,26)     (tuoi >= all ((22,25,26)))
--     27,25,24,23       >= (22,25,26)     (tuoi >= any ((22,25,26))) 
-- NOTE: Lấy cả giá trị của trong chính nhóm ngoặc tròn --> in ra, nếu thỏa mãn ĐK SO SÁNH



