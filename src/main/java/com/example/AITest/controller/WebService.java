package com.example.AITest.controller;

import com.example.AITest.bean.SessionEvaluationSender;
import com.example.AITest.dao.SessionDao;
import com.example.AITest.dao.SessionMessageDao;
import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionEvaluation;
import com.example.AITest.entity.User;

import javax.ejb.EJB;
import javax.jms.JMSException;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.io.IOException;

/**
 * RESTFul 类型的WebService
 */
@Path("/webService")
public class WebService {
    @POST
    @Path("/interact")
    @Produces("text/plain")
    public String interact(String input) {

        // 根据不同的参数来返回不同的字符串
        if (input.equals("你好")) {
            return "你好呀";
        } else if (input.equals("再见")) {
            return "再见，希望下回再见面！";
        } else if (input.equals("你好吗")) {
            return "我感觉很好，谢谢您！";
        } else if (input.equals("今天星期几")) {
            return "星期一！";
        } else if (input.equals("现在几点了")) {
            return "下午2点了！";
        } else if (input.equals("今天天气如何")) {
            return "今天天气晴！";
        } else if (input.equals("你是谁")) {
            return "我是chatgpt";
        } else if (input.equals("你在哪")) {
            return "我是虚拟存在,属于会话bean";
        } else {
            return input;
        }

    }

}