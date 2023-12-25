package com.example.AITest.controller;


import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.User;
import com.example.AITest.util.PasswordUtils;
import org.apache.openjpa.lib.util.StringUtil;

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
@WebServlet("/manage/admin_douserupdate")
public class ModifyUserServlet extends HttpServlet {
	@EJB
	private UserDao userDao;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		Integer id=Integer.parseInt(id2.toString());

		String username = request.getParameter("login_id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");


		if(userDao.selectByName(username,id)>0){
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('用户名已存在!');");
			out.write("location.href='admin_touserupdate'");
			out.write("</script>");
			return;
		}


		//创建用户实体
		User user=new User();
		user.setUserId(id);
		user.setUsername(username);
		// 将加密后的密码保存到数据库的password字段中
		String encryptedPassword="";
		if(StringUtil.isNotEmpty(pwd)){
			if(PasswordUtils.isPasswordValid(pwd)){
				encryptedPassword=PasswordUtils.encryptPassword(pwd);
				user.setPassword(encryptedPassword);
			}else{
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert('密码检验失败!');");
				out.write("location.href='admin_touserupdate'");
				out.write("</script>");
				return;
			}
		}

		user.setEmail(email);
		user.setPhoneNumber(tel);

		try {
			userDao.update(user);
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('资料修改成功！');");
			out.write("location.href='admin_index.jsp'");
			out.write("</script>");
		}catch (Exception e){
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('操作失败');");
			out.write("location.href='reg.jsp'");
			out.write("</script>");
		}

//		request.setAttribute("cpage", request.getParameter("cpage"));
//		request.getRequestDispatcher("admin_usermodify.jsp").forward(request, response);
		
	}

}
