package com.mvc.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.time.LocalDateTime;
//import java.sql.Timestamp;

import java.util.ArrayList;

import com.mvc.bean.AssignmentBean;
import com.mvc.bean.UserBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

	public String addAssignment(AssignmentBean assignmentBean)
	{
		String moduleCode = assignmentBean.getModuleCode();
		String moduleTitle = assignmentBean.getModuleTitle();
		String description = assignmentBean.getDescription();
		String date = assignmentBean.getDate();
		String un = assignmentBean.getUn();

		Connection con = null;
		PreparedStatement preparedStatement = null;

		try
		{

			con = DBConnection.createConnection();
			String query = "insert into assignment(modulecode,moduletitle,duedate,assignmentdesc,unam) values (?,?,?,?,?)";
			preparedStatement = con.prepareStatement(query); 
			preparedStatement.setString(1, moduleCode);
			preparedStatement.setString(2, moduleTitle);
			preparedStatement.setString(3,  date);
			preparedStatement.setString(4, description);
			preparedStatement.setString(5, un);
			// preparedStatement.setString(4, password);

			int i= preparedStatement.executeUpdate();

			if (i != 0)
				return "SUCCESS"; 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return "Please input all the fields";
	}

	public String registerUser(UserBean registerBean)
	{
		String name = registerBean.getName();
		String uname = registerBean.getUsername();
		String password = registerBean.getPassword();

		Connection con = null;
		PreparedStatement preparedStatement = null;

		try
		{
			con = DBConnection.createConnection();
			String query = "insert into user(uname,name,password) values (?,?,?)";
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, uname);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, password);

			int i = preparedStatement.executeUpdate();

			if (i != 0)
				return "SignUp Successfully ! Please Log In to continue"; 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return "Something Wrong Try Again";
	}

	public String authenticateUser(UserBean loginBean)
	{

		String userName = loginBean.getUsername();
		String password = loginBean.getPassword();

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String userNameDB = "";
		String passwordDB = "";

		try
		{
			con = DBConnection.createConnection();
			statement = con.createStatement(); 
			resultSet = statement.executeQuery("select uname,password from user"); 

			while(resultSet.next())
			{
				userNameDB = resultSet.getString("uname"); 
				passwordDB = resultSet.getString("password");

				if(userName.equals(userNameDB) && password.equals(passwordDB))
				{
					return "SUCCESS";
				}
			}
		}

		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return "Invalid user credentials";
	}

	public ArrayList<AssignmentBean> getAssignments(String mcode, String mtitle, String desc, String date)
	{
		ArrayList<AssignmentBean> arr=new ArrayList<>();
		Connection con = null;
		PreparedStatement preparedStatement = null;

		try
		{
			con = DBConnection.createConnection();
			String query = "select * from assignment where moduletitle=? and modulecode=? and assignmentdesc=? and date=?";
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, mcode);
			preparedStatement.setString(2, mtitle);
			preparedStatement.setString(3, desc);
			preparedStatement.setString(4, date);

			ResultSet result=preparedStatement.executeQuery();

			while(result.next())
			{
				AssignmentBean f=new AssignmentBean();

				f.setModuleCode(mcode);
				f.setModuleTitle(mtitle);
				f.setDescription(desc);

				arr.add(f);
			}
			System.out.println("Arr" + arr);
			return arr;
		}

		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return arr;
	}
}