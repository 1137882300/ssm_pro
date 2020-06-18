package com.z.service.before.impl;

import com.z.dao.ConsumerDao;
import com.z.dao.GoodsDao;
import com.z.dao.NoticeDao;
import com.z.exception.MyException;
import com.z.pojo.Consumer;
import com.z.pojo.Goods;
import com.z.pojo.Notice;
import com.z.service.before.IndexService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private GoodsDao goodsDao;

    @Autowired
    private NoticeDao noticeDao;

    /**
     * 查询主页所需的数据Goods
     *
     * @param session
     * @return
     */
    @Override
    public String findGoods(HttpSession session) throws MyException{
        List<Goods> goodsAll = goodsDao.findAll();
        if (goodsAll != null && goodsAll.size() > 0) {
            session.setAttribute("goodsAll", goodsAll);
            System.out.println("--IndexServiceImpl----findGoods------goodsAll--->" + goodsAll);
            return "before/index";
        }
        throw new MyException("出错了。。");
    }

    /**
     * 查询公告
     *
     * @param model
     * @return
     */
    @Override
    public String findNotice(Model model) throws MyException {
        List<Notice> noticeAll = noticeDao.findNotice();
        if (noticeAll != null && noticeAll.size() > 0) {
            //查询ok
            //取出最后一条（也就是最新的）
            model.addAttribute("noticeAll",noticeAll.get(noticeAll.size()-1));
            System.out.println("--IndexServiceImpl----findNotice------noticeAll--->" + noticeAll);
            return "before/index";
        }
        throw new MyException("出错了。。");
    }
}
