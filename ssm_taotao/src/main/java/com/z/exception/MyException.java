package com.z.exception;

/**
 * 异常处理类
 */
public class MyException extends Exception {

    private String msg;

    public MyException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
