package com.dsp.equipment.controller;

import com.dsp.equipment.entity.Result;
import com.dsp.equipment.entity.Sort;
import com.dsp.equipment.services.SortServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/sort")
public class SortController {

    @Resource(name="SortServiceImpl")
    private SortServiceImpl sortService;

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
    public Result list(Integer page, Integer limit , Sort fun,
                       HttpServletResponse response)throws Exception{
        Result result = new Result();
        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Sort> funList = sortService.list(fun);
            PageInfo<Sort> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Sort> funList = sortService.list(fun);
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
    public Result add(Sort fun, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal = 0;
        if(fun.getSortId()==null){
            fun.setSortId(UUID.randomUUID().toString().replaceAll("-","").substring(0,5));
            //fun.setCreateTime(new Date());
            resultTotal = sortService.insert(fun);
        }else{
            resultTotal = sortService.update(fun);
        }
        Result result=new Result();
        if(resultTotal>0){
            result.setSuccess("成功");
        }else{
            result.setError("失败");
        }
        return result;
    }
    /**
     * 删除设备信息
     * @param eqId
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String eqId, HttpServletResponse response)throws Exception{

        Integer num = sortService.delete(eqId);
        Result result = new Result();
        if(num>0){
            result.setSuccess("成功");
        }else{
            result.setError("失败");
        }
        return result;
    }
    
}