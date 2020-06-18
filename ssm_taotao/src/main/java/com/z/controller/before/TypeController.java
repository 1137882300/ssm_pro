package com.z.controller.before;

import com.z.exception.MyException;
import com.z.service.before.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/typeController")
public class TypeController {

    @Autowired
    private TypeService typeService;

    /**
     * 查询类型下的所有
     */
    @RequestMapping("/findType")
    public String FindType(int type,Model model) throws MyException {
        System.out.println("TypeController---FindType----type-->"+type);
        return typeService.findType(type,model);
    }



}
