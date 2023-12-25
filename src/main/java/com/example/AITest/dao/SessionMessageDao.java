package com.example.AITest.dao;

import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionMessage;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.*;
import java.util.List;

@Stateless
public class SessionMessageDao {

    public void save(SessionMessage sessionMessage) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();
        em.persist(sessionMessage);
        em.getTransaction().commit();

        em.close();
        emf.close();
    }

    public List<SessionMessage> getList(Integer id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT s FROM SessionMessage s WHERE s.session.sessionId = :sessionId";
        TypedQuery<SessionMessage> query = em.createQuery(jpql, SessionMessage.class);
        query.setParameter("sessionId", id);

        List<SessionMessage> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList;
    }
}

