package com.dsp.equipment.controller;

import com.dsp.equipment.entity.Result;
import com.dsp.equipment.entity.Warehousing;
import com.dsp.equipment.entity.Warehousing;
import com.dsp.equipment.services.WarehousingServiceImpl;
import com.dsp.equipment.services.WarehousingServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/warehousing")
public class WarehousingController {

    @Resource(name="WarehousingServiceImpl")
    private WarehousingServiceImpl warehousingService;
    /**
     * 查询所有设备分类的信息
     * @param page
     * @param limit
     * @param fun
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Result list(Integer page, Integer limit , Warehousing fun,
                       HttpServletResponse response)throws Exception{
        Result result = new Result();
        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Warehousing> funList = warehousingService.list(fun);
            PageInfo<Warehousing> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Warehousing> funList = warehousingService.list(fun);
            result.setSuccess("获取成功");
            result.setData(funList);
            result.setCount(funList.size());
        }
        return result;
    }

    /**
     * 保存修改功能
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    public Result add(Warehousing fun, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal = 0;
            //fun.setCreateTime(new Date());
        fun.setWareTime(new Date());
            resultTotal = warehousingService.insert(fun);
        Result result=new Result();
        if(resultTotal>0){
            result.setSuccess("成功");
        }else{
            result.setError("失败");
        }
        return result;
    }
}