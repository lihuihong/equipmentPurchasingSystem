<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title>设备管理-设备分类-添加分类-教学设备采购管理系统</title>
	<meta name="keywords" content="教学设备采购管理系统">
	<meta name="description" content="">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href=" /layui/css/layui.css" media="all">
	<style>
	.frameContent {padding:30px}
	.frameBtn {text-align:center;margin:20px auto;padding-top:20px;border-top:1px rgb(204,204,204) dashed}
	.frameBtn button{width: 120px;}
	</style>
</head>
<body>
	<div>
		<form class="layui-form frameContent">
			<div class="layui-form-item">
				<div class="layui-form-label">编号</div>
				<div class="layui-input-block">
					<input type="text" name="" disabled placeholder="部门编号自动生成" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">部门名称</div>
				<div class="layui-input-block">
					<input type="text" name="name" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="frameBtn">
				<button class="layui-btn" lay-submit lay-filter="submit">确定新增</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</form>
	</div>
</body>
<script src=" /layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form','laydate'], function(){
	var form = layui.form;
	var $ = layui.jquery;
	var laydate =layui.laydate;
	//监听提交
	form.on('submit(submit)',function(data){
		layer.confirm('是否确定新增？',{icon: 3, title:'系统信息'},function(index){
			$.ajax({
				url:'/department/save',
				type:'post',
				data:data.field,
				dataType:"json",
				beforeSend:function(){
					//console.log(JSON.stringify(data.field));
				},
				success:function(data){
					//do something
					if(data.code===0){
						var index = parent.layer.getFrameIndex(window.name);//获取当前窗口索引
						parent.layer.msg('添加成功', {icon : 1});
						parent.layer.close(index);
						parent.layui.table.reload('tableList');//重新加载父级tabel数据
					} else {
						layer.alert('抱歉，系统繁忙，请稍后再试！',{icon:2});
					}
				},
				error:function(data){
					//do something
					layer.msg('与服务器连接失败',{icon: 2});
				}
			});
			layer.close(index);
		});
		return false;
	});
});
</script>
</html>