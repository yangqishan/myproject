package com.example.myframe.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class UserEntity {
    private int id;
    private int userId;
    private String subject;
    private String title;
    private int paperId;
    private int sum;//题目数量
    private int achievement;//成绩
    private Date addtime;//考试时间
    private String ranswer;//试卷答案
}
