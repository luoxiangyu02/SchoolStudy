package com.example.AITest.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestPath = request.getPathInfo();
        if (requestPath.equals("/register")) {
            // 处理用户注册请求
            // 调用相应的DAO和会话Bean完成注册逻辑
            // 获取请求参数，验证数据有效性，插入用户数据到数据库等
        } else if (requestPath.equals("/login")) {
            // 处理用户登录请求
            // 调用相应的DAO和会话Bean完成登录逻辑
            // 获取请求参数，验证用户身份，查询数据库等
        } else if (requestPath.equals("/session")) {
            // 处理会话查询请求
            // 调用相应的DAO完成会话查询逻辑
            // 获取请求参数，查询数据库，返回结果等
        } else {
            // 处理其他请求类型
            // 可根据需要定义其他的请求类型和处理逻辑
        }
    }

}
