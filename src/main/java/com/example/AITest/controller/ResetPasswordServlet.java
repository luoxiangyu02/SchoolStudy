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
@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
	@EJB
	private UserDao userDao;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符集
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();
		Object tuserId=session.getAttribute("tuserId");
		if(tuserId==null){
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('会话过期!');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
			return;
		}

		Long userId=Long.parseLong(tuserId.toString());
		String pwd = request.getParameter("passWord");

		User user=userDao.findById(userId);
		String encryptedPassword="";

		if(PasswordUtils.isPasswordValid(pwd)){
			encryptedPassword=PasswordUtils.encryptPassword(pwd);
		}else{
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('密码检验失败!');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
			return;
		}


		user.setPassword(encryptedPassword);

		//加入到数据库的用户表中
		try {
			userDao.update(user);
			response.sendRedirect("manage/admin_login.jsp");
		}catch (Exception e){
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('重置密码失败');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
		}

	}

}
