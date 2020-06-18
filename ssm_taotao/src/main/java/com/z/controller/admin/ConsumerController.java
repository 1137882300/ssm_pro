package com.z.controller.admin;

import com.z.exception.MyException;
import com.z.pojo.Consumer;
import com.z.service.admin.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/consumerController")
public class ConsumerController {

    @Autowired
    private ConsumerService consumerService;

    /**
     * 查询所有用户
     * @param consumer
     * @param model
     * @return
     */
    @RequestMapping("/selectConsumer")
    public String selectConsumer(Consumer consumer, Model model) throws MyException {
        System.out.println("--consumerController---selectConsumer----------------");
        return consumerService.selectConsumer(consumer,model);
    }

    /**
     * 删除用户
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/deleteConsumer")
    public String deleteConsumer(@RequestParam(value = "id") int id,Model model) throws MyException {
        System.out.println("--consumerController---selectConsumer----------id--"+id);
        return consumerService.deleteConsumer(id,model);
    }

}
