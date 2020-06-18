package com.z.dao;

import com.z.pojo.Consumer;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConsumerDao {

    /**
     * 查询所有用户
     */
    @Select("select * from consumer ")
    List<Consumer> selectConsumer(Consumer consumer);

    /**查询
     * 判断登录
     */
    @Select("select * from Consumer where username = #{username} and password = #{password}")
    List<Consumer> findConsumer(Consumer consumer);
    /**
     * 删除用户
     */
    @Delete("delete from consumer where id = #{id}")
    int deleteConsumer(int id);

    /**
     * 根据用户名查询id
     * @return
     */
    @Select("select id from consumer where username = #{username}")
    int findUid(String username);

    /**
     * 根据id查用户
     * @param id
     * @return
     */
    @Select("select * from consumer where id = #{id}")
    List<Consumer> findConsumerById(int id);


    /**
     * 注册
     * @param consumer
     * @return
     */
    int register(Consumer consumer);
}
