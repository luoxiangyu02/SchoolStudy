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
 * Servlet implementation class Register
 */
@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
	@EJB
	private UserDao userDao;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符集
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("login_id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");


		User user=userDao.selectByAll(username,email,tel);
		if(user==null){
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('资料验证失败！');");
			out.write("location.href='forgotPassword.jsp'");
			out.write("</script>");
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("tuserId", user.getUserId());

		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("location.href='resetPassword.jsp'");
		out.write("</script>");

	}

}
