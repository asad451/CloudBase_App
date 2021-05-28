package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection createConnection()
	{
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/reminder"; //MySQL URL 
		String username = "root"; //MySQL username
		String password = "asad451"; //MySQL password

		try 
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver"); //loading MySQL drivers 
			} 
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			}

			con = DriverManager.getConnection(url, username, password);
			System.out.println("Printing connection object "+con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		return con; 
	}
}