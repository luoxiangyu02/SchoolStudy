package com.example.AITest.service;

import com.example.AITest.entity.Session;

import javax.enterprise.context.RequestScoped;
import javax.jws.WebMethod;
import javax.jws.WebService;

public interface AIWebService {
    String interact(String input);

    void evaluate(String content,Integer sessionId);
}
