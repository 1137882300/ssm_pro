package com.z.service.before;

import com.z.exception.MyException;
import com.z.pojo.Cart;
import org.springframework.ui.Model;

public interface ShopCartService {

    /**
     * 查询出用户的购物车
     * 含有的商品
     *
     * @param
     * @param model
     * @return
     */
    String findShopCart(Model model, Cart cart) throws MyException;

    /**
     * 添加到购物车
     *
     * @param uid
     * @param gid
     * @param model
     * @return
     */
    String addCart(int gid, int uid,int count,Model model) throws MyException;

    /**
     * 删除购物车
     * @param id
     * @return
     */
    String deleteCart(String id) throws MyException;
}
