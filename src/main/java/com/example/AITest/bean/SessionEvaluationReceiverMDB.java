package com.example.AITest.bean;

import com.example.AITest.entity.SessionEvaluation;
import com.google.gson.Gson;

import javax.annotation.Resource;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

// 评价结果接收者 MDB
//@MessageDriven(
//        activationConfig = {
//                @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
//                @ActivationConfigProperty(propertyName = "destination", propertyValue = "FooQueue"),
//                @ActivationConfigProperty(propertyName = "resourceAdapter", propertyValue = "MyJmsResourceAdapter")
////        @ActivationConfigProperty(propertyName = "connectionFactoryJndiName", propertyValue = "MyConnectionFactory"),
//                // 其他可选的激活配置属性
//        })
//@MessageDriven(
//        activationConfig = {
//                @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue"),
//                @ActivationConfigProperty(propertyName = "destination", propertyValue = "java:/jms/queue/FooQueue"),
//                @ActivationConfigProperty(propertyName = "resourceAdapter", propertyValue = "activemq-rar")
//                // 其他可选的激活配置属性
//        })
@MessageDriven
public class SessionEvaluationReceiverMDB implements MessageListener {
    @Resource(name = "EvaluationQueue")
    private Queue evaluationQueue;

    @Override
    public void onMessage(Message message) {
        try {
            final TextMessage textMessage = (TextMessage) message;
            final String question = textMessage.getText();

            // 创建 Gson 实例
            Gson gson = new Gson();
            // JSON 转换为对象
            SessionEvaluation result = gson.fromJson(question, SessionEvaluation.class);
            // 将评价结果存储到数据库

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
            EntityManager em = emf.createEntityManager();

            em.getTransaction().begin();
            em.persist(result);
            em.getTransaction().commit();

            em.close();
            emf.close();
        } catch (JMSException e) {
            // 处理异常
            e.printStackTrace();
        }
    }
}