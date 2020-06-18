package com.z.service.before.impl;

import com.z.dao.GoodsTypeDao;
import com.z.exception.MyException;
import com.z.pojo.GoodsType;
import com.z.service.before.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private GoodsTypeDao goodsTypeDao;

    /**
     * 查询类型下的所有商品
     *
     * @param type
     * @param model
     * @return
     */
    @Override
    public String findType(int type, Model model) throws MyException{
        List<GoodsType> typeAll = goodsTypeDao.findAll();
        if (typeAll != null && typeAll.size() > 0) {
            model.addAttribute("typeAll", typeAll);
            System.out.println("--TypeServiceImpl----findType--model-->" + model);
            //判断商品的类型
            if (type == 4) {
                //如果是水果
                return "before/fruits";
            } else if (type == 5) {
                //如果是蔬菜
                return "before/vegetables";
            } else if (type == 6) {
                //如果是肉类
                return "before/meat";
            } else {
                //测试用的
                return "before/type";
            }
        }
        throw new MyException("出错了。。");
    }



}
