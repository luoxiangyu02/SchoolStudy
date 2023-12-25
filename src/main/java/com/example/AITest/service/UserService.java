package com.example.AITest.service;

import com.example.AITest.dao.UserDao;
import com.example.AITest.entity.User;

import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless
public class UserService {
    @EJB
    private UserDao userDao;

    public void createUser(User user) {
        // 执行用户创建逻辑
        userDao.save(user);
    }

    public User getUserById(Long id) {
        // 执行获取用户逻辑
        return userDao.findById(id);
    }

    public void updateUser(User user) {
        // 执行更新用户逻辑
        userDao.update(user);
    }

    public void deleteUser(User user) {
        // 执行删除用户逻辑
        userDao.delete(user);
    }

    public int selectByName(String name) {
        return userDao.selectByName(name);
    }


}
