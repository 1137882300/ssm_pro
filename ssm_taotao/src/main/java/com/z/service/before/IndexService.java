package com.z.service.before;

import com.z.exception.MyException;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface IndexService {

    /**
     * 查询主页需要的数据Goods
     * @param session
     * @return
     */
    String findGoods(HttpSession session) throws MyException;

    /**
     * 查询公告
     * @param model
     * @return
     */
    String findNotice(Model model) throws MyException;
}
