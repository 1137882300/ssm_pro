package com.z.service.before;

import org.springframework.ui.Model;

public interface OrderService {

    /**
     * 提交订单
     * @param number
     * @param money
     * @param s
     * @param img
     * @param model
     * @return
     */
    String placeOrder(int number, int money, int uid, String img, Model model);

    /**
     * 查询所有我的订单
     * 根据用户id
     * @return
     */
    String findOrderByUid(int uid,Model model);
}
