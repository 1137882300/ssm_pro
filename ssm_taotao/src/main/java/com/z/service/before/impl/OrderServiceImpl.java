package com.z.service.before.impl;

import com.z.dao.OrderDao;
import com.z.pojo.Order;
import com.z.service.before.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    /**
     * 查询我的所有订单
     * 根据uid
     *
     * @return
     */
    @Override
    public String findOrderByUid(int uid, Model model) {
        System.out.println("--OrderServiceImpl----findOrderByUid--uid-->"+uid);
        List<Order> orderList = orderDao.findOrderByUid(uid);
        model.addAttribute("orderList", orderList);
        System.out.println("--OrderServiceImpl----findOrderByUid-------orderList--->" + orderList);
        return "before/order";
    }

    /**
     * 提交订单
     * 把订单详细存入数据库
     *
     * @param number
     * @param money
     * @param uid
     * @param img
     * @param model
     * @return
     */
    @Override
    public String placeOrder(int number, int money, int uid, String img, Model model) {
        System.out.println("--OrderServiceImpl------placeOrder-------");
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //把数量、金额、图片存起来 orderdate
        HashMap<String, String> orderMap = new HashMap<>();
        orderMap.put("number", number+"");
        orderMap.put("money", money+"");
        orderMap.put("img", img);
        orderMap.put("orderdate", df.format(new Date()));
        model.addAttribute("orderMap", orderMap);
        //封装到order实体类
        Order order = new Order();
        order.setUid(uid);
        order.setImg(img);
        order.setNumber(number);
        order.setOrderdate(df.format(new Date()));
        order.setMoney(money);
        //存到数据库
        if (orderDao.insertOrder(order) > 0) {
            return "before/order";
        }
        return "before/shopCart";
    }

}
