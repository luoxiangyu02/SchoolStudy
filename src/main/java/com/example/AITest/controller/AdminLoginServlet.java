package com.example.AITest.controller;

import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.User;
import com.example.AITest.util.PasswordUtils;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/manage/admin_adminlogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private UserDao userDao;
  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");

		String encryptedPassword= PasswordUtils.encryptPassword(passWord);

		User user = userDao.selectByNM(userName, encryptedPassword);
		
		//System.out.println(userName + "##"+passWord);
		
		if(user!=null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("name", user.getUsername());
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("isLogin", "1");
			session.setAttribute("isAdminLogin", "1");
			session.setAttribute("type", "2");
			//	System.out.println(userName + "##"+passWord);
			response.sendRedirect("../manage/admin_index.jsp");
	
		
			
		}else{
			PrintWriter out = response.getWriter();
			
			out.write("<script>");
			out.write("alert('用户登录失败');");
			out.write("location.href='../manage/admin_login.jsp'");
			out.write("</script>");
			out.close();
		}
	}

}

