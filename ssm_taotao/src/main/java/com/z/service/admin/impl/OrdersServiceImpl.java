package com.z.service.admin.impl;

import com.z.dao.OrderDao;
import com.z.exception.MyException;
import com.z.pojo.Order;
import com.z.service.admin.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrderDao orderDao;

    /**
     * 查询所有的订单
     * @param order
     * @param model
     * @return
     */
    @Override
    public String selectOrder(Order order, Model model) {
        List<Order> ordersList = orderDao.selectOrder(order);
        model.addAttribute("ordersList", ordersList);
        System.out.println("--OrdersServiceImpl---selectOrders-------ordersList--" + ordersList);
        return "admin/selectOrders";
    }

    /**
     * 删除订单
     * @param id
     * @param model
     * @return
     * @throws MyException
     */
    @Override
    public String deleteOrder(int id, Model model) throws MyException {
        System.out.println("--OrdersServiceImpl---deleteOrders-----id--" + id);
        if (orderDao.deleteOrder(id) > 0) {
            //删除成功
            return "redirect:selectOrders";
        }
        //删除不成功
        throw new MyException("出错了。。");
    }
}
