USE TestingSystem;

-- Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS SelectAccount;

DELIMITER // 
CREATE PROCEDURE SelectAccount(deName VARCHAR(30))
BEGIN
	SELECT * 
    FROM Account 
    WHERE DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = deName);
END//
DELIMITER ;

CALL SelectAccount('Bảo vệ');

-- Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS CountAccount;

DELIMITER //
CREATE PROCEDURE CountAccount()
BEGIN
	SELECT g.GroupName,COUNT(ga.AccountID) Soluong
    FROM `Group` g
    LEFT JOIN GroupAccount ga
		ON g.GroupID = ga.GroupID
	GROUP BY g.GroupID;
END//
DELIMITER ;

CALL CountAccount();

-- Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại 
DROP PROCEDURE IF EXISTS CountQuestion;

DELIMITER //
CREATE PROCEDURE CountQuestion()
BEGIN
	SELECT tq.TypeName,COUNT(q.QuestionID) Soluong
    FROM TypeQuestion tq
    LEFT JOIN Question q
		ON tq.TypeID = q.TypeID
	WHERE MONTH(q.CreateDate) = 4 -- MONTH(NOW()) nhưng do tháng hiện tại ko có nên đổi thành 4
	GROUP BY tq.TypeID;
END//
DELIMITER ;

CALL CountQuestion();

-- Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
DROP FUNCTION IF EXISTS GetType;

DELIMITER //
CREATE FUNCTION GetType() 
RETURNS TINYINT 
READS SQL DATA
BEGIN
	DECLARE tID TINYINT DEFAULT 0;
	SELECT tq.TypeID
    INTO tID
    FROM TypeQuestion tq
    INNER JOIN Question q 
		ON tq.TypeID = q.TypeID
	GROUP BY q.TypeID
    HAVING COUNT(*) = (SELECT COUNT(*) sl
					  FROM TypeQuestion tq
                      INNER JOIN Question q
						ON tq.TypeID = q.TypeID
					  GROUP BY q.TypeID
                      ORDER BY sl DESC
                      LIMIT 1);
	RETURN tID;
END//
DELIMITER ;

-- Sử dụng store ở trên để tìm ra tên của TypeQuestion
SELECT TypeName 
FROM TypeQuestion 
WHERE TypeID = GetType();

-- Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi đó 
-- hoặc trả về user có username chứa chuỗi đó

DROP PROCEDURE IF EXISTS GetGroupUser;

DELIMITER //
CREATE PROCEDURE GetGroupUser(chuoi VARCHAR(30))
BEGIN
	IF (SELECT GroupName FROM `Group` WHERE GroupName LIKE CONCAT('%',chuoi,'%') LIMIT 1) IS NOT NULL THEN
		SELECT GroupName FROM `Group` WHERE GroupName LIKE CONCAT('%',chuoi,'%');
    ELSE 
		SELECT UserName FROM Account WHERE UserName LIKE CONCAT('%',chuoi,'%');
	END IF;
	
END//
DELIMITER ;

CALL GetGroupUser('VTI');

-- q7
DROP PROCEDURE IF EXISTS UpdateAccount;

DELIMITER //
CREATE PROCEDURE UpdateAccount(fName VARCHAR(50),e VARCHAR(50))
BEGIN
	DECLARE pID TINYINT;
    SELECT PositionID
    INTO pID
    FROM Position
    WHERE PositionName = 'Dev';
	INSERT INTO Account(Email,UserName,FullName,DepartmentID,PositionID)
    VALUES 			   (e,SUBSTRING_INDEX(e,"@",1),fName,1,pID);
    SELECT * FROM Account WHERE FullName = fName;
END//
DELIMITER ;

CALL UpdateAccount('Nguyen Van B','bcd@gmail.com');

-- q8
DROP PROCEDURE IF EXISTS GetMaxContent;

DELIMITER //
CREATE PROCEDURE GetMaxContent(tName VARCHAR(100))
BEGIN
	SELECT *,LENGTH(Content) Dodai
    FROM Question
    WHERE TypeID = (SELECT TypeID 
					FROM TypeQuestion 
                    WHERE TypeName = tName)
	AND LENGTH(Content) = (SELECT LENGTH(Content) 
						   FROM Question 
                           ORDER BY LENGTH(Content) DESC
                           LIMIT 1);
END//
DELIMITER ;

CALL GetMaxContent('Essay');
