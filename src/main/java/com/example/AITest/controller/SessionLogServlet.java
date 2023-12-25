package com.example.AITest.controller;

import com.example.AITest.bean.SessionLogBean;
import com.example.AITest.dao.SessionDao;
import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.Session;
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
import java.util.List;

/**
 * Servlet implementation class ToUserUpdate
 */
@WebServlet("/manage/sessionLog")
public class SessionLogServlet extends HttpServlet {
	@EJB
	private SessionLogBean sessionLogBean;

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
		List<Session> list=sessionLogBean.getSessionList(id);
		
		
		request.setAttribute("plist", list);
		request.getRequestDispatcher("admin_sessionLog.jsp").forward(request, response);
		
	}

}
