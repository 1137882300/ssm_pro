package com.z.pojo;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {

    private int id;
    private int uid;//用户id
    private int number;//购买的数量
    private String img;
    private String state;//购买状态
    private String orderdate;//订单日期
    private int money;//金额

    //查订单顺带这个用户名（一对多的查询）
    private Consumer consumerList;

    public Consumer getConsumerList() {
        return consumerList;
    }

    public void setConsumerList(Consumer consumerList) {
        this.consumerList = consumerList;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", uid=" + uid +
                ", number=" + number +
                ", img='" + img + '\'' +
                ", state='" + state + '\'' +
                ", orderdate='" + orderdate + '\'' +
                ", money=" + money +
                ", consumerList=" + consumerList +
                '}';
    }
}
