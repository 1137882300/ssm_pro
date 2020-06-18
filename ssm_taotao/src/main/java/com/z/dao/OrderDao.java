package com.z.dao;

import com.z.pojo.Order;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface OrderDao {

    /**
     * 查询订单
     * 根据uid
     * 关键字order 要加上[] 才行
     * @return
     */
    @Select("select * from [order] where uid = #{uid}")
    List<Order> findOrderByUid(int uid);


    /**
     * 插入数据到order
     * @param order
     */
    @Insert("insert into [order] (uid,number,img,state,orderdate,money) values (#{uid},#{number},#{img},#{state},#{orderdate},#{money})")
    int insertOrder(Order order);


    /**
     * 查询所有订单
     */
    @Select("select * from [order]")
    @Results(id = "orderMap",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "uid",property = "uid"),
            @Result(column = "number",property = "number"),
            @Result(column = "img",property = "img"),
            @Result(column = "state",property = "state"),
            @Result(column = "orderdate",property = "orderdate"),
            @Result(column = "money",property = "money"),
            @Result(column = "uid",property = "consumerList",
                    one = @One(select = "com.z.dao.ConsumerDao.findConsumerById"))
    })
    List<Order> selectOrder(Order order);

    /**
     * 删除一个订单
     */
    @Delete("delete from [order] where id = #{id}")
    int deleteOrder(int id);


}
