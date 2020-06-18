package com.z.utils;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 动态的sql
 * 条件查询的类
 */
public class MySelectProvider {
    /**
     * 条件查询
     */
    public String getConditionValues(Map<String, String[]> condition) {
        //定义模板初始化sql
        String sql = "select count(*) from goods where 1 = 1";

        if (condition.get("gstype") != null && !condition.get("grprice").equals("")) {
            String gstype = "'%" + condition.get("gstype")[0] + "%'";
            sql += " and gstype like " + gstype;
        }
        if (condition.get("gname") != null && !condition.get("grprice").equals("")) {
            String gname = "'%" + condition.get("gname")[0] + "%'";
            sql += " and gname like " + gname;
        }
        if (condition.get("grprice") != null && !condition.get("grprice").equals("")) {
            String grprice = "'%" + condition.get("grprice")[0] + "%'";
            sql += " and grprice like " + grprice;
        }

        System.out.println(sql);
        return sql;
    }

    /**
     * 分页的效果
     *
     * @param condition
     * @return
     */
    public String getConditionPage(@Param("start") int start, @Param("rows") int rows, Map<String, String[]> condition) {
        //定义模板初始化sql
        String sql = "select * from goods where 1 = 1";

        if (condition.get("gstype") != null && !condition.get("grprice").equals("")) {
            String gstype = "'%" + condition.get("gstype")[0] + "%'";
            sql += " and gstype like " + gstype;
        }
        if (condition.get("gname") != null && !condition.get("grprice").equals("")) {
            String gname = "'%" + condition.get("gname")[0] + "%'";
            sql += " and gname like " + gname;
        }
        if (condition.get("grprice") != null && !condition.get("grprice").equals("")) {
            String grprice = "'%" + condition.get("grprice")[0] + "%'";
            sql += " and grprice like " + grprice;
        }

        sql += " order by gid offset " + start + " rows fetch next " + rows + " rows only";

        System.out.println(sql);
        return sql;
    }

}
