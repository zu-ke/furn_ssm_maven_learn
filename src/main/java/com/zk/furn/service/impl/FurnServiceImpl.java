package com.zk.furn.service.impl;

import com.zk.furn.bean.Furn;
import com.zk.furn.bean.FurnExample;
import com.zk.furn.dao.FurnMapper;
import com.zk.furn.service.FurnService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FurnServiceImpl implements FurnService {

    /*注入FurnMapper接口对象（代理对象）*/
    @Resource
    private FurnMapper furnMapper;

    public void save(Furn furn) {
        furnMapper.insertSelective(furn);
    }

    public List<Furn> getAllFurns() {
        /*解读：查看FurnMapper.xml文件，传入null，表示返回所有的家居信息*/
        return furnMapper.selectByExample(null);
    }

    public int updateFurnById(Furn furn) {
        return furnMapper.updateByPrimaryKeySelective(furn);
    }

    public Furn getFurnById(Integer id) {
        return furnMapper.selectByPrimaryKey(id);
    }

    public int deleteFurnById(Integer id) {
        return furnMapper.deleteByPrimaryKey(id);
    }

    /*根据条件分页查询*/
    public List<Furn> getAllFurnsByCondition(String name) {
        FurnExample furnExample = new FurnExample();
        /*解读：通过criteria可以设置查询对象*/
        FurnExample.Criteria criteria = furnExample.createCriteria();
        /*解读：判断name是否有有效值*/
        if (StringUtils.hasText(name)) {
            criteria.andNameLike("%"+ name +"%");
        }
        /*解读：如果没进入上面if条件里面，那么直接执行下面代码，就是直接查询所有家居*/
        return furnMapper.selectByExample(furnExample);
    }
}
