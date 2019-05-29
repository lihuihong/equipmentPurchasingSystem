package com.dsp.equipment.controller;

import com.dsp.equipment.entity.Equipment;
import com.dsp.equipment.entity.Result;
import com.dsp.equipment.services.EquipmentServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    @Resource(name="EquipmentServiceImpl")
    private EquipmentServiceImpl equipmentService;

    /**
     * 查询所有未损坏设备的信息
     * @param page
     * @param limit
     * @param fun
     * @param response
     * @return
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Result list(Integer page, Integer limit , Equipment fun,
                       HttpServletResponse response)throws Exception{

        Result result = new Result();

        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Equipment> funList = equipmentService.all(fun);
            PageInfo<Equipment> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Equipment> funList = equipmentService.all(fun);
            result.setSuccess("获取成功");
            result.setData(funList);
            result.setCount(funList.size());
        }

        return result;
    }



    /**
     * 查询所有已过期设备的信息
     * @param page
     * @param limit
     * @param fun
     * @param response
     * @return
     */
    @RequestMapping(value = "/listIsEnd")
    @ResponseBody
    public Result listIsEnd(Integer page, Integer limit , Equipment fun,
                       HttpServletResponse response)throws Exception{

        Result result = new Result();

        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Equipment> funList = equipmentService.listIsEnd(fun);
            PageInfo<Equipment> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Equipment> funList = equipmentService.listIsEnd(fun);
            result.setSuccess("获取成功");
            result.setData(funList);
            result.setCount(funList.size());
        }

        return result;
    }

    /**
     * 查询所有已损坏设备的信息
     * @param page
     * @param limit
     * @param fun
     * @param response
     * @return
     */
    @RequestMapping(value = "/listIsOk")
    @ResponseBody
    public Result listIsOk(Integer page, Integer limit , Equipment fun,
                            HttpServletResponse response)throws Exception{

        Result result = new Result();

        if(page!=null && limit !=null){
            PageHelper.startPage(page,limit);
            List<Equipment> funList = equipmentService.listIsOk(fun);
            PageInfo<Equipment> pageInfo = new PageInfo<>(funList);
            result.setSuccess("获取成功");
            result.setData(pageInfo.getList());
            result.setCount((int) pageInfo.getTotal());

        }else{
            List<Equipment> funList = equipmentService.listIsOk(fun);
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
    public Result add(Equipment fun, HttpServletRequest request, HttpServletResponse response)throws Exception{
        int resultTotal = 0;
        if(fun.getEqId()==null){
            fun.setEqId(UUID.randomUUID().toString().replaceAll("-","").substring(0,5));
            fun.setCreateTime(new Date());
            resultTotal = equipmentService.insert(fun);
        }else{
            resultTotal = equipmentService.update(fun);
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
     * 删除设备分类信息
	 * @param eqId
	 * @param response
	 * @return
     * @throws Exception
	 */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Result delete(String eqId, HttpServletResponse response)throws Exception{

        Integer num = equipmentService.delete(eqId);
        Result result = new Result();
        if(num>0){
            result.setSuccess("成功");
        }else{
            result.setError("失败");
        }
        return result;
    }

}