package com.z.service.before;

import com.z.exception.MyException;
import org.springframework.ui.Model;

public interface DetailGoodsService {

    /**
     * 根据id查goods
     * @param gid
     * @param model
     * @return
     */
    String findGoodsById(int gid, Model model) throws MyException;
}
