package com.z.service.admin;

import com.z.exception.MyException;
import com.z.pojo.GoodsType;
import org.springframework.ui.Model;

public interface GoodsTypeService {

    /**
     * 查询商品类型
     * @return
     */
    String selectGoodsType(GoodsType goodsType, Model model) throws MyException;

    /**
     * 删除商品类型
     * @return
     */
    String deleteGoodsType(int id,Model model) throws MyException;

}
