package com.example.AITest.controller;

import com.example.AITest.dao.UserDao;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class UsernameCheck
 */
@WebServlet("/usernamecheck")
public class UsernameCheckServlet extends HttpServlet {
	@EJB
	private UserDao userDao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符集
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String name = request.getParameter("name");
		
		int count = userDao.selectByName(name);
	
		
		PrintWriter out = response.getWriter();
		if(count >0 ){
			out.print("false");
		}else{
			out.print("true");
		}
		
	
		
		out.close();
	}

	

}
