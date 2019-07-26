package com.etc.exam.AdminDao;

import com.etc.exam.Bean.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin,Integer> {
    /**
     * 通过姓名查询
     * @param name
     * @return
     */
    Admin findByName(String name);

}
