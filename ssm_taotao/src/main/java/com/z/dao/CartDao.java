package com.z.dao;

import com.z.pojo.Cart;
import com.z.pojo.Goods;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao {
    /**
     * 查询购物车
     * 顺带着 goods表和 type表
     * @return
     */

    @Select("select * from cart")
    @Results(id = "cartMap",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "uid",property = "uid"),
            @Result(column = "gid",property = "gid"),
            @Result(column = "count",property = "count"),
            @Result(property = "goodsCart",column = "gid",//外键名称
                one = @One(select = "com.z.dao.GoodsDao.findGoodsByGid",
                    fetchType = FetchType.EAGER))
    })
    List<Cart> findCart(Cart cart);

    /**
     * 删除购物车
     * @param id
     */
    @Delete("delete from cart where id = #{id}")
    int deleteCart(String id);

    /**
     * 保存购物车
     * @param gid
     * @param uid
     * @param count
     */
    @Insert("insert into cart (gid,uid,count) values (#{gid},#{uid},#{count})")
    int insertCart(@Param("gid") int gid,@Param("uid") int uid,@Param("count") int count);
}
