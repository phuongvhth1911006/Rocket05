
public class Program {

	public static void main(String[] args) {
		// Department
		Department dep1 = new Department();
		dep1.departmentID = 1;
		dep1.departmentName = "marketing";
	
		// Position
		Position pos1 = new Position();
		pos1.positionID = 1;
		pos1.positionName = PositionName.DEV;
			
		// Account 
		Account acc1 = new Account();
		acc1.accountID = 1;
		acc1.accDepartment = dep1;
		acc1.accPosition = pos1;
		acc1.email = "quynhdoan1999@gmail.com";
		acc1.fullName = "Vu Hoang Phuong";
	
				
		// Group
		Group group1= new Group();
		group1.groupID = 1;
		group1.groupName = "C# Fresher";
		group1.creator = acc1;
		
		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "Java Fresher";
		group1.creator = acc1;
				
		// GroupAccount 
		GroupAccount ga1= new GroupAccount();
		ga1.gaAccount = acc1;
		ga1.gaGroup = group1;
		
		GroupAccount ga2 = new GroupAccount();
		ga2.gaAccount = acc1;
		ga2.gaGroup = group2;
		
		// TypeQuestion
		TypeQuestion tq1 = new TypeQuestion();
		tq1.typeID = 1;
		tq1.typeName = TypeName.Essay;
		
		TypeQuestion tq2= new TypeQuestion();
		tq2.typeID = 2;
		tq2.typeName = TypeName.MutipleChoice;
		
		
		// CategoryQuestion
		CategoryQuestion ctg = new CategoryQuestion();
		ctg.categoryID = 1;
		ctg.categoryName = CategoryName.JAVA;
		
		// Question
		Question ques1 = new Question();
		ques1.questionID = 1;
		ques1.content = "Noi dung cau hoi 1";
		ques1.qCategory = ctg;
		ques1.qType = tq1;
		ques1.qCreator = acc1;
		
				
		// Answer 
		Answer ans1= new Answer();
		ans1.answerID = 1;
		ans1.content = "Noi dung cau tra loi1";
		ans1.aQuestion = ques1;
		ans1.isCorrect = true;
		
		
		
		// Exam
		Exam ex1 = new Exam();
		ex1.examID = 1;
		ex1.eCategory = ctg;
		ex1.title = "Tieu de 1";
		ex1.duration = 90;
		ex1.eCreator = acc1;
		ex1.code = "EX1";
		
		
		// ExamQuestion
		ExamQuestion eq1= new ExamQuestion();
		eq1.eqExam = ex1;
		eq1.eqQuestion = ques1;
		
		// 
		System.out.println ("Thong tin phong ban 1");
		System.out.println("name:"+dep1.departmentName);
		System.out.println("id:"+dep1.departmentID);
		System.out.println("\n");
		
	}
}
