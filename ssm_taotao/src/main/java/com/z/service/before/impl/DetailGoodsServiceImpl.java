package com.z.service.before.impl;

import com.z.dao.GoodsDao;
import com.z.exception.MyException;
import com.z.pojo.Goods;
import com.z.service.before.DetailGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DetailGoodsServiceImpl implements DetailGoodsService {

    @Autowired
    private GoodsDao goodsDao;

    /**
     * 根据id查goods
     *
     * @param gid
     * @param model
     * @return
     */
    @Override
    public String findGoodsById(int gid, Model model) throws MyException {
        System.out.println("--DetailGoodsServiceImpl---findGoodsById-----gid-->"+gid);
        Goods thisGoods = goodsDao.findGoodsById(gid);
        System.out.println("--DetailGoodsServiceImpl---findGoodsById-----thisGoods-->"+thisGoods);
        if (thisGoods != null) {
            model.addAttribute("Gid", thisGoods.getGid());
            model.addAttribute("Gname", thisGoods.getGname());
            model.addAttribute("Goprice", thisGoods.getGoprice());
            model.addAttribute("Grprice", thisGoods.getGrprice());
            model.addAttribute("Gpicture", thisGoods.getGpicture());
            model.addAttribute("Gstock", thisGoods.getGstock());
            model.addAttribute("Gstype", thisGoods.getGoodsType().getGstype());
            return "before/detailGoods";
        }
        throw new MyException("出错了。。");
    }
}
