package com.zk.furn.test;

import com.zk.furn.bean.Furn;
import com.zk.furn.dao.FurnMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;

/*mybatis逆向工程结果测试（DAO）*/
public class FurnMapperTest {

    @Test
    public void insertSelective(){
        /*1.获取ioc容器*/
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        /*2.获取furnMapper*/
        /*3.解读：因为我们在spring配置文件中配置了：
            <!--配置扫描器，将mybatis接口的实现加入到ioc容器中-->
            <!--解读：后面我们的mapper接口放在com.zk.furn.dao下，因为mybatis处于dao层，用于操作db的-->
            <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
                <!--解读：扫描所有的dao接口的实现，加入到ioc容器中-->
                <!--解读：这里dao接口就是mapper接口-->
                <property name="basePackage" value="com.zk.furn.dao"></property>
             </bean>
         */
        FurnMapper furnMapper = ioc.getBean(FurnMapper.class);
        /*4.添加数据*/
        Furn furn = new Furn(null, "北欧风格沙发~", "顺平家居",
                new BigDecimal(180), 666, 7, "assets/images/product-image/1.jpg");
        int result = furnMapper.insertSelective(furn);
        System.out.println(result);
    }

    @Test
    public void deleteByPrimaryKey(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        FurnMapper furnMapper = ioc.getBean(FurnMapper.class);
        furnMapper.deleteByPrimaryKey(12);
    }

    @Test
    public void updateByPrimaryKeySelective(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        FurnMapper furnMapper = ioc.getBean(FurnMapper.class);
        Furn furn = new Furn(5, "北欧风格沙发~~~", null,
                null, null, null, null);
        furnMapper.updateByPrimaryKeySelective(furn);
    }

    @Test
    public void updateByPrimaryKey(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        FurnMapper furnMapper = ioc.getBean(FurnMapper.class);
        Furn furn = new Furn(6, "北欧风格沙发~", "顺平家居",
                new BigDecimal(180), 666, 7, "assets/images/product-image/1.jpg");
        furnMapper.updateByPrimaryKey(furn);
    }

    @Test
    public void selectByPrimaryKey(){
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        FurnMapper furnMapper = ioc.getBean(FurnMapper.class);
        Furn furn = furnMapper.selectByPrimaryKey(6);
        System.out.println(furn);
    }


}
