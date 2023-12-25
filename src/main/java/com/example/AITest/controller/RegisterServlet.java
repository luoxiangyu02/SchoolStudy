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
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@EJB
	private UserDao userDao;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置字符集
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("login_id");
		String pwd = request.getParameter("passWord");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

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


		//创建用户实体
		User user=new User();
		user.setUsername(username);
		// 将加密后的密码保存到数据库的password字段中
		user.setPassword(encryptedPassword);
		user.setEmail(email);
		user.setPhoneNumber(tel);
		
		//加入到数据库的用户表中
		try {
			userDao.save(user);
			response.sendRedirect("manage/admin_login.jsp");
		}catch (Exception e){
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('用户注册失败');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
		}

	}

}
