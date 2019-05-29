<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>采购管理-采购订单-订单详情-教学设备采购管理系统</title>
	<meta name="keywords" content="教学设备采购管理系统">
	<meta name="description" content="教学设备采购管理系统">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../../layui/css/layui.css" media="all">
	<style>
	.frameContent {padding:30px}
	.frameBtn {text-align:center;margin:20px auto;padding-top:20px;border-top:1px rgb(204,204,204) dashed}
	.frameBtn button{width: 120px;}
	.img .layui-form-label{margin-top: 32px}
	.img .upImg{width: 160px;height: 100px;padding: 0px 20px;}
	.img .upImg img{width: 100%;height: 100%}
	</style>
</head>
<body>
	<div>
		<form class="layui-form frameContent layui-form-pane">
			<div class="layui-form-item">
				<div class="layui-form-label">订单编号</div>
				<div class="layui-input-block">
					<input type="text" name="orderId"  placeholder="请输入订单编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">项目名称</div>
				<div class="layui-input-block">
					<input type="text" name="orderProject" required lay-verify="required" placeholder="请输入项目名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">订单日期</div>
				<div class="layui-input-block">
					<input type="text" name="orderTime" id="orderTime" disabled required lay-verify="required" placeholder="请输入日期" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">供应商编号</div>
				<div class="layui-input-block">
					<select name="supId">
						<option value="">请选择供应商</option>
						<option value="1">SUP1000</option>
						<option value="2">SUP1002</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item ">
				<div class="layui-form-label">采购员编号</div>
				<div class="layui-input-block" >
					<input type="text" name="id" value="1001" disabled required lay-verify="required" placeholder="请输入采购员编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">设备编号</div>
				<div class="layui-input-block">
					<select name="supId">
						<option value="">请选择设备</option>
						<option value="1">SB10001</option>
						<option value="2">SB10002</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item ">
				<div class="layui-form-label">订购数量</div>
				<div class="layui-input-block" >
					<input type="text" name="orderNum"  required lay-verify="required" placeholder="请输入订购数量" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item ">
				<div class="layui-form-label">预算</div>
				<div class="layui-input-block" >
					<input type="text" name="budget"  required lay-verify="required" placeholder="请输入预算金额" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item img">
				<div class="layui-form-label">上传订单</div>
				<div class="layui-input-block upImg">
					<img src="../../images/loginbg.jpg" alt="订单">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<div class="layui-form-label">订单说明</div>
				<div class="layui-input-block">
					<textarea  name="explain"  placeholder="请输入订单说明信息" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="display: none">
				<div class="layui-form-label">订单状态</div>
				<div class="layui-input-block">
					<input type="hidden" name="status" placeholder="请选择订单状态" autocomplete="off" class="layui-input">
					<select>
						<option value="">请选择订单状态</option>
						<option value="1" selected>待审核</option>
						<option value="2">审核通过</option>
					</select>
				</div>
			</div>
			<div class="frameBtn">
				<button type="button" class="layui-btn layui-btn-normal btnClose">关闭</button>
			</div>
		</form>
	</div>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        //获取个人信息
        $.ajax({
            url:'json/purchase1.json',
            type:'get',
            data:'',
            dataType:"json",
            beforeSend:function(){
                //console.log(JSON.stringify(data.field));
            },
            success:function(data){
                //do something
                if(data.code==0){
                    $('input[name="orderId"]').val(data.data[0].orderId);
                    $('input[name="orderTime"]').val(data.data[0].orderTime);
                    $('input[name="orderProject"]').val(data.data[0].orderProject);
                    $('input[name="id"]').val(data.data[0].id);
                    $('input[name="eqId"]').val(data.data[0].eqId);
                    $('input[name="orderNum"]').val(data.data[0].orderNum);
                    $('input[name="budget"]').val(data.data[0].budget);
                    $('textarea[name="explain"]').val(data.data[0].explain);
                    $('input[name="status"]').val(data.data[0].status);
                } else {
                    layer.alert('抱歉，系统繁忙，请稍后再试！',{icon:2});
                }
            },
            error:function(data){
                //do something
                layer.msg('与服务器连接失败',{icon: 2});
            }
        });
        //关闭
        $('.btnClose').on('click',function(){
            var index = parent.layer.getFrameIndex(window.name);//获取当前窗口索引
            parent.layer.close(index);
        });
    });
</script>
</html>