package com.z;

import com.z.dao.OrderDao;
import com.z.pojo.Order;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestCURD {

    @Autowired
    OrderDao dao;

    @Test
    public void test(){
        List<Order> list = dao.findOrderByUid(3);
        System.out.println(list);
    }

}
