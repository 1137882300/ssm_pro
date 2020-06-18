package com.z.controller.before;

import com.z.exception.MyException;
import com.z.pojo.Cart;
import com.z.service.before.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/shopCartController")
public class ShopCartController {

    @Autowired
    private ShopCartService shopCartService;

    /**
     * 跳转到购物车页面
     * @return
     */
    @RequestMapping("/toShopCart")
    public String toShopCart(Model model) throws MyException {
        System.out.println("ShopCartController---toShopCart----");
        return shopCartService.findShopCart(model,new Cart());
    }

    /**
     * 添加到购物车
     * @return
     */
    @RequestMapping("/addCart")
    public String addCart(@RequestParam(value = "gid") int gid,
                          @RequestParam(value = "uid") int uid,
                          @RequestParam(value = "count",required = false,defaultValue = "1") int count,
                          Model model) throws MyException {
        System.out.println("ShopCartController---addCart--gid-uid-count->"+gid+"-"+uid+"-"+count);
        return shopCartService.addCart(gid,uid,count,model);
    }

    /**
     * 删除购物车
     * @param id
     * @return
     */
    @RequestMapping("/deleteCart")
    private String deleteCart(@RequestParam(value = "id") String id) throws MyException {
        System.out.println("ShopCartController---deleteCart--id-->"+id);
        return shopCartService.deleteCart(id);
    }

}
