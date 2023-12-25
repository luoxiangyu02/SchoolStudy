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
import javax.ejb.Stateless;
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
 * 会话查询功能
 */
@Stateless
public class SessionLogBean {
    @EJB
    private SessionDao sessionDao;
    @EJB
    private SessionMessageDao sessionMessageDao;

    public List<Session>  getSessionList(Long id) {
        return sessionDao.getList(id);
    }

    public List<SessionMessage>  getSessionMessageList(Integer id) {
        return sessionMessageDao.getList(id);
    }

}
