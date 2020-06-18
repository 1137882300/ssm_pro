package com.z.service.admin;

import com.z.exception.MyException;
import com.z.pojo.Consumer;
import org.springframework.ui.Model;

public interface ConsumerService {
    /**
     * 查询用户信息
     * @param consumer
     * @param model
     * @return
     */
    String selectConsumer(Consumer consumer, Model model) throws MyException;

    /**
     * 删除用户
     * @param id
     * @param model
     * @return
     */
    String deleteConsumer(int id,Model model) throws MyException;
}
