package com.z.service.admin;

import com.z.exception.MyException;
import com.z.pojo.Notice;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {
    /**
     * 查询所有
     */
    String selectNotice(Notice notice, Model model);

    /**
     * 删除公告
     * 根据title
     * @param title
     * @return
     */
    String deleteNotice(String title) throws MyException;
    /**
     * 添加公告
     */
    String addNotice(Notice notice,Model model) throws MyException;

    /**
     * 查询一个公告根据id
     * @param id
     * @return
     */
    String detailNotice(String id, Model model) throws MyException;
}
