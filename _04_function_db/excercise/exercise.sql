USE student_managemant2;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất:
SELECT*
FROM `subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.sub_id,S.sub_name, MAX(M.mark)
FROM `subject` S
INNER JOIN mark M ON S.sub_id = M.sub_id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần:
SELECT S.student_id,S.student_name, AVG(M.mark) AS avg_mark
FROM student S
INNER JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id
ORDER BY avg_mark DESC;

