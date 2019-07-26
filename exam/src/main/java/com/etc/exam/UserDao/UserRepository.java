package com.etc.exam.UserDao;

import com.etc.exam.Bean.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface UserRepository extends JpaRepository<User,Integer> {
    /**
     * 通过id查询用户
     * @param id
     * @return
     */
    User findById(int id);

    /**
     * 模糊查询用户
     * @param name
     * @param grade
     * @param level
     * @param pageable
     * @return
     */
    Page<User> findByNameLikeOrGradeLikeOrLevelLike(String name, String grade, String level, Pageable pageable);

    /**
     * 模糊查询用户数量
     * @param name
     * @param grade
     * @param level
     * @return
     */
    int countByNameLikeOrGradeLikeOrLevelLike(String name,String grade,String level);

    /**
     * 根据姓名查询用户id；
     * @param name
     * @return
     */
    User findByName(String name);

    /**
     * 查询男女人数
     * @param sex
     * @return
     */
    int countBySex(String sex);

    /**
     * 查询年级人数
     * @param grade
     * @return
     */
    int countByGrade(String grade);

    /**
     * 用户积分排名
     * @return
     */
    Page<User> findAllByOrderByJifenDesc(Pageable pageable);

    List<User> findAllByOrderByJifenDesc();
}
