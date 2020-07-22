
public class Program {

	public static void main(String[] args) {
		// Department
		Department[] depart = new Department[10];
		
		depart[0] = new Department();
		depart[0].departmentID = 1;
		depart[0].departmentName = "marketing";
		
		depart[1] = new Department();
		depart[1].departmentID = 2;
		depart[1].departmentName = "sale";
		
		depart[2] = new Department();
		depart[2].departmentID = 3;
		depart[2].departmentName = "IT";
	
		// Position
		Position[] pos = new Position[10];
		
		pos[0] = new Position();
		pos[0].positionID = 1;
		pos[0].positionName = PositionName.DEV;
		
		pos[1] = new Position();
		pos[1].positionID = 2;
		pos[1].positionName = PositionName.PM;

		pos[2] = new Position();
		pos[2].positionID = 3;
		pos[2].positionName = PositionName.SCRUM;
		
		// Account 
		Account[] acc = new Account[10];
		
		acc[0] = new Account();
		acc[0].accountID = 1;
		acc[0].accDepartment = depart[0];
		acc[0].accPosition = pos[0];
		acc[0].email = "quynhdoan1999@gmail.com";
		acc[0].fullName = "Doan Thi Quynh";
	
		acc[1] = new Account();
		acc[1].accountID = 2;
		acc[1].accDepartment = depart[0];
		acc[1].accPosition = pos[0];
		acc[1].email = "quynhdoan1999@gmail.com";
		acc[1].fullName = "Vu Hoang Phuong";

		acc[2] = new Account();
		acc[2].accountID = 3;
		acc[2].accDepartment = depart[1];
		acc[2].accPosition = pos[1];
		acc[2].email = "cuongpd@gmail.com";
		acc[2].fullName = "Phan Doan Cuong";
		
		// Group
		Group[] group = new Group[10];
		
		group[0] = new Group();
		group[0].groupID = 1;
		group[0].groupName = "C# Fresher";
		group[0].creator = acc[0];
		
		group[1] = new Group();
		group[1].groupID = 2;
		group[1].groupName = "Java Fresher";
		group[1].creator = acc[0];
		
		group[2] = new Group();
		group[2].groupID = 3;
		group[2].groupName = "Python Fresher";
		group[2].creator = acc[1];
				
		// GroupAccount 
		GroupAccount[] ga = new GroupAccount[10];
		
		ga[0] = new GroupAccount();
		ga[0].gaAccount = acc[0];
		ga[0].gaGroup = group[0];
		
		ga[1] = new GroupAccount();
		ga[1].gaAccount = acc[0];
		ga[1].gaGroup = group[0];
		
		ga[2] = new GroupAccount();
		ga[2].gaAccount = acc[0];
		ga[2].gaGroup = group[1];
		
		ga[3] = new GroupAccount();
		ga[3].gaAccount = acc[1];
		ga[3].gaGroup = group[2];
		
		// TypeQuestion
		TypeQuestion[] tq = new TypeQuestion[10];
		
		tq[0] = new TypeQuestion();
		tq[0].typeID = 1;
		tq[0].typeName = TypeName.Essay;
		
		tq[1] = new TypeQuestion();
		tq[1].typeID = 2;
		tq[1].typeName = TypeName.MutipleChoice;
		
		// CategoryQuestion
		CategoryQuestion[] ctg = new CategoryQuestion[10];
		
		ctg[0] = new CategoryQuestion();
		ctg[0].categoryID = 1;
		ctg[0].categoryName = CategoryName.JAVA;
		
		ctg[1] = new CategoryQuestion();
		ctg[1].categoryID = 2;
		ctg[1].categoryName = CategoryName.NET;
		
		ctg[2] = new CategoryQuestion();
		ctg[2].categoryID = 3;
		ctg[2].categoryName = CategoryName.SQL;
		
		// Question
		Question[] ques = new Question[10];
		
		ques[0] = new Question();
		ques[0].questionID = 1;
		ques[0].content = "Noi dung cau hoi 1";
		ques[0].qCategory = ctg[0];
		ques[0].qType = tq[0];
		ques[0].qCreator = acc[0];
		
		ques[1] = new Question();
		ques[1].questionID = 2;
		ques[1].content = "Noi dung cau hoi 2";
		ques[1].qCategory = ctg[1];
		ques[1].qType = tq[1];
		ques[1].qCreator = acc[1];
		
		ques[2] = new Question();
		ques[2].questionID = 3;
		ques[2].content = "Noi dung cau hoi 3";
		ques[2].qCategory = ctg[2];
		ques[2].qType = tq[0];
		ques[2].qCreator = acc[2];
				
		// Answer 
		Answer[] ans= new Answer[10];
		
		ans[0] = new Answer();
		ans[0].answerID = 1;
		ans[0].content = "Noi dung cau tra loi 1";
		ans[0].aQuestion = ques[0];
		ans[0].isCorrect = true;
		
		ans[1] = new Answer();
		ans[1].answerID = 2;
		ans[1].content = "Noi dung cau tra loi 2";
		ans[1].aQuestion = ques[1];
		ans[1].isCorrect = false;
		
		ans[2] = new Answer();
		ans[2].answerID = 3;
		ans[2].content = "Noi dung cau tra loi 3";
		ans[2].aQuestion = ques[2];
		ans[2].isCorrect = true;
		
		// Exam
		Exam[] ex = new Exam[10];
		
		ex[0] = new Exam();
		ex[0].examID = 1;
		ex[0].eCategory = ctg[0];
		ex[0].title = "Tieu de 1";
		ex[0].duration = 90;
		ex[0].eCreator = acc[0];
		ex[0].code = "EX1";
		
		ex[1] = new Exam();
		ex[1].examID = 2;
		ex[1].eCategory = ctg[1];
		ex[1].title = "Tieu de 2";
		ex[1].duration = 120;
		ex[1].eCreator = acc[1];
		ex[1].code = "EX2";
		
		ex[2] = new Exam();
		ex[2].examID = 3;
		ex[2].eCategory = ctg[2];
		ex[2].title = "Tieu de 3";
		ex[2].duration = 60;
		ex[2].eCreator = acc[2];
		ex[2].code = "EX3";
		
		// ExamQuestion
		ExamQuestion[] eq= new ExamQuestion[10];
		
		eq[0] = new ExamQuestion();
		eq[0].eqExam = ex[0];
		eq[0].eqQuestion = ques[0];
		
		eq[1] = new ExamQuestion();
		eq[1].eqExam = ex[0];
		eq[1].eqQuestion = ques[1];
		
		eq[2] = new ExamQuestion();
		eq[2].eqExam = ex[1];
		eq[2].eqQuestion = ques[2];
		
		/* 
		System.out.println ("Thong tin phong ban 1");
		System.out.println("name:"+dep1.departmentName);
		System.out.println("id:"+dep1.departmentID);
		System.out.println("\n");
		*/
		//FlowControl.question1(acc[0]);
		//FlowControl.question2(acc[0], ga);
		//FlowControl.question2(acc[1], ga);
	}
}
