package com.z.controller.admin;

import com.z.exception.MyException;
import com.z.pojo.Notice;
import com.z.service.admin.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/noticeController")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    /**
     * 查询所有公告信息
     */
    @RequestMapping("/selectNotice")
    public String selectNotice(Notice notice, Model model){
        System.out.println("NoticeController-----selectNotice----------------------");
        return noticeService.selectNotice(notice,model);
    }
    /**
     * 删除公告
     */
    @RequestMapping("/deleteNotice")
    public String deleteNotice(@RequestParam(value = "title") String title) throws MyException {
        System.out.println("NoticeController---deleteNotice-----------------");
        return noticeService.deleteNotice(title);
    }
    /**初始化
     * 公告页面
     */
    @RequestMapping("/toAddNotice")
    public String toAddNotice(Model model){
        System.out.println("NoticeController---toAddNotice---------------");
        model.addAttribute("notice",new Notice());
        return "admin/addNotice";
    }

    /**
     * 添加公告
     * @return
     */
    @RequestMapping("/addNotice")
    public String addNotice(Notice notice,Model model) throws MyException {
        System.out.println("NoticeController---addNotice-----------");
        return noticeService.addNotice(notice,model);
    }

    /**
     * 公告详细
     * @return
     */
    @RequestMapping("/detailNotice")
    public String detailNotice(@RequestParam(value = "id") String id, Model model) throws MyException {
        System.out.println("NoticeController-----detailNotice--------id--"+id);
        return noticeService.detailNotice(id,model);
    }

}
