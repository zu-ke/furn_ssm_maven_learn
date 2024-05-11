package com.zk.furn.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zk.furn.bean.Furn;
import com.zk.furn.bean.Msg;
import com.zk.furn.service.FurnService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FurnController {

    /*配置service*/
    @Resource
    private FurnService furnService;

    /*
    * 解读：
    *   @RequestBody：将前端提交的json数据封装成javaBean对象
    *   @ResponseBody：服务器返回的数据格式是按照json来返回的（底层是按照http协议进行协商返回的）
    * */
    @PostMapping("/save")
    @ResponseBody
    /*解读：加入数据校验*/
    public Msg save(@Validated @RequestBody Furn furn, Errors errors){
        Map<String, Object> map = new HashMap();
        List<FieldError> fieldErrors = errors.getFieldErrors();
        for (FieldError fieldError : fieldErrors) {
            map.put(fieldError.getField(), fieldError.getDefaultMessage());
        }

        /*判断检验是否通过*/
        if (!map.isEmpty()){
            return Msg.fail().add("errorMsg", map);
            /*前端接收的样子：
            * {
                "code": 400,
                "msg": "fail",
                "extend": {
                    "errorMsg": {
                        "name": "请输入家居名"
                    }
                }
            }
            * */
        }
        furnService.save(furn);
        return Msg.success();
    }

    @GetMapping("/getAllFurns")
    @ResponseBody
    public Msg getAllFurns(){
        List<Furn> furnList = furnService.getAllFurns();
        /*
        Map<String, Object> extend = new HashMap<String, Object>();
        extend.put("furnList", furnList);
        Msg success = Msg.success();
        success.setExtend(extend);
        return success;
        */
        return Msg.success().add("furnList", furnList);
    }

    @PutMapping("/updateFurnById")
    @ResponseBody
    public Msg updateFurnById(@RequestBody Furn furn){
        int res = furnService.updateFurnById(furn);
        if (res == 0){
            return Msg.fail();
        }
        return Msg.success();
    }

    /*解读：回显*/
    @GetMapping("/getFurnById/{id}")
    @ResponseBody
    public Msg getFurnById(@PathVariable Integer id){
        Furn furn = furnService.getFurnById(id);
        return Msg.success().add("furn", furn);
    }

    @DeleteMapping("/deleteFurnById/{id}")
    @ResponseBody
    public Msg deleteFurnById(@PathVariable Integer id){
        int res = furnService.deleteFurnById(id);
        if (res == 0){
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 分页查询
     * 传参方式：GET /listFurnByPage?pageNum=2&pageSize=10
     * 为什么不用@PathVariable？因为@RequestParam可以指定默认值
     * @param pageNum 第几页，默认为1
     * @param pageSize 每页几条数据，默认为5
     * @return
     */
    @GetMapping("/listFurnByPage")
    @ResponseBody
    public Msg listFurnByPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "5") Integer pageSize){
        /*tips:下面的代码可以重新写一个service方法，然后在这里调用它*/


        /*解读：设置分页参数*/
        PageHelper.startPage(pageNum, pageSize); //这一行代码，必须写在第一行！！！！！！！！！
        /*解读：
            完成查询，底层会进行物理分页，而不是逻辑分页，因为底层有了pageHelper，
            会根据分页参数来计算limit ?, ?，发出sql时会携带limit，可以查看运行时sql语句
        */
        List<Furn> furnList = furnService.getAllFurns();
        /*解读：
            将分页查询的结果封装到pageInfo
            pageInfo包含了分页的各个信息（以前原生家居项目的page模型是它的一个简略版）
        */
        PageInfo pageInfo = new PageInfo(furnList, pageSize);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @GetMapping("/getAllFurnsByCondition")
    @ResponseBody
    public Msg getAllFurnsByCondition(@RequestParam(defaultValue = "5") Integer pageSize,
                                      @RequestParam(defaultValue = "1") Integer pageNum,
                                      @RequestParam(defaultValue = "") String search){
        PageHelper.startPage(pageNum, pageSize); //这一行代码，必须写在第一行！！！！！！！！！
        List<Furn> allFurnsByCondition = furnService.getAllFurnsByCondition(search);

        PageInfo pageInfo = new PageInfo(allFurnsByCondition, pageSize);
        return Msg.success().add("pageInfo", pageInfo);
    }

}
