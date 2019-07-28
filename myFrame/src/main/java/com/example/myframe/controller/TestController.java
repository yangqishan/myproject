package com.example.myframe.controller;

import com.example.myframe.entity.UserEntity;
import com.example.myframe.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Controller
public class TestController {
    @Autowired
    private BaseService baseService;

    @RequestMapping(value="/getData")
    public String getData(){
        List<UserEntity> list=baseService.getData();
        return "index";
    }
}
