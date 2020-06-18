package com.z.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 异常处理器
 */
public class MyExceptionResolver implements HandlerExceptionResolver {
    /**
     * 处理异常的逻辑
     * @param httpServletRequest
     * @param httpServletResponse
     * @param handler
     * @param ex
     * @return
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception ex) {
        //获取到异常
        MyException e = null;
        if(ex instanceof MyException){
            e = (MyException) ex;
        }else{
            e = new MyException("系统正在维护。。");
        }
        //创建ModelAndView对象
        ModelAndView mv = new ModelAndView();
        mv.addObject("errMsg",e.getMessage());
        mv.setViewName("error");
        return null;
    }
}
