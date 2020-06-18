package com.z.service.admin;

import com.z.exception.MyException;
import com.z.pojo.Goods;
import org.springframework.ui.Model;

import java.util.Map;


/**
 * 商品管理的业务层
 */
public interface GoodsService {

    /**
     * 查询所有的商品信息
     * @return
     */
    String selectGoods(Model model);

    /**
     * 添加商品
     * @param model
     * @return
     */
    String addGoods(Goods goods, Model model) throws MyException;

    /**
     * 删除商品
     * @param gid
     * @return
     */
    String deleteGoods(int gid, Model model) throws MyException;

    /**
     * 查询一个GoodsId
     * @param gid
     * @param model
     * @return
     */
    String findGoodsById(int gid, Model model) throws MyException;

    /**
     * 更新商品
     * @param goods
     * @param model
     * @return
     */
    String updateGoods(Goods goods, Model model) throws MyException;

    /**
     * 删除选中（批量删除）
     * @param gid
     * @return
     */
    String deleteSelected(int gid) throws MyException;

    /**
     * 分页 条件 查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    String findGoodsByPage(String currentPage, String rows, Model model, Map<String, String[]> condition);
}
