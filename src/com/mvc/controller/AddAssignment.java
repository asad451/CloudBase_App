package com.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.AssignmentBean;
import com.mvc.dao.RegisterDao;

/**
 * Servlet implementation class AddAssignment
 */
//@WebServlet("/AddAssignment")
public class AddAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAssignment() {
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

		ArrayList<AssignmentBean> f=new ArrayList<>();

		String mcode = request.getParameter("mcode");
		String mtitle = request.getParameter("mtitle");
		String desc = request.getParameter("desc");
		String date = request.getParameter("date");
		String un = request.getParameter("un");
		//		 String password = request.getParameter("password");

		AssignmentBean assignmentBean = new AssignmentBean();

		assignmentBean.setModuleCode(mcode);
		assignmentBean.setModuleTitle(mtitle);
		assignmentBean.setDescription(desc);
		assignmentBean.setDate(date);
		assignmentBean.setUn(un);
		//		 registerBean.setPassword(password); 

		RegisterDao registerDao = new RegisterDao();

		String userRegistered = registerDao.addAssignment(assignmentBean);



		if(userRegistered.equals("SUCCESS"))
		{
			f = registerDao.getAssignments(mcode, mtitle, desc, date);
			request.setAttribute("array", f);
			request.getRequestDispatcher("/Home.jsp").forward(request, response);
		}
		else 
		{
			request.setAttribute("error", userRegistered);
			request.getRequestDispatcher("/Home.jsp").forward(request, response);
		}
	}

}
