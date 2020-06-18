package com.z.pojo;

import java.io.Serializable;
import java.util.List;

public class Cart implements Serializable {

    private int id;
    private int uid;//用户的id
    private int gid;//商品的id
    private int count;

    //一对1的查询（一个购物车id下对应1个商品）
    private Goods goodsCart;

    public Goods getGoodsCart() {
        return goodsCart;
    }

    public void setGoodsCart(Goods goodsCart) {
        this.goodsCart = goodsCart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", uid=" + uid +
                ", gid=" + gid +
                ", count=" + count +
                ", goodsCart=" + goodsCart +
                '}';
    }
}
