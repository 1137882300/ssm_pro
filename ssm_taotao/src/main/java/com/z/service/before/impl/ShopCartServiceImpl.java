package com.z.service.before.impl;

import com.z.dao.CartDao;
import com.z.exception.MyException;
import com.z.pojo.Cart;
import com.z.service.before.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ShopCartServiceImpl implements ShopCartService {

    @Autowired
    private CartDao cartDao;

    /**
     * 查询出用户购物车里的商品
     *
     * @param
     * @param model
     * @return
     */
    @Override
    public String findShopCart(Model model, Cart cart) throws MyException {
        System.out.println("--ShopCartServiceImpl---findShopCart-----");
        List<Cart> cartAll = cartDao.findCart(cart);
        System.out.println("--ShopCartServiceImpl---findShopCart--------cartAll--->" + cartAll);
        if (cartAll != null && cartAll.size() > 0) {
            model.addAttribute("cartAll", cartAll);
            return "before/shopCart";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 添加到购物车
     *
     * @param uid
     * @param gid
     * @param model
     * @return
     */
    @Override
    public String addCart(int gid, int uid, int count, Model model) throws MyException {
        System.out.println("--ShopCartServiceImpl--------addCart---------gid-uid-count->"+gid+"-"+uid+"-"+count);
        //把gid 和 uid 和 count 存到数据库cart表中
        if (cartDao.insertCart(gid, uid, count) > 0) {
            //添加成功
            return "before/index";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 删除购物车
     *
     * @param id
     * @return
     */
    @Override
    public String deleteCart(String id) throws MyException{
        System.out.println("--ShopCartServiceImpl---deleteCart---id-->" + id);
        if (cartDao.deleteCart(id) > 0) {
            //请求的路径 不是网页
            return "redirect:toShopCart";
        }
        throw new MyException("出错了。。");
    }
}
