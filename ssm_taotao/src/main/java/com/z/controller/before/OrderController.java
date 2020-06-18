package com.z.controller.before;

import com.z.service.before.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/orderController")
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 跳转到我的订单页面
     * 根据用户的id来查
     *
     * @return
     */
    @RequestMapping("/toOrder")
    public String toOrder(@RequestParam(value = "uid") int uid, Model model) {
        System.out.println("OrderController----------toOrder------uid-->" + uid);
        return orderService.findOrderByUid(uid, model);
    }

    /**
     * 提交订单
     *
     * @return
     */
    @RequestMapping("/placeOrder")
    public String placeOrder(@RequestParam(value = "number") int number,
                             @RequestParam(value = "money") int money,
                             @RequestParam(value = "img") String img,
                             @RequestParam(value = "uid") int uid,
                             Model model) {
        System.out.println("OrderController------placeOrder-----number--money-->" + number + "--" + money);
        return orderService.placeOrder(number, money, uid,img, model);
    }


}
