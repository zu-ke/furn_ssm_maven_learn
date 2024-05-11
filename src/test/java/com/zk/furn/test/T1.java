package com.zk.furn.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/*查看spring工程是否搭建成功*/
public class T1 {

    @Test
    public void t1(){
        /*看看spring配置的bean是否可以获取到*/
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        /*获取bean*/
        System.out.println(ioc.getBean("pooledDataSource"));
        System.out.println(ioc.getBean("sqlSessionFactory"));
    }

}
