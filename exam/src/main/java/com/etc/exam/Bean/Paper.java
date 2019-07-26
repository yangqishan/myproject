package com.etc.exam.Bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Date;

@Entity
public class Paper {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String type;
    private String grade;
    private String title;
    private int israndom;
    private Date addtime;
    private String topicId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIsrandom() {
        return israndom;
    }

    public void setIsrandom(int israndom) {
        this.israndom = israndom;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getTopicId() {
        return topicId;
    }

    public void setTopicId(String topicId) {
        this.topicId = topicId;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", grade='" + grade + '\'' +
                ", title='" + title + '\'' +
                ", israndom=" + israndom +
                ", addtime=" + addtime +
                ", topicId='" + topicId + '\'' +
                '}';
    }
}
