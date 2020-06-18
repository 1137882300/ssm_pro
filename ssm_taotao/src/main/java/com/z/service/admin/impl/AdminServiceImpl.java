package com.z.service.admin.impl;

import com.z.dao.AdminDao;
import com.z.pojo.Admin;
import com.z.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    public String login(String isChecked, Admin admin, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("-AdminServiceImpl------------------------------login----");
        response.setContentType("text/html;charset=utf-8");
        if (adminDao.login(admin) != null && adminDao.login(admin).size() > 0) {
            //如果勾选了 "记住密码选框"，才执行cookie操作
            if (isChecked != null) {
                //把admin存到session域中
                session.setAttribute("admin", admin);
                session.setMaxInactiveInterval(60 * 60);//一个小时
                //再用cookie存储sessionId,使之持久化存储
                //遍历cookie 检查是否第一次登录(是否存在存储cookie的那个id，没有就创建，有就显示密码)
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("JSESSIONID")) {
                        try {
                            //可以通过sessionId获取session存储的数据
                            System.out.println("-AdminServiceImpl----------login---------JSESSIONID----if-" + session.getId());
                            return "admin/main";
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                        System.out.println("-AdminServiceImpl--------login-----------JSESSIONID-----else-" + session.getId());
                        Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
                        jsessionid.setMaxAge(60 * 60);//存储时间
                        response.addCookie(jsessionid);
                        System.out.println("-AdminServiceImpl-------login-----------jsessionid.getValue()------else-" + jsessionid.getValue());
                    }
                }
            }
            return "admin/main";
        }
        System.out.println("-AdminServiceImpl----------------------------用户名或密码修改错误--");
        model.addAttribute("msg", "用户名或密码错误！");
        return "admin/login";
    }

    /**
     * 查询管理员信息
     *
     * @param admin
     * @param model
     * @return
     */
    @Override
    public String selectAdmin(Admin admin, Model model) {
        List<Admin> adminList = adminDao.findAll();
        model.addAttribute("adminList", adminList);
        System.out.println("--AdminServiceImpl---------------selectAdmin---------" + adminList);
        return "admin/selectAdmin";
    }

    /**
     * 删除管理员信息
     *
     * @param adminname
     * @param model
     * @return
     */
    @Override
    public String deleteAdmin(String adminname, Model model) {
        System.out.println("--AdminServiceImpl---------------deleteAdmin---------" + adminname);
        if (adminDao.deleteAdmin(adminname) > 0) {
            //删除成功
            return "admin/main";
        }
        return null;
    }


    private void doCookie(Admin admin, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("request.getCookies() ----" + request.getCookies());
        //获取所有cookie
        Cookie[] cookies = request.getCookies();
        boolean flag = false;//没有cookie为adminname和adminpwd
        //遍历cookie
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                //获取cookie的名称
                System.out.println("----cookieName-----" + cookie.getName());
                //判断是否为用户名和密码的cookie
                if (cookie.getName().equals("adminname")) {
                    //有这个cookie，不是第一次访问
                    flag = true;//有这个cookie
                    String valueName = cookie.getValue();
                    //可以回显数据
                    request.setAttribute("valueName", valueName);
                    //覆盖原来的cookie
                    response.addCookie(new Cookie("adminname", admin.getAdminname()));
                    System.out.println("-----value----" + valueName);
                }
                if (cookie.getName().equals("adminpwd")) {
                    //有这个cookie，不是第一次访问
                    flag = true;//有这个cookie
                    String valuePassword = cookie.getValue();
                    //可以回显数据
                    request.setAttribute("valuePassword", valuePassword);
                    //覆盖原来的cookie
                    response.addCookie(new Cookie("adminpwd", admin.getAdminpwd()));
                    System.out.println("-----value----" + valuePassword);
                }
                //设置cookie的存活时间
                cookie.setMaxAge(60 * 60);
            }
        }
        if (cookies == null || cookies.length == 0 || flag == false) {
            System.out.println("没有cookie，就是第一次访问---------------------");
            //没有cookie，就是第一次访问
            Cookie cookieName = new Cookie("adminname", admin.getAdminname());
            Cookie cookiePwd = new Cookie("adminpwd", admin.getAdminpwd());
            cookieName.setMaxAge(60 * 60);
            cookiePwd.setMaxAge(60 * 60);
            response.addCookie(cookieName);
            response.addCookie(cookiePwd);
        }
    }

//    @Override
//    public String login(Auser auser, Model model, HttpSession session) {
//        //设置编码
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
//        //获取请求参数
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        System.out.println(username+"----"+password);
//        //封装user对象
//        Currency currency = new Currency();
//        currency.setUsername(username);
//        currency.setPassword(password);
//        //调用service层
//        Currency user = currencyService.login(currency);
//        System.out.println(user+"------------------");
//        System.out.println(user == null);
//        //判断user
//        if(user == null){
//            //登录失败
//            request.getRequestDispatcher("/WEB-INF/pages/fail.jsp").forward(request,response);
//        }else {
//            //登录成功，，，并存储数据
//            request.setAttribute("user",currency);
//            //转发
//            request.getRequestDispatcher("/WEB-INF/pages/success.jsp").forward(request,response);
//        }
//        return null;
//    }

    /**
     * 校验码
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public void Verification(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int width = 80;
        int height = 30;

        //创建一对象，在内存中图片（验证码图片对象）
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //美化对象
        //填充背景色
        Graphics g = image.getGraphics();//画笔对象
        g.setColor(Color.GRAY);
        g.fillRect(0, 0, width, height);//填充
        //画边框
        g.setColor(Color.black);
        g.drawRect(0, 0, width - 1, height - 1);

        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        //设置画笔的颜色
        g.setColor(Color.yellow);
        //设置字体大小
        g.setFont(new Font("黑体", Font.BOLD, 24));
        //生成随机角标
        Random random = new Random();
        for (int i = 1; i <= 4; i++) {
            int index = random.nextInt(str.length());
            //获取字符
            char ch = str.charAt(index);
            //写验证码
            g.drawString(ch + "", width / 5 * i, height / 2);
        }
        //画干扰线
        g.setColor(Color.green);
        //随机生成坐标
        for (int i = 0; i < 20; i++) {
            int x1 = random.nextInt(width);
            int x2 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int y2 = random.nextInt(height);
            g.drawLine(x1, x2, y1, y2);
        }
        //将图片输出到页面展示
        ImageIO.write(image, "jpg", response.getOutputStream());
        return;
    }

}
