package com.example.AITest.dao;

import com.example.AITest.entity.Session;
import com.example.AITest.entity.SessionMessage;
import com.example.AITest.entity.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

@Stateless
public class SessionDao {

    public void save(Session session) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();
        em.persist(session);
        em.getTransaction().commit();

        em.close();
        emf.close();
    }

    public List<Session> getList(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT s FROM Session s WHERE s.user.userId = :userId";
        TypedQuery<Session> query = em.createQuery(jpql, Session.class);
        query.setParameter("userId", id);

        List<Session> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList;
    }
}

