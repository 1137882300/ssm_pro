package com.z.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/testMain")
public class TestMain {


    @RequestMapping("/main")
    public String main(){
        System.out.println("AdminController------------------------main");
        return "admin/main";
    }


}
