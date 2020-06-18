package com.z.controller.admin;

import com.z.exception.MyException;
import com.z.pojo.Goods;
import com.z.service.admin.GoodsService;
import com.z.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/goodsController")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    /**
     * 查询商品
     *
     * @param model
     * @return
     */
    @RequestMapping("/selectGoods")
    public String selectGoods(Model model) {
        System.out.println("GoodsController-----------selectGoods---------model--" + model);
        return goodsService.selectGoods(model);
    }

    /**
     * 初始化
     * 添加页面
     */
    @RequestMapping("/toAddGoods")
    public String toAddGoods(Model model) {
        model.addAttribute("goods", new Goods());
        System.out.println("GoodsController-----------toAddGoods-----------" + model);
        return "admin/addGoods";
    }

    /**
     * 添加商品
     */
    @RequestMapping("/addGoods")
    public String addGoods(Goods goods, Model model) throws MyException {
        System.out.println("GoodsController--------addGoods--------" + goods);
        return goodsService.addGoods(goods, model);
    }

    /**
     * 删除商品
     *
     * @RequestParam 获取请求路径上携带的参数-值
     */
    @RequestMapping("/deleteGoods")
    public String deleteGoods(@RequestParam(value = "gid") int gid, Model model) throws MyException {
        System.out.println("GoodsController----------deleteGoods------" + gid);
        return goodsService.deleteGoods(gid, model);
    }

    /**
     * 查询一个GoodsId
     */
    @RequestMapping("/toUpdateGoods")
    public String toUpdateGoods(@RequestParam(value = "gid") int gid, Model model) throws MyException {
        System.out.println("GoodsController----------toUpdateGoods------" + gid);
        return goodsService.findGoodsById(gid, model);
    }

    /**
     * 更新商品
     */
    @RequestMapping("/updateGoods")
    public String updateGoods(Goods goods, Model model) throws MyException {
        System.out.println("GoodsController----------updateGoods------" + goods);
        return goodsService.updateGoods(goods, model);
    }

    /**
     * 删除选中
     */
    @RequestMapping("/deleteSelected")
    public String deleteSelected(@RequestParam(value = "gid") int gid) throws MyException {
        System.out.println("GoodsController----------deleteSelected----gid--" + gid);
        return goodsService.deleteSelected(gid);
    }

    /**
     * 分页操作
     */
    @RequestMapping("/findGoodsByPage")
    public String findGoodsByPage(String currentPage, String rows, Model model, HttpServletRequest request) {
        System.out.println("GoodsController----findGoodsByPage----currentPage---" + currentPage + "---rows--" + rows);
        System.out.println("GoodsController----findGoodsByPage----model---" + model);
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "6";
        }
        /**
         * 搜索功能
         */
        //获取条件查询参数
        Map<String,String[]> condition = request.getParameterMap();
        System.out.println("GoodsController--findGoodsByPage---condition--->"+condition.keySet());
        return goodsService.findGoodsByPage(currentPage, rows, model,condition);
    }


}
