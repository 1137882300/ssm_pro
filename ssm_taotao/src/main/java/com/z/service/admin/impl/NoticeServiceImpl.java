package com.z.service.admin.impl;

import com.z.dao.NoticeDao;
import com.z.exception.MyException;
import com.z.pojo.Notice;
import com.z.service.admin.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeDao noticeDao;

    /**
     * 查询所有公告信息
     *
     * @param notice
     * @param model
     * @return
     */
    @Override
    public String selectNotice(Notice notice, Model model) {
        List<Notice> noticeList = noticeDao.selectNotice(notice);
        model.addAttribute("noticeList", noticeList);
        System.out.println("--NoticeServiceImpl---selectNotice-------noticeList--" + noticeList);
        return "admin/selectNotice";
    }

    /**
     * 删除公告
     * 根据title
     *
     * @param title
     * @return
     */
    @Override
    public String deleteNotice(String title) throws MyException {
        System.out.println("--NoticeServiceImpl---deleteNotice-------" + title);
        if (noticeDao.deleteNotice(title) > 0) {
//            return "admin/main";
            return "redirect:selectNotice";
        }
        throw new MyException("删除公告出错了。。");
    }

    /**
     * 添加公告
     *
     * @param notice
     * @param model
     * @return
     */
    @Override
    public String addNotice(Notice notice, Model model) throws MyException {
        System.out.println("--NoticeServiceImpl---addNotice---------notice--" + notice);
            if (noticeDao.addNotice(notice) > 0) {
                //添加成功
                return "redirect:selectNotice";
            }
            throw new MyException("添加公告出错了。。");
    }

    /**
     * 查询一个公告，根据id
     *
     * @param id
     * @return
     */
    @Override
    public String detailNotice(String id, Model model) throws MyException  {
        System.out.println("--NoticeServiceImpl---detailNotice---------id--" + id);
        List<Notice> detailList = noticeDao.findNoticeById(Integer.parseInt(id));
        if (detailList != null && detailList.size() > 0) {
            //查询成功
            System.out.println("--NoticeServiceImpl---detailNotice------detailList--"+detailList);
            model.addAttribute("detailList",detailList);
            System.out.println("--NoticeServiceImpl---detailNotice-----model--"+model);
            return "admin/detailNotice";
        }
        throw new MyException("出错了。。");
    }
}
