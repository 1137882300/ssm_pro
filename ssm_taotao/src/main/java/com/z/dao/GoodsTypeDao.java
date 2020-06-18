package com.z.dao;

import com.z.pojo.GoodsType;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface GoodsTypeDao {
    /**
     * 查询所有商品类型
     * @param goodsType
     * @return
     */
    @Select("select * from goodstype")
    @Results(id = "typeMap",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "gstype",property = "gstype"),
            @Result(column = "id",property = "goods",
                many = @Many(select = "com.z.dao.GoodsDao.findGoodsByGstype",
                fetchType = FetchType.LAZY))
    })
    List<GoodsType> selectGoodsType(GoodsType goodsType);

    /**
     * 查询类型下对应的的所有商品
     */
    @Select("select * from goodstype")
    @ResultMap(value = "typeMap")
    List<GoodsType> findAll();

    /**
     * 查询类型通过 id
     * @param id
     * @return
     */
    @Select("select * from goodstype where id = #{id}")
    GoodsType findById(Integer id);


    /**
     * 删除商品
     * @param id
     * @return
     */
    @Delete("delete from goodstype where id = #{id}")
    int deleteGoodsType(int id);


}
