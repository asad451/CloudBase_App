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
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

		if (request.getParameter("uname")=="" || request.getParameter("password")=="" ){
			request.setAttribute("errMessage", "Please Enter username and/or password");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else {
			String userName = request.getParameter("uname");
			String password = request.getParameter("password");

			UserBean loginBean = new UserBean();

			loginBean.setUsername(userName);
			loginBean.setPassword(password);

			RegisterDao loginDao = new RegisterDao();

			String userValidate = loginDao.authenticateUser(loginBean);

			if(userValidate.equals("SUCCESS"))
			{
				request.getSession(true).setAttribute("userName", userName);
				request.getRequestDispatcher("/Home.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("error", userValidate);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}
	}
}
