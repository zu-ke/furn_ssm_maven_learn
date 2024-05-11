package com.zk.furn.service;

import com.zk.furn.bean.Furn;

import java.util.List;


public interface FurnService {

    public void save(Furn furn);

    public List<Furn> getAllFurns();

    public int updateFurnById(Furn furn);

    /*解读：回显*/
    public Furn getFurnById(Integer id);

    public int deleteFurnById(Integer id);

    /*解读：条件查询分页*/
    public List<Furn> getAllFurnsByCondition(String name);

}
