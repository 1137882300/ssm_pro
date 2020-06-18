package com.z.service.admin;

import com.z.pojo.Admin;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface AdminService {

    /**
     * 登录
     * @param isChecked
     * @param admin
     * @param model
     * @param session
     * @param request
     * @param response
     * @return
     */
    String login(String isChecked, Admin admin , Model model, HttpSession session,HttpServletRequest request,HttpServletResponse response);


    /**
     * 查询管理员用户
     * @param admin
     * @param model
     * @return
     */
    String selectAdmin(Admin admin, Model model);

    /**
     * 删除管理员信息
     * @param adminname
     * @param model
     * @return
     */
    String deleteAdmin(String adminname, Model model);
}
