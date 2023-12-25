package com.example.AITest.controller;

import com.example.AITest.bean.SessionLogBean;
import com.example.AITest.dao.SessionDao;
import com.example.AITest.dao.SessionMessageDao;
import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionMessage;

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
@WebServlet("/manage/sessionDetail")
public class SessionDetailServlet extends HttpServlet {
	@EJB
	private SessionLogBean sessionLogBean;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String sid=request.getParameter("id");
		Integer id=Integer.parseInt(sid);

		List<SessionMessage> list=sessionLogBean.getSessionMessageList(id);
		
		request.setAttribute("plist", list);
		request.getRequestDispatcher("admin_sessionDetail.jsp").forward(request, response);
		
	}

}
