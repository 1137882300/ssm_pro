package com.z.service.before;


import com.z.exception.MyException;
import org.springframework.ui.Model;

public interface TypeService {

    /**
     * 查询类型下的所有商品
     */
    String findType(int type, Model model) throws MyException;

}
