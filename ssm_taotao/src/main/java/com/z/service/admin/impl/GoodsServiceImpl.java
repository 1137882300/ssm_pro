package com.z.service.admin.impl;

import com.z.dao.GoodsDao;
import com.z.exception.MyException;
import com.z.pojo.Goods;
import com.z.service.admin.GoodsService;
import com.z.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    /**
     * 查询所有商品信息
     *
     * @return
     */
    @Override
    public String selectGoods(Model model) {
        List<Goods> goodsList = goodsDao.findAll();
        System.out.println("---GoodsServiceImpl---selectGoods-------goodsList--" + goodsList);
        //将goodsList存入model域中
        model.addAttribute("goodsList", goodsList);
        //转发到商品管理的jsp
        return "admin/selectGoods";
    }

    /**
     * 添加商品
     *
     * @param model
     * @return
     */
    @Override
    public String addGoods(Goods goods, Model model) throws MyException {
        System.out.println("GoodsServiceImpl----------------" + goods);
        System.out.println("GoodsServiceImpl----------------" + model);
        if (goodsDao.addGoods(goods) > 0) {
            //添加成功
//            return "forward:/goodsController/selectGoods";
//            return "admin/main";
            return "redirect:findGoodsByPage";
        }
        //添加失败
        throw new MyException("出错了。。");
    }

    /**
     * 删除商品
     *
     * @param gid
     * @return
     */
    @Override
    public String deleteGoods(int gid, Model model) throws MyException {
        System.out.println("GoodsServiceImpl---------deleteGoods------" + gid);
        if (goodsDao.deleteGoods(gid) > 0) {
            //删除成功
            return "admin/main";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 查询一个GoodsId
     *
     * @param gid
     * @param model
     * @return
     */
    @Override
    public String findGoodsById(int gid, Model model) throws MyException{
        System.out.println("GoodsServiceImpl---------findGoodsById------" + gid);
        Goods aGoods = goodsDao.findGoodsById(gid);
        System.out.println("GoodsServiceImpl---------findGoodsById---aGoods---" + aGoods.toString());
        if (aGoods != null) {
            model.addAttribute("getGid", aGoods.getGid());
            model.addAttribute("getGname", aGoods.getGname());
            model.addAttribute("getGoprice", aGoods.getGoprice());
            model.addAttribute("getGrprice", aGoods.getGrprice());
            model.addAttribute("getGstock", aGoods.getGstock());
            model.addAttribute("getGstype_num", aGoods.getGstype());
            model.addAttribute("getGstype", aGoods.getGoodsType().getGstype());
            System.out.println("GoodsServiceImpl---------findGoodsById---model---" + model);
            return "admin/updateGoods";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 更新商品
     *
     * @return
     */
    @RequestMapping("/updateGoods")
    public String updateGoods(Goods goods, Model model) throws MyException{
        System.out.println("GoodsServiceImpl---------updateGoods---goods---" + goods);
        if (goodsDao.updateGoods(goods) > 0) {
//            return "admin/main";
            return "redirect:findGoodsByPage";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 删除选中（批量删除）
     *
     * @param gid
     * @return
     */
    @Override
    public String deleteSelected(int gid) throws MyException{
        System.out.println("GoodsServiceImpl---------deleteSelected---gid---" + gid);
        if (goodsDao.deleteGoods(gid) > 0) {
//            return "admin/main";
            return "redirect:findGoodsByPage";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 分页查询
     *
     * @param _currentPage
     * @param _rows
     * @param condition
     * @return
     */
    @Override
    public String findGoodsByPage(String _currentPage, String _rows, Model model, Map<String, String[]> condition) {
        //遍历一下查询条件：condition
        Set<String> keySet = condition.keySet();
        for(String key : keySet){
            String value = condition.get(key)[0];
            System.out.println("value--->"+value);
            System.out.println("condition.get(key)--->"+condition.get(key));
        }
        /**
         * 下面是分页
         */
        //创建空的pageBean对象
        PageBean<Goods> pb = new PageBean<>();
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //判断上一页（到头了就不能点了）
        if (currentPage <= 0) {
            currentPage = 1;
        }
        System.out.println("--GoodsServiceImpl--findGoodsByPage-----currentPage1--->"+currentPage);
        //调用dao查询总记录数
        int totalCount = goodsDao.findTotalCount(condition);
        System.out.println("--GoodsServiceImpl--findGoodsByPage-----totalCount--->"+totalCount);
        pb.setTotalCount(totalCount);
        pb.setRows(rows);
        //计算总页码
        int totalPage = (totalCount % rows) == 0 ? (totalCount / rows) : (totalCount / rows) + 1;
        System.out.println("--GoodsServiceImpl--findGoodsByPage-----totalPage--->"+totalPage);
        //判断上一页（到尾了就不能点了）
        if(currentPage >= totalPage){
            currentPage = totalPage;
        }
        System.out.println("--GoodsServiceImpl--findGoodsByPage-----currentPage2--->"+currentPage);
        pb.setCurrentPage(currentPage);
        pb.setTotalPage(totalPage);
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        System.out.println("--GoodsServiceImpl--findGoodsByPage-----start--->"+start);
        List<Goods> list = goodsDao.findGoodsByPage(start, rows,condition);
        pb.setList(list);
        //把pb存到model对象中
        model.addAttribute("pb", pb);
        //把查询的条件也存起来，回显查询的数据
        model.addAttribute("condition",condition);
        //测试
        System.out.println("totalCount-->" + totalCount);
        System.out.println("start-->" + start);
        System.out.println("rows--->" + rows);
        System.out.println("totalPage--->" + totalPage);
        System.out.println("--GoodsServiceImpl---findGoodsByPage-------pb--" + pb);
        return "admin/selectGoods";
    }

}
