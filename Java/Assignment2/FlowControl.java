import java.awt.List;

public class FlowControl 
{
	// Question 1
	public static void question1(Account account)
	{
		if(account.accDepartment == null) 
			System.out.println("Nhan vien nay chua co phong ban!");
		else 
		{
			System.out.println("Nhan vien nay co phong ban la: " + account.accDepartment.departmentName);
		}
	}
	
	// Question 2
	public static void question2(Account acc,GroupAccount[] ga)
	{
		int cnt = 0;
		//List name = new List();
		String[] name = new String[10];
		for (GroupAccount groupAccount : ga)
		{
			if (groupAccount != null)
			{
				if (groupAccount.gaAccount == acc)
				{
					name[cnt] = new String();
					name[cnt] = groupAccount.gaGroup.groupName;
					cnt++;
				}
			}
		}
		switch (cnt)
		{
		case 0:
			System.out.println("Nhan vien nay chua co group!");
			break;
		case 1:
			System.out.println("Group cua nhan vien nay la: " + name[0]);
			break;
		case 2:
			System.out.println("Group cua nhan vien nay la: " + name[0] + ", " + name[1]);
			break;
		case 3:
			System.out.println("Nhan vien nay la nguoi quan trong, tham gia nhieu group!");
			break;
		default:
			System.out.println("Nhan vien nay la nguoi hong chuyen, tham gia tat ca group!");
			break;
		}
	}
	
	// Question 3
	public static void question3(Account account)
	{
		/*
		if(account.accDepartment == null) 
			System.out.println("Nhan vien nay chua co phong ban!");
		else 
		{
			System.out.println("Nhan vien nay co phong ban la: " + account.accDepartment.departmentName);
		}
		*/
		String text = account.accDepartment==null ? 
			"Nhan vien nay chua co phong ban!" : 
			"Nhan vien nay co phong ban la: " + account.accDepartment.departmentName;
		System.out.println(text);
	}
	
	// Question 4
	public static void question4(Account[] acc)
	{
		String text = "";
		text = acc[0].accPosition.positionName.toString() == "DEV" ?
				"Day la Developer" :
				"Day khong phai la Developer";
		System.out.println(text);
	}
	
	//Question 5
	public static void question5(GroupAccount[] ga)
	{
		int cnt=0;
		for (GroupAccount groupAccount : ga)
		{
			if (groupAccount != null)
				cnt++;
		}
		switch (cnt)
		{
		case 1:
			System.out.println("Nhom co 1 thanh vien");
			break;
		case 2:
			System.out.println("Nhom co 2 thanh vien");
			break;
		case 3:
			System.out.println("Nhom co 3 thanh vien");
			break;
		default:
			System.out.println("Nhom co nhieu thanh vien");
			break;
		}
	}
	//Question 6,7 da lam o tren
	
	//Question 8
}
