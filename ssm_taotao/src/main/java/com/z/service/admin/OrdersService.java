package com.z.service.admin;

import com.z.exception.MyException;
import com.z.pojo.Order;
import org.springframework.ui.Model;

public interface OrdersService {

    /**
     * 查询所有订单
     */
    String selectOrder(Order order, Model model);

    /**
     * 删除订单
     */
    String deleteOrder(int id,Model model) throws MyException;

}
