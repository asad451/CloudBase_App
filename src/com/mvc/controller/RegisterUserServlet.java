package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.UserBean;
import com.mvc.dao.RegisterDao;

/**
 * Servlet implementation class RegisterUserServlet
 */
//@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("uname")=="" || request.getParameter("password")=="" || request.getParameter("name")==""){
			request.setAttribute("error", "Please Enter all fields");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else {
			
			String name = request.getParameter("name");
			String userName = request.getParameter("uname");
			String password = request.getParameter("password");

			UserBean registerBean = new UserBean();

			registerBean.setName(name);
			registerBean.setUsername(userName);
			registerBean.setPassword(password); 

			RegisterDao registerDao = new RegisterDao();

			String userRegistered = registerDao.registerUser(registerBean);

			if(userRegistered.equals("SUCCESS"))
			{
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("error", userRegistered);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}

		}
		
	}

}
