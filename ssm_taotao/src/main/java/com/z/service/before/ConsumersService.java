package com.z.service.before;

import com.z.pojo.Consumer;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface ConsumersService {

    /**
     * 登录
     * @param consumer
     * @param session
     * @return
     */
    String login(Consumer consumer, HttpSession session);
}
