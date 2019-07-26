package com.etc.exam.Bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Date;

@Entity
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int userId;
    private String subject;
    private String title;
    private int paperId;
    private int sum;//题目数量
    private int achievement;//成绩
    private Date addtime;//考试时间
    private String ranswer;//试卷答案

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

    public String getRanswer() {
        return ranswer;
    }

    public void setRanswer(String ranswer) {
        this.ranswer = ranswer;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public int getAchievement() {
        return achievement;
    }

    public void setAchievement(int achievement) {
        this.achievement = achievement;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }


    @Override
    public String toString() {
        return "Report{" +
                "id=" + id +
                ", user_id=" + userId +
                ", subject='" + subject + '\'' +
                ", title='" + title + '\'' +
                ", paper_id=" + paperId +
                ", sum=" + sum +
                ", achievement=" + achievement +
                ", addtime=" + addtime +
                ", r_answer='" + ranswer + '\'' +
                '}';
    }
}
