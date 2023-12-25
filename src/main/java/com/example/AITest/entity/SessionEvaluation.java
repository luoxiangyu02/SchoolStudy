package com.example.AITest.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

//会话评价类
@Entity
@Table(name = "sessionevaluation")
public class SessionEvaluation implements Serializable {
    private static final long serialVersionUID = 4305976904611795007L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "evaluation_id")
    private int evaluationId;

    @OneToOne
    @JoinColumn(name = "session_id")
    private Session session;

    @Column(name = "content")
    private String content;

    @Column(name = "evaluation_time")
    private LocalDateTime evaluationTime;


    public int getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(int evaluationId) {
        this.evaluationId = evaluationId;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime  getEvaluationTime() {
        return evaluationTime;
    }

    public void setEvaluationTime(LocalDateTime  evaluationTime) {
        this.evaluationTime = evaluationTime;
    }
}