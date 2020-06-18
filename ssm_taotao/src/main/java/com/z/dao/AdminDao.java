package com.z.dao;

import com.z.pojo.Admin;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {
    /**
     * 查询管理员的name和pwd
     * @param admin
     * @return
     */
    @Select("select * from Admin where adminname = #{adminname} and adminpwd = #{adminpwd}")
    List<Admin> login(Admin admin);

    /**
     * 查询所有管理员信息
     * @return
     */
    @Select("select * from Admin")
    List<Admin> findAll();

    /**
     * 删除管理员信息
     * @param adminname
     * @return
     */
    @Delete("delete from Admin where adminname = #{adminname}")
    int deleteAdmin(String adminname);
}
