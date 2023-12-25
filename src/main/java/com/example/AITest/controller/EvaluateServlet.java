package com.example.AITest.controller;

import com.example.AITest.bean.SessionMessageBean;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/api/evaluate")
public class EvaluateServlet extends HttpServlet {
    @EJB
    private SessionMessageBean sessionMessageBean;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        HttpSession session = request.getSession();
        // 获取会话 ID
        Object osessionId = session.getAttribute("tsessionId");
        Integer sessionId=Integer.parseInt(osessionId.toString());
        String content=request.getParameter("score");

        sessionMessageBean.evaluate(sessionId,content);

        PrintWriter out = response.getWriter();
        out.write("<script>");
        out.write("alert('评价成功！');");
        out.write("location.href='../manage/admin_index.jsp'");
        out.write("</script>");
    }
}
