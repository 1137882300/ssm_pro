package com.z.controller.admin;

import com.z.exception.MyException;
import com.z.pojo.GoodsType;
import com.z.service.admin.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/goodsTypeController")
public class GoodsTypeController {

    @Autowired
    private GoodsTypeService goodsTypeService;

    /**
     * 查询所有商品类型
     * @return
     */
    @RequestMapping("/selectGoodsType")
    public String selectGoodsType(GoodsType goodsType, Model model) throws MyException {
        System.out.println("--goodsTypeController---selectGoodsType---------goodsType---"+goodsType);
        return goodsTypeService.selectGoodsType(goodsType,model);
    }

    /**
     * 删除商品类型
     * @return
     */
    @RequestMapping("/deleteGoodsType")
    public String deleteGoodsType(@RequestParam(value = "id") int id, Model model) throws MyException {
        System.out.println("--goodsTypeController---selectGoodsType---------id---"+id);
        return goodsTypeService.deleteGoodsType(id,model);
    }


}
