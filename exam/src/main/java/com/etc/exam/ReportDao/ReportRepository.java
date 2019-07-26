package com.etc.exam.ReportDao;

import com.etc.exam.Bean.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReportRepository extends JpaRepository<Report,Integer> {
    /**
     * 根据用户id查成绩单
     * @param userId
     * @return
     */
    List<Report> findReportByUserId(int userId);

    /**
     * 根据成绩单id查询成绩单（用户id和试卷id）
     * @param id
     * @return
     */
    Report findReportById(int id);

    /**
     * 模糊查询成绩单
     * @param id
     * @param title
     * @param subject
     * @return
     */
    List<Report> findByUserIdOrTitleLikeOrSubjectLike(int id,String title,String subject);

    /**
     * 模糊查询成绩单的数量
     * @param id
     * @param title
     * @param subject
     * @return
     */
    int countByUserIdOrTitleLikeOrSubjectLike(int id,String title,String subject);

    /**
     * 查询不同年级和不同科目的成绩单
     * @param title
     * @param subject
     * @return
     */
    List<Report> findByTitleLikeAndSubject(String title,String subject);

    /**
     * 查询不同年级和不同科目的成绩单的个数
     * @param title
     * @param subject
     * @return
     */
    int countByTitleLikeAndSubject(String title,String subject);

    /**
     * 根据时间正序排序
     * @param id
     * @return
     */
    List<Report> findAllByUserIdOrderByAddtimeDesc(int id);

    /**
     *
     * @param id
     * @param pageable
     * @return
     */
    Page<Report> findAllByUserId(int id, Pageable pageable);

    /**
     *
     * @param id
     * @param title
     * @param subject
     * @param pageable
     * @return
     */
    Page<Report> findByUserIdOrTitleLikeOrSubjectLike(int id,String title,String subject,Pageable pageable);

    /**
     * 模糊查询成绩单按照时间排序
     * @param title
     * @param subject
     * @param achievement
     * @param pageable
     * @return
     */
    Page<Report> findByTitleLikeOrSubjectLikeOrAchievementOrderByAddtimeDesc(String title,String subject, Integer achievement,Pageable pageable);

    /**
     * 成绩单排名
     * @param subject
     * @param pageable
     * @return
     */
    Page<Report> findAllBySubjectOrderByAchievementDesc(String subject,Pageable pageable);

    /**
     * 成绩单排名
     * @param subject
     * @return
     */
    List<Report>  findAllBySubjectOrderByAchievementDesc(String subject);
    /**
     * 根据科目的不同和分数范围查询
     * @param subject
     * @param achievement
     * @return
     */
    int countBySubjectAndAchievementGreaterThan(String subject,int achievement);

    /**
     * 成绩单高分排名
     * @return
     */
    List<Report> findAllByOrderByAchievementDesc();

    /**
     * 查询每个用户的成绩单数量
     * @param id
     * @return
     */
     int countByUserId(int id);

    /**
     * 根据id和科目按照成绩降序查询
     * @return
     */
     List<Report> findAllByUserIdAndSubjectOrderByAchievementDesc(int userid,String subject);

    /**
     * 根据id和科目查询个数
     * @param userid
     * @param subject
     * @return
     */
     int countByUserIdAndSubject(int userid,String subject);
}
