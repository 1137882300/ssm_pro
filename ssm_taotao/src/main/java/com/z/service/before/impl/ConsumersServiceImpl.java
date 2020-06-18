package com.z.service.before.impl;

import com.z.dao.ConsumerDao;
import com.z.pojo.Consumer;
import com.z.service.before.ConsumersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.List;

@Service
public class ConsumersServiceImpl implements ConsumersService {
    @Autowired
    private ConsumerDao consumerDao;
    /**
     * 登录
     * @param consumer
     * @param session
     * @return
     */
    @Override
    public String login(Consumer consumer, HttpSession session) {
        System.out.println("--IndexServiceImpl---login----");
        List<Consumer> consumerList = consumerDao.findConsumer(consumer);
        if (consumerList != null && consumerList.size() > 0) {
            //根据用户名查询id
            int uid = consumerDao.findUid(consumer.getUsername());
            //查询到了,把用户的id存起来
            session.setAttribute("uid",uid);
            //存consumer的登录信息
            session.setAttribute("consumer",consumer);
            System.out.println("--IndexServiceImpl----uid-->"+uid);
            return "before/index";
        }
        session.setAttribute("loginErr","用户名密码错误！");
        return "before/login";
    }
}
