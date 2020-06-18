package com.z.controller.before;

import com.z.exception.MyException;
import com.z.service.before.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/indexController")
public class IndexController {

    @Autowired
    private IndexService indexService;

    /**
     * 进入主页
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        System.out.println("IndexController------index------");
        return "before/index";
    }

    /**
     * 查询主页需要的数据Goods
     * @return
     */
    @RequestMapping("/findGoods")
    public String findGoods(HttpSession session) throws MyException {
        System.out.println("IndexController------findGoods----session-"+session);
        return indexService.findGoods(session);
    }

    /**
     * 查询公告
     * @param model
     * @return
     */
    @RequestMapping("/findNotice")
    public String findNotice(Model model) throws MyException {
        System.out.println("IndexController------findNotice----model->"+model);
        return indexService.findNotice(model);
    }

}
