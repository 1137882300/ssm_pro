package com.z.controller.before;

import com.z.pojo.Consumer;
import com.z.service.before.ConsumersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/consumersController")
public class ConsumersController {

    @Autowired
    private ConsumersService consumersService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        System.out.println("ConsumerController---toLogin----------");
        return "before/login";
    }

    @RequestMapping("/login")
    public String login(Consumer consumer, HttpSession session){
        System.out.println("ConsumerController---login-----consumer---"+consumer);
        return consumersService.login(consumer,session);
    }
}
