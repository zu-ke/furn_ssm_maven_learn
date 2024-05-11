package com.zk.furn.service;

import com.zk.furn.bean.Furn;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

public class FurnServiceTest {

    /*属性*/
    private ApplicationContext ioc;
    /*从spring容器中，获取的是FurnService接口对象/代理对象*/
    private FurnService furnService;

    @Before
    public void init(){
        ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        String[] names = ioc.getBeanDefinitionNames();
        for (String name : names) {
            System.out.println(name);
        }
        furnService = ioc.getBean(FurnService.class);
        System.out.println("furnService = " + furnService);
    }

    @Test
    public void save(){
        Furn furn = new Furn(null, "北欧风格沙发1", "顺平家居",
                new BigDecimal(180), 666, 7, "assets/images/product-image/1.jpg");
        furnService.save(furn);
    }

    @Test
    public void findAll(){
        List<Furn> all = furnService.getAllFurns();
        for (Furn furn : all) {
            System.out.println(furn);
        }
    }

}
