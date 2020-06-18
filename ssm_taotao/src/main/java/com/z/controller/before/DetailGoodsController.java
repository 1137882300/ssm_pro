package com.z.controller.before;

import com.z.exception.MyException;
import com.z.service.before.DetailGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/detailGoodsController")
public class DetailGoodsController {

    @Autowired
    private DetailGoodsService detailGoodsService;

    /**
     * 转到详细页面
     * @return
     */
    @RequestMapping("/toDetailGoods")
    public String toDetailGoods(@RequestParam(value = "gid") int gid, Model model) throws MyException {
        System.out.println("DetailGoodsController----toDetailGoods---------gid--->" + gid);
        return detailGoodsService.findGoodsById(gid,model);
    }


}
