package com.example.myframe.service.Impl;

import com.example.myframe.dao.BaseDao;
import com.example.myframe.entity.UserEntity;
import com.example.myframe.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BaseServiceImpl implements BaseService {

    @Autowired
    private BaseDao baseDao;
    @Override
    public List<UserEntity> getData() {
        return baseDao.getData();
    }
}
