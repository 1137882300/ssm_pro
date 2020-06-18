package com.z.pojo;

import java.io.Serializable;
import java.util.List;

public class GoodsType implements Serializable {

    private int id;
    private String gstype;
    //主表的（一对多）{查的是类型，附加goods}
    private List<Goods> goods;

    public List<Goods> getGoods() {
        return goods;
    }

    public void setGoods(List<Goods> goods) {
        this.goods = goods;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGstype() {
        return gstype;
    }

    public void setGstype(String gstype) {
        this.gstype = gstype;
    }

    @Override
    public String toString() {
        return "GoodsType{" +
                "id=" + id +
                ", gstype='" + gstype + '\'' +
                ", goods=" + goods +
                '}';
    }

}
