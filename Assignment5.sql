USE TestingSystem;

-- Tạo view có chứa danh sách nhân viên thuộc phòng ban Sale\
CREATE OR REPLACE VIEW Cau1 AS
SELECT * 
FROM Account 
WHERE DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale');

-- Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW Cau2 AS
SELECT a.*, COUNT(*) Soluong
FROM GroupAccount ga
INNER JOIN Account a
	ON ga.AccountID = a.AccountID
GROUP BY a.AccountID
HAVING Soluong = (SELECT COUNT(*) sl 
				  FROM GroupAccount
				  GROUP BY AccountID
                  ORDER BY sl DESC
                  LIMIT 1);

-- Tạo view có chứa câu hỏi có những content quá dài (quá 15 từ) và xóa nó đi
CREATE OR REPLACE VIEW Cau3 AS
SELECT * FROM Question WHERE LENGTH(Content) > 15;

DELETE FROM Question WHERE LENGTH(Content) > 15;

-- Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW Cau4 AS
SELECT d.*,COUNT(*) Soluong
FROM Department d 
INNER JOIN Account a
	ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID
HAVING Soluong = (SELECT COUNT(*) sl
				 FROM Account a
				 GROUP BY DepartmentID
                 ORDER BY sl DESC
                 LIMIT 1);

-- Tạo view có chứa tất cả các câu hỏi do user họ Nguyễn thêm vào
CREATE OR REPLACE VIEW Cau5 AS
SELECT *
FROM Question
WHERE CreatorID IN (SELECT AccountID FROM Account WHERE FullName LIKE 'Nguyen%');