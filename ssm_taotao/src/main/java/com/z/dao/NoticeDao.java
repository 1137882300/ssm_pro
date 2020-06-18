package com.z.dao;

import com.z.pojo.Notice;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public interface NoticeDao {

    @Select("select * from Notice")
    @Results(id = "noticeMap",value = {
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "title",property = "title"),
            @Result(column = "content",property = "content"),
            @Result(column = "_time",property = "time"),
    })
    /**
     * 查询所有
     */
    List<Notice> selectNotice(Notice notice);

    /**
     * 查询所有公告
     * @return
     */
    @Select("select * from Notice")
    @ResultMap(value = "noticeMap")
    List<Notice> findNotice();

    /**
     * 删除公告
     * 根据title
     * @param title
     */
    @Delete("delete from Notice where title = #{title}")
    int deleteNotice(String title);
    /**
     * 添加公告
     */
    @ResultMap(value = "noticeMap")
    @Insert("insert into Notice (title,content,_time) values (#{title},#{content},#{time})")
    int addNotice(Notice notice);

    /**
     * 查询一个公告，根据id
     */
    @ResultMap(value = "noticeMap")
    @Select("select * from Notice where id = #{id}")
    List<Notice> findNoticeById(int id);

}
