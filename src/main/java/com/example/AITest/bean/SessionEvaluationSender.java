package com.example.AITest.bean;

import com.example.AITest.entity.SessionEvaluation;
import com.google.gson.Gson;

import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.jms.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

// 评价结果发送者
@Stateless
public class SessionEvaluationSender {
    @Resource(name = "EvaluationQueue")
    private Queue evaluationResultQueue;


    @Resource(name = "SessionEvaluationReceiverMDB")
    private Queue sessionEvaluationQuestionQueue;

    @Resource
    private ConnectionFactory connectionFactory;

    public void sendEvaluationResult(SessionEvaluation result) throws JMSException, IOException {
//        context.createProducer().send(evaluationResultQueue, result);

        final Connection connection = connectionFactory.createConnection();
        connection.start();
        final Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        final MessageProducer questions = session.createProducer(sessionEvaluationQuestionQueue);
        // 创建 Gson 实例
        Gson gson = new Gson();
        // 对象转换为 JSON
        String json = gson.toJson(result);
        questions.send(session.createTextMessage(json));

    }

}
