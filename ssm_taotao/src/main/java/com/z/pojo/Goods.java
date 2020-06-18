package com.z.pojo;

import java.io.Serializable;

public class Goods implements Serializable {

    //goods 的编号
    private int gid;
    //goods 的名称
    private String gname;
    //goods 的原价
    private int goprice;
    //goods 的现价
    private int grprice;
    //goods 的库存
    private int gstock;
    //goods 的图片
    private String gpicture;
    //goods 的类型
    private String gstype;

    //从表goodstype(一对一){查的是goods，附加的是类型}
    private GoodsType goodsType;

    public GoodsType getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(GoodsType goodsType) {
        this.goodsType = goodsType;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public int getGoprice() {
        return goprice;
    }

    public void setGoprice(int goprice) {
        this.goprice = goprice;
    }

    public int getGrprice() {
        return grprice;
    }

    public void setGrprice(int grprice) {
        this.grprice = grprice;
    }

    public int getGstock() {
        return gstock;
    }

    public void setGstock(int gstock) {
        this.gstock = gstock;
    }

    public String getGpicture() {
        return gpicture;
    }

    public void setGpicture(String gpicture) {
        this.gpicture = gpicture;
    }

    public String getGstype() {
        return gstype;
    }

    public void setGstype(String gstype) {
        this.gstype = gstype;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                ", goprice=" + goprice +
                ", grprice=" + grprice +
                ", gstock=" + gstock +
                ", gpicture='" + gpicture + '\'' +
                ", gstype='" + gstype + '\'' +
                ", goodsType=" + goodsType +
                '}';
    }
}
