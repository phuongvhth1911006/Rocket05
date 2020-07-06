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

