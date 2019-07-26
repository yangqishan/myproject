package com.etc.exam.PaperDao;

import com.etc.exam.Bean.Paper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaperRepository extends JpaRepository<Paper,Integer>{
    /**
     * 根据id查询试卷
     * @param id
     * @return
     */
    Paper findPaperById(int id);

    /**
     * 模糊查询试卷
     * @param title
     * @param type
     * @param pageable
     * @return
     */
    Page<Paper> findByTitleLikeOrTypeLike(String title,String type,Pageable pageable);

    /**
     * 模糊查询试卷数量
     * @param title
     * @param type
     * @return
     */
    int countByTitleLikeOrTypeLike(String title,String type);

    /**
     * 根据科目查询试卷
     * @param type
     * @return
     */
    List<Paper> findByType(String type);

    /**
     * 根据时间查询查询试卷
     * @param pageable
     * @return
     */
    Page<Paper> findAllByOrderByAddtimeDesc(Pageable pageable);

}
