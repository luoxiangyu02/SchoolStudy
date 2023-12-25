package com.example.AITest.service.impl;

import com.example.AITest.bean.SessionEvaluationSender;
import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionEvaluation;
import com.example.AITest.service.AIWebService;

import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.jms.JMSException;
import javax.jws.WebService;
import java.io.IOException;

@RequestScoped
public class AIWebServiceImpl implements AIWebService {


    @EJB
    private SessionEvaluationSender evaluationSender;

    @Override
    public String interact(String input) {
        // 根据不同的参数来返回不同的字符串
        if (input.equals("hello")) {
            return "Hello, how can I assist you?";
        } else if (input.equals("bye")) {
            return "Goodbye, have a nice day!";
        } else {
            return "Sorry, I cannot understand.";
        }
    }

    @Override
    public void evaluate(String content,Integer sessionId) {
        // 生成评价结果
        SessionEvaluation result = new SessionEvaluation();
        Session session=new Session();
        session.setSessionId(sessionId);
        result.setSession(session);
        result.setContent(content);
        // 发送评价结果
        try {
            evaluationSender.sendEvaluationResult(result);
        } catch (JMSException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
