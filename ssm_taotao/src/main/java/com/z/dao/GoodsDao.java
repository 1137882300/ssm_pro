package com.z.dao;

import com.z.pojo.Goods;
import com.z.utils.MySelectProvider;
import com.z.utils.PageBean;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * 商品信息的持久层
 */
@Repository
public interface GoodsDao {
    /**
     * 查询所有的商品信息
     *
     * @return
     */
    @Select("select * from goods")
    @Results(id = "goodsMap",value = {
            @Result(id = true,column = "gid",property = "gid"),
            @Result(column = "gname",property = "gname"),
            @Result(column = "goprice",property = "goprice"),
            @Result(column = "grprice",property = "grprice"),
            @Result(column = "gstock",property = "gstock"),
            @Result(column = "gpicture",property = "gpicture"),
            @Result(column = "gstype",property = "gstype"),
            @Result(property = "goodsType",column = "gstype",//外键的名称
                one = @One(select = "com.z.dao.GoodsTypeDao.findById",
                    fetchType = FetchType.EAGER))
    })
    List<Goods> findAll();

    /**
     * 添加商品
     */
    @Insert("insert into goods (gname,goprice,grprice,gstock,gstype) values (#{gname},#{goprice},#{grprice},#{gstock},#{gstype})")
    int addGoods(Goods goods);

    /**
     * 删除商品
     */
    @Delete("delete from goods where gid = #{gid}")
    int deleteGoods(int gid);

    /**
     * 查询一个GoodsId
     *
     * @param gid
     * @return
     */
    @Select("select * from goods where gid = #{gid}")
    @ResultMap(value = "goodsMap")
    Goods findGoodsById(@Param("gid") Integer gid);

    /**
     * 查询该购物车下的商品
     * @return
     */
    @Select("select * from goods where gid = #{gid}")
    List<Goods> findGoodsByGid(@Param("gid") Integer gid);

    /**
     * 查询该类型下的商品
     */
    @Select("select * from goods where gstype = #{gstype}")
    List<Goods> findGoodsByGstype(@Param("gstype") Integer gstype);

    /**
     * 更新商品
     *
     * @param goods
     */
    @Update("update goods set gname = #{gname},goprice = #{goprice},grprice = #{grprice},gstock = #{gstock},gstype = #{gstype} where gid = #{gid}")
    int updateGoods(Goods goods);

    /**
     * 分页查询
     * @param start
     * @param rows
     * @param condition
     * @return
     */
//    @Select("select * from goods order by gid offset #{start} rows fetch next #{rows} rows only")
    @SelectProvider(type = MySelectProvider.class, method = "getConditionPage")
    @ResultMap(value = "goodsMap")
    List<Goods> findGoodsByPage(@Param("start") int start, @Param("rows") int rows, Map<String, String[]> condition);

    /**
     * 条件查询总条数
     * @return
     * @param condition
     */
//    @Select("select count(*) from goods")
    @SelectProvider(type = MySelectProvider.class, method = "getConditionValues")
    int findTotalCount(Map<String, String[]> condition);
}
