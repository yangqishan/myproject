package com.etc.exam.TopicDao;

import com.etc.exam.Bean.Topic;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface TopicRepository extends JpaRepository<Topic,Integer> {
    /**
     * 模糊查询题目
     * @param title
     * @param type
     * @return
     */
    List<Topic> findByTitleLikeOrTypeLike(String title,String type);

    /**
     * 模糊查询题目数
     * @param title
     * @param type
     * @return
     */
    int countByTitleLikeOrTypeLike(String title,String type);

    /**
     * 根据id查询题目
     * @param id
     * @return
     */
    Topic findById(int id);

    /**
     * 查询题目的难度的数量
     * @param level
     * @return
     */
    int countByLevel(String level);

    /**
     * 查询科目的数量
     * @param type
     * @return
     */
    int countByType(String type);

    /**
     * 自动生成试卷
     * @param subject
     * @param flag
     * @return
     */
    List<Topic> findByTypeAndFlag(String subject,int flag);

    /**
     * 模糊分页查询
     * @param title
     * @param type
     * @param pageable
     * @return
     */
    Page<Topic> findByTitleLikeOrTypeLike(String title,String type,Pageable pageable);
}
