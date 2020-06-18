package com.z.controller.admin;

import com.z.exception.MyException;
import com.z.pojo.Order;
import com.z.service.admin.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ordersController")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    /**
     * 查询所有订单
     * @param order
     * @param model
     * @return
     */
    @RequestMapping("/selectOrders")
    public String selectOrders(Order order, Model model){
        System.out.println("--ordersController-----selectOrders--");
        return ordersService.selectOrder(order,model);
    }

    /**
     * 删除订单
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/deleteOrders")
    public String deleteOrders(@RequestParam(value = "id") int id, Model model) throws MyException {
        System.out.println("--ordersController-----deleteOrders-------id--"+id);
        return ordersService.deleteOrder(id,model);
    }

}
