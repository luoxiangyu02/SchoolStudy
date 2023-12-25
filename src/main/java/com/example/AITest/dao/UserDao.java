package com.example.AITest.dao;

import com.example.AITest.entity.User;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.*;
import java.util.List;

@Stateless
public class UserDao {

    public User findById(Long id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

        User user = em.find(User.class, id);

        em.close();
        emf.close();

        return user;
    }


    public void save(User user) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();

        em.close();
        emf.close();
    }

    public void update(User user) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

//// 查找要更新的实体对象
//        User ouser = em.find(User.class, user.getUserId());
//
//// 修改实体对象的属性
//        user.setUsername("newUsername");

        em.getTransaction().begin();
        em.merge(user); // 使用 merge() 方法更新实体对象
        em.getTransaction().commit();

        em.close();
        emf.close();

    }

    public void delete(User tuser) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 查找要删除的实体对象
        User user = em.find(User.class, tuser.getUserId());

        em.getTransaction().begin();
        em.remove(user); // 使用 remove() 方法删除实体对象
        em.getTransaction().commit();

        em.close();
        emf.close();

    }

    public int selectByName(String name) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT u FROM User u WHERE u.username = :username";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("username", name);

        List<User> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList.size();
    }

    public User selectByNM(String userName, String passWord) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT u FROM User u WHERE u.username = :username and u.password = :passWord";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("username", userName);
        query.setParameter("passWord",passWord);

        List<User> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList.size()>0?resultList.get(0):null;
    }

    public int selectByName(String username, Integer id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT u FROM User u WHERE u.username = :username and u.userId<>:userId";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("username", username);
        query.setParameter("userId", id);

        List<User> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList.size();
    }

    public User selectByAll(String username, String email, String tel) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPersistenceUnit");
        EntityManager em = emf.createEntityManager();

// 使用 JPQL 进行查询
        String jpql = "SELECT u FROM User u WHERE u.username = :username and u.email=:email and u.phoneNumber=:phoneNumber";
        TypedQuery<User> query = em.createQuery(jpql, User.class);
        query.setParameter("username", username);
        query.setParameter("email", email);
        query.setParameter("phoneNumber", tel);

        List<User> resultList = query.getResultList();
        em.close();
        emf.close();

        return  resultList.size()>0?resultList.get(0):null;
    }

    // 其他查询方法和数据库操作
}

