package com.example.AITest.controller;

import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.User;

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
 * Servlet implementation class ToUserUpdate
 */
@WebServlet("/manage/admin_touserupdate")
public class ToUserUpdateServlet extends HttpServlet {
	@EJB
	private UserDao userDao;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		Object id2 = session.getAttribute("userId");
		if(id2==null){
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('用户未登录!');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
			return;
		}
		Long id=Long.parseLong(id2.toString());
		User user=userDao.findById(id);
		request.setAttribute("user", user);
		
		
		request.setAttribute("cpage", request.getParameter("cpage"));
		request.getRequestDispatcher("admin_useradd.jsp").forward(request, response);
		
	}

}
