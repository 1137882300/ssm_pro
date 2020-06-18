package com.z.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 自定义的拦截器
 */
public class MyInterceptor implements HandlerInterceptor {

    /**
     * 预处理，controller方法执行前
     * return turn 放行
     * return false 不放心
     * 在这里判断用户登录是否
     * 拦截购物车
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("MyInterceptor---preHandle--预处理拦截器----");
//        String requestURI = request.getRequestURI();
            HttpSession session = request.getSession();
            Object uid = session.getAttribute("uid");
            if (uid != null) {
                //登录成功
                return true;
            } else {
                //没有登录 ，跳转到登录页面
                request.getRequestDispatcher("/consumersController/toLogin").forward(request,response);
//              response.sendRedirect(request.getContextPath()+"/consumersController/toLogin");
                return false;
            }

    }

    /**
     * 后处理
     *
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 最终执行的方法
     * 一般就释放资源
     *
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
