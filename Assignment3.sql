-- Create database test
DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;
-- Create table Position
DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
		DepartmentID 		INT AUTO_INCREMENT,
        DepartmentName 		NVARCHAR(50),
		PRIMARY KEY(DepartmentID)
);

-- Create table Department
DROP TABLE IF EXISTS Position;
CREATE TABLE 		Position
(
		PositionID 			INT AUTO_INCREMENT,
        PositionName 		NVARCHAR(50),
        PRIMARY KEY(PositionID)
);

-- Create table Creator
DROP TABLE IF EXISTS Creator;
CREATE TABLE 		Creator
(
		CreatorID 			INT AUTO_INCREMENT,
        CreatorName 		NVARCHAR(50),
        PRIMARY KEY(CreatorID)
);

-- Create table Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE 		`Account`
(
		AccountID 			INT AUTO_INCREMENT,
        Email 				VARCHAR(50),
        UserName 			VARCHAR(30),
        FullName 			NVARCHAR(30),
        CreateDate 			DATE,
        DepartmentID		INT,
        PositionID			INT,
        PRIMARY KEY(AccountID),
        CONSTRAINT DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
        CONSTRAINT PositionID FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

-- Create table Department
DROP TABLE IF EXISTS `Group`;
CREATE TABLE 		`Group`
(
		GroupID 			INT AUTO_INCREMENT,
        GroupName 			NVARCHAR(50),
        CreatorID			INT,
        CreateDate			DATE,
        PRIMARY KEY(GroupID),
        CONSTRAINT CreatorID FOREIGN KEY (CreatorID) REFERENCES Creator(CreatorID)
);

-- Create table GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE		GroupAccount
(
		GroupID				INT,
        AccountID			INT,
        JoinDate			DATE,
		CONSTRAINT GroupID FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
        CONSTRAINT AccountID FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Create table TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE 		TypeQuestion
(
		TypeID				INT AUTO_INCREMENT,
        TypeName			NVARCHAR(30),
        PRIMARY KEY(TypeID)
);

-- Create table CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE 		CategoryQuestion
(
		CategoryID			INT AUTO_INCREMENT,
        CategoryName		NVARCHAR(30),
        PRIMARY KEY(CategoryID)
);

-- Create table Question
DROP TABLE IF EXISTS Question;
CREATE TABLE		Question
(
		QuestionID 			INT AUTO_INCREMENT,
        Content				NVARCHAR(255),
        CategoryID			INT,
        TypeID				INT,
        CreatorID			INT,
        CreateDate			DATE,
        PRIMARY KEY(QuestionID),
        CONSTRAINT CategoryID FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
        CONSTRAINT TypeID FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
        CONSTRAINT CreatoID FOREIGN KEY (CreatorID) REFERENCES Creator(CreatorID)
);

-- Create table Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE		Answer
(
		AnswerID 			INT AUTO_INCREMENT,
        Content				NVARCHAR(255),
        QuestionID			INT,
        isCorrect			BOOL,
        PRIMARY KEY(AnswerID),
        CONSTRAINT QuestionID FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- Create table Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE		Exam
(
		ExamID				INT AUTO_INCREMENT,
        `Code`				CHAR(2),
        Title				NVARCHAR(30),
        Duration			TIME,
        CreateDate			DATE,
        CategoryID			INT,
        CreatorID			INT,
        PRIMARY KEY(ExamID),
        CONSTRAINT CateID FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
        CONSTRAINT CreatorrID FOREIGN KEY (CreatorID) REFERENCES Creator(CreatorID)
);

-- Create table ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE		ExamQuestion
(
		ExamID 				INT,
        QuestionID			INT,
        CONSTRAINT ExamID FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),        
        CONSTRAINT QuestID FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- Insert to table Department
INSERT INTO Department(DepartmentName) VALUES(N'Khoa công nghệ thông tin');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa xây dựng dân dụng');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa kiến trúc');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa kinh tế quốc tế');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa vật liệu xây dựng');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa điện tử điện lạnh');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa công nghệ sinh học');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa tài chính quốc tế');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa ngoại ngữ');
INSERT INTO Department(DepartmentName) VALUES(N'Khoa quy hoạch xây dựng');
INSERT INTO Department(DepartmentName) VALUES(N'Sale');

-- Insert to table Position
INSERT INTO `Position`(PositionName) VALUES(N'Trưởng khoa');
INSERT INTO `Position`(PositionName) VALUES(N'Phó khoa');
INSERT INTO `Position`(PositionName) VALUES(N'Chủ nhiệm khoa');
INSERT INTO `Position`(PositionName) VALUES(N'Nhân viên');
INSERT INTO `Position`(PositionName) VALUES(N'Giám đốc');
INSERT INTO `Position`(PositionName) VALUES(N'Phó giám đốc');
INSERT INTO `Position`(PositionName) VALUES(N'Chủ tịch');
INSERT INTO `Position`(PositionName) VALUES(N'Developer');
INSERT INTO `Position`(PositionName) VALUES(N'Tester');
INSERT INTO `Position`(PositionName) VALUES(N'PM');

-- Insert to table Account
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvana@gmail.com','nguyenvananuce',N'Nguyễn Văn AA',1,10,'2020-01-01');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvanb@gmail.com','nguyenvanbnuce',N'Nguyễn Văn BBB',2,9,'2020-01-02');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvanc@gmail.com','nguyenvancnuce',N'Nguyễn Văn C',3,8,'2020-01-03');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvand@gmail.com','nguyenvandnuce',N'Nguyễn Văn D',4,7,'2020-01-04');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvane@gmail.com','nguyenvanenuce',N'Nguyễn Văn E',5,6,'2020-01-05');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvanf@gmail.com','nguyenvanfnuce',N'Nguyễn Văn F',6,5,'2020-01-06');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvang@gmail.com','nguyenvangnuce',N'Nguyễn Văn G',7,4,'2020-01-07');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvanh@gmail.com','nguyenvanhnuce',N'Nguyễn Văn H',8,3,'2020-01-08');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvani@gmail.com','nguyenvaninuce',N'Nguyễn Văn I',9,2,'2020-01-09');
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID,CreateDate) 
	VALUES ('nguyenvank@gmail.com','nguyenvanknuce',N'Nguyễn Văn K',10,1,'2020-01-10');
    
-- Insert into table Creator
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị A');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị B');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị C');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị D');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị E');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị F');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị G');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị H');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị I');
INSERT INTO Creator(CreatorName) VALUES(N'Nguyễn Thị K');
    
-- Insert into table Group
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-10');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-11');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-12');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-13');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-14');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-15');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-16');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-17');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-18');
INSERT INTO `Group`(GroupName,CreatorID,CreateDate) VALUES('Group A',1,'2020-02-19');

-- Insert into table GroupAccount
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(1,1,'2020-03-20');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(2,2,'2020-03-21');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(3,3,'2020-03-22');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(4,4,'2020-03-23');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(5,5,'2020-03-24');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(6,6,'2020-03-25');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(7,7,'2020-03-26');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(8,8,'2020-03-27');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(9,9,'2020-03-28');
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate) VALUES(10,10,'2020-03-29');

-- Insert into table TypeQuestion
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 1');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 2');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 3');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 4');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 5');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 6');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 7');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 8');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 9');
INSERT INTO TypeQuestion(TypeName) VALUES(N'Loai 10');

-- Insert into table CategoryQuestion
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 1');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 2');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 3');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 4');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 5');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 6');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 7');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 8');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 9');
INSERT INTO CategoryQuestion(CategoryName) VALUES(N'The loai 10');

-- Insert into table Question
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 1',1,1,1,'2020-04-01');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 2',2,2,2,'2020-04-02');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 3',3,3,3,'2020-04-03');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 4',4,4,4,'2020-04-04');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 5',5,5,5,'2020-04-05');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 6',6,6,6,'2020-04-06');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 7',7,7,7,'2020-04-07');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 8',8,8,8,'2020-04-08');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Câu hỏi 9',9,9,9,'2020-04-09');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) 
	VALUES(N'Không phải câu hỏi',10,10,10,'2020-04-01');
    
-- Insert into table Answer
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 1',1,True);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 2',1,False);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 3',1,True);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 4',1,False);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 5',5,True);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 6',6,False);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 7',7,True);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 8',8,False);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 9',9,True);
INSERT INTO Answer(Content,QuestionID,isCorrect) VALUES(N'Câu trả lời 10',10,False);

-- Insert into table Exam
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('01',N'Tiêu đề 1','01:30','2020-07-01',1,1);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('02',N'Tiêu đề 2','01:31','2020-07-02',2,2);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('03',N'Tiêu đề 3','01:32','2020-07-03',3,3);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('04',N'Tiêu đề 4','01:33','2020-07-04',4,4);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('05',N'Tiêu đề 5','01:34','2020-07-05',5,5);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('06',N'Tiêu đề 6','01:35','2020-07-06',6,6);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('07',N'Tiêu đề 7','01:36','2020-07-07',7,7);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('08',N'Tiêu đề 8','01:37','2020-07-08',8,8);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('09',N'Tiêu đề 9','01:38','2020-07-09',9,9);
INSERT INTO Exam(`Code`,Title,Duration,CreateDate,CategoryID,CreatorID) 
	VALUES('10',N'Tiêu đề 10','00:39','2020-07-10',10,10);
    
-- Insert into table ExamQuestion
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(1,1);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(2,2);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(3,3);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(4,4);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(5,5);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(6,6);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(7,7);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(8,8);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(9,9);
INSERT INTO ExamQuestion(ExamID,QuestionID) VALUES(10,10);

-- Lấy ra tất cả các phòng ban
SELECT * FROM Department;

-- Lấy ra ID của phòng ban Sale;
SELECT DepartmentID FROM Department WHERE DepartmentName LIKE 'Sale';

-- Lấy ra thông tin của Account  có full name dài nhất và sắp xếp giảm dần
SELECT *,LENGTH(FullName) dodaiten FROM Account ORDER BY LENGTH(FullName) DESC;

-- Lấy ra thông itn của Account có fullname dài nhất và có id phòng ban = 3
SELECT *,LENGTH(FullName) dodaiten FROM Account 
	WHERE DepartmentID = 3 ORDER BY LENGTH(FullName) DESC LIMIT 1;
    
-- Lấy ra tên Group tham gia trước ngày 20/12/2019
SELECT GroupName FROM `Group` WHERE CreateDate < '2019-12-20';

-- Lấy ra ID của Question có >= 4 câu trả lời
SELECT q.QuestionID FROM Question q INNER JOIN Answer a ON 
	a.QuestionID = q.QuestionID GROUP BY q.QuestionID HAVING COUNT(*)>=4;
    
-- Lấy ra các mã đề thi có thời gian thi >=60 phút và được tạo trước ngày 20/12/2019
SELECT `Code` FROM Exam WHERE Duration >= '01:00' AND CreateDate > '2019-12-20';

-- Lấy ra 5 group  được tạo gần đây nhất
SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

-- Đếm số nhân viên thuộc khoa có id =2
SELECT COUNT(*) FROM Department d INNER JOIN `Account` a ON d.DepartmentID = a.DepartmentID 
	WHERE a.DepartmentID = 2;

-- Lấy ra tên nhân viên bắt đầu bằng D và kết thúc bằng o
SELECT * FROM `Account` WHERE FullName LIKE 'D%o';

-- Xóa tất cả các exam được tạo trước ngày 20/12-2019
COMMIT;
DELETE FROM Exam WHERE CreateDate < '2019-12-20';

-- Xóa tất cả các câu hỏi có nội dung bắt đầu bằng "Câu hỏi"
DELETE FROM Question WHERE Content LIKE N'Câu hỏi%';
UPDATE `Account` SET FullName = N'Nguyễn Bá Lộc', Email = 'oc.nguyenba@vti.com.vn' WHERE AccountID = 5;
UPDATE `Account` SET DepartmentID = 4 WHERE AccountID = 5;
