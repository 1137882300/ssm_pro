package com.z.controller.admin;

import com.z.pojo.Admin;
import com.z.service.admin.AdminService;
import com.z.utils.MySessionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/adminController")
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 登录页面的初始化
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        System.out.println("AdminController------------------------toLogin");
        return "admin/login";
    }

    /**
     * 登录
     * @param checkBox
     * @param admin
     * @param model
     * @param session
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/login")
    public String login(String checkBox, Admin admin, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response){
        System.out.println("AdminController-------------login-----------");
        System.out.println("AdminController-----------login--------checkBox-----"+checkBox);
        return adminService.login(checkBox,admin,model,session,request,response);
    }

    /**
     * 管理员用户管理
     * @return
     */
    @RequestMapping("/selectAdmin")
    public String selectAdmin(Admin admin,Model model){
        System.out.println("AdminController-------------selectAdmin-----------");
        return adminService.selectAdmin(admin,model);
    }

    /**
     * 删除管理员
     * @return
     */
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(@RequestParam(value = "adminname") String adminname,Model model){
        System.out.println("adminController----------deleteAdmin------"+adminname);
        return adminService.deleteAdmin(adminname,model);
    }

    /**
     * 安全退出
     * @param request
     * @return
     */
    @RequestMapping("/exit")
    public String exit(@CookieValue(value = "JSESSIONID") String cookieValue, HttpServletRequest request,Model model){
        System.out.println("AdminController--exit--------JSESSIONID-----"+cookieValue);
        //根据sessionId获取session对象
        HttpSession session = MySessionContext.getSession(cookieValue);
        Admin admin = (Admin) session.getAttribute("admin");
        //存入model
        model.addAttribute("adminname",admin.getAdminname());
        model.addAttribute("adminpwd",admin.getAdminpwd());
        System.out.println("AdminController--exit-----admin-----"+admin);
        return "admin/login";
    }
}
