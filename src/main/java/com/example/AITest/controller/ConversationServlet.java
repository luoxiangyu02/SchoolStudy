package com.example.AITest.controller;

import com.example.AITest.bean.SessionMessageBean;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/api/session")
public class ConversationServlet extends HttpServlet {
    @EJB
    private SessionMessageBean sessionMessageBean;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

        String type = request.getParameter("type");
        if (type.equals("interact")) {

            // 获取用户输入的对话内容
            String userInput = request.getParameter("userInput");
            // 调用 ConversationBean 进行会话交互
            String aiResponse = sessionMessageBean.interact(userInput);

            // 将 AI 的响应返回给前台页面
            response.setContentType("text/plain");
            response.getWriter().write(aiResponse);

        } else if (type.equals("endSession")) {

            // 获取用户输入的对话内容
            HttpSession session = request.getSession();
            Object id2 = session.getAttribute("userId");
            if(id2==null){
                response.setContentType("text/plain");
                response.getWriter().write("用户未登录");
                return;
            }
            Integer id=Integer.parseInt(id2.toString());
            // 调用 ConversationBean 进行会话交互
            Integer sessionId=sessionMessageBean.endSession(id);
            session.setAttribute("tsessionId",sessionId);
            // 将 AI 的响应返回给前台页面
            response.setContentType("text/plain");
            response.getWriter().write("ok");

        } else {
            // 处理其他请求类型
            // 可根据需要定义其他的请求类型和处理逻辑
        }


    }
}

