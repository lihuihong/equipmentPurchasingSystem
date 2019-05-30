package com.dsp.equipment.controller;


import com.dsp.equipment.entity.Department;
import com.dsp.equipment.entity.Result;
import com.dsp.equipment.services.DepartmentServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    
    @Autowired
    private DepartmentServiceImpl departmentService;
    
    @RequestMapping(value = "/list")
    @ResponseBody
    public Result list(Integer page, Integer limit , Department fun,
                       HttpServletResponse response)throws Exception{

        Result result = new Result();

        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Department> funList = departmentService.list(fun);
            PageInfo<Department> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Department> funList = departmentService.list(fun);
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
    public Result add(Department fun, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal = 0;
        if(fun.getId()==null){
            fun.setId(UUID.randomUUID().toString().replaceAll("-","").substring(0,5));
            resultTotal = departmentService.insert(fun);
        }else{
            resultTotal = departmentService.update(fun);
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
     * 删除信息
     * @param eqId
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String eqId, HttpServletResponse response)throws Exception{

        Integer num = departmentService.delete(eqId);
        Result result = new Result();
        if(num>0){
            result.setSuccess("成功");
        }else{
            result.setError("失败");
        }
        return result;
    }
}
