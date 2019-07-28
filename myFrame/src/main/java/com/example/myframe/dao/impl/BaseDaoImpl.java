package com.example.myframe.dao.impl;

import com.example.myframe.dao.BaseDao;
import com.example.myframe.entity.UserEntity;
import lombok.Getter;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BaseDaoImpl implements BaseDao {

    @Autowired
    @Getter
    public SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<UserEntity> getData() {

        return sqlSessionTemplate.selectList(getStatementNameWrap("getdata"));
    }
    /**
     * 方法功能描述: 构造mybatis sql路径，拼接命名空间路径
     *
     * @param name 需要拼接的路径
     * @return sql路径
     *
     */
    protected String getStatementNameWrap(String name) {
        return getNameSpace() + "." + name;
    }
    /**
     * 方法功能描述: 通过子类名得到命名空间路径
     *
     * @return 命名空间路径
     *
     */
    private String getNameSpace() {
        return this.getClass().getName();
    }
}
