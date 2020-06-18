package com.z.service.admin.impl;

import com.z.dao.GoodsTypeDao;
import com.z.exception.MyException;
import com.z.pojo.GoodsType;
import com.z.service.admin.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeDao goodsTypeDao;

    /**
     * 查询商品类型
     *
     * @return
     */
    @Override
    public String selectGoodsType(GoodsType goodsType, Model model) throws MyException{
        List<GoodsType> goodsTypeList = goodsTypeDao.selectGoodsType(goodsType);
        System.out.println("--GoodsTypeServiceImpl---selectGoodsType------goodsTypeList----"+goodsTypeList);
        if (goodsTypeList != null && goodsTypeList.size() > 0) {
            model.addAttribute("goodsTypeList",goodsTypeList );
            return "admin/selectGoodsType";
        }
        //查询失败
        throw new MyException("出错了。。");
    }

    /**
     * 删除商品类型
     *
     * @return
     */
    @Override
    public String deleteGoodsType(int id, Model model) throws MyException {
        if (goodsTypeDao.deleteGoodsType(id) > 0) {
            //删除成功
            return "admin/main";
        }
        //删除失败
        throw new MyException("出错了。。");
    }
}
