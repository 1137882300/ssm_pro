package com.z.service.admin.impl;

import com.z.dao.ConsumerDao;
import com.z.exception.MyException;
import com.z.pojo.Consumer;
import com.z.service.admin.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ConsumerServiceImpl implements ConsumerService {

    @Autowired
    private ConsumerDao consumerDao;

    /**
     * 查询用户
     *
     * @param consumer
     * @param model
     * @return
     */
    @Override
    public String selectConsumer(Consumer consumer, Model model) throws MyException {
        List<Consumer> consumerList = consumerDao.selectConsumer(consumer);
        System.out.println("--ConsumerServiceImpl----selectConsumer----consumerList-----" + consumerList);
        if (consumerList != null && consumerList.size() > 0) {
            model.addAttribute("consumerList", consumerList);
            return "admin/selectConsumer";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 删除用户
     *
     * @param id
     * @param model
     * @return
     */
    @Override
    public String deleteConsumer(int id, Model model) throws MyException {
        if (consumerDao.deleteConsumer(id) > 0) {
            return "admin/main";
        }
        throw new MyException("出错了。。");
    }
}
