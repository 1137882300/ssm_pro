package com.z.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class BaseController {

    @ModelAttribute
    public void isLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(session.getAttribute("admin") == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }


}
