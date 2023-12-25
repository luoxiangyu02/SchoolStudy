package com.example.AITest.bean;

import com.example.AITest.dao.SessionDao;
import com.example.AITest.dao.SessionMessageDao;
import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionEvaluation;
import com.example.AITest.entity.SessionMessage;
import com.example.AITest.entity.User;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.inject.Inject;
import javax.jms.JMSException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 会话交互功能
 */
@Stateful
public class SessionMessageBean {
    @EJB
    private SessionDao sessionDao;
    @EJB
    private SessionMessageDao sessionMessageDao;
    @EJB
    private SessionEvaluationSender evaluationSender;


    private List<SessionMessage> sessionMessagess;
    private LocalDateTime startDate;

    @PostConstruct
    public void init() {
        sessionMessagess = new ArrayList<>();
        startDate=LocalDateTime.now();

    }

    public String interact(String userInput) {
        // 创建 JAX-RS 客户端
        Client client = ClientBuilder.newClient();

        // 指定 Web 服务的基本 URL
        String baseUrl = "http://localhost:8083/AITest-1.0-SNAPSHOT/api/webService";

        // 创建 Web 目标，指定 Web 服务的具体资源路径
        WebTarget target = client.target(baseUrl).path("/interact");

        // 发送 POST 请求并获取响应
        String response = target.request(MediaType.TEXT_PLAIN)
                .post(Entity.text(userInput), String.class);

        // 关闭客户端
        client.close();

        // 将用户输入和 AI 响应保存到当前会话中
        SessionMessage sessionMessages = new SessionMessage();
        sessionMessages.setUserInput(userInput);
        sessionMessages.setContent(response);
        sessionMessages.setSendTime(new Date());
        sessionMessagess.add(sessionMessages);
        return response;

    }

    public Integer endSession(int id) {
        Session session=new Session();
        User user=new User();
        user.setUserId(id);
        session.setUser(user);
        session.setStartTime(startDate);
        session.setEndTime(LocalDateTime.now());
        sessionDao.save(session);
//        session.
        // 保存当前会话的所有会话内容到数据库中
        for (SessionMessage sessionMessages : sessionMessagess) {
            sessionMessages.setSession(session);
            sessionMessageDao.save(sessionMessages);
        }
        // 清空会话内容
        sessionMessagess.clear();
        return session.getSessionId();
    }


    public String evaluate(Integer sessionId,String content) {
        // 生成评价结果
        SessionEvaluation result = new SessionEvaluation();
        Session session=new Session();
        session.setSessionId(sessionId);
        result.setSession(session);
        result.setContent(content);
        // 发送评价结果
        try {
            evaluationSender.sendEvaluationResult(result);
        } catch (JMSException | IOException e) {
            e.printStackTrace();
        }
        return "ok";
    }

}
