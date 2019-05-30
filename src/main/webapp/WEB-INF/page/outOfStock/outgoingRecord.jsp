<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>出库记录- 设备采购管理系统</title>
	<meta name="keywords" content=" 设备采购管理系统">
	<meta name="description" content=" 设备采购管理系统">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href=" /layui/css/layui.css" media="all">
	<style>
		.layui-search .layui-form{background: #fff;margin: 20px 0px;padding: 20px;}
		.layui-search .layui-form button{width: 140px}
		.layui-form-item{margin-bottom: 0px;}
		.table{background: #fff;padding: 20px;}
		.layui-laypage .layui-laypage-curr .layui-laypage-em {background-color: #0e799c;}
	</style>
</head>
<body>
	<div class="layui-search">
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">查询信息</label>
				<div class="layui-input-inline">
					<input type="text" name="orderId" id="orderId" autocomplete="off" placeholder="请输入相关信息" class="layui-input">
				</div>
				<button type="button" class="layui-btn btnSearch" lay-filter="search" lay-submit>查询</button>
			</div>
		</form>
	</div>
 <div class="table">
	 <table class="layui-hide" id="tableList" lay-filter="demo"></table>
 </div>
</body>
<script src=" /layui/layui.js" charset="utf-8"></script>
<script>
layui.use('table', function(){
	var table = layui.table;
	var $ = layui.jquery;
	//加载表格
	table.render({
		elem: '#tableList'
		,url:'/warehousing/list'
        ,cols: [[
            {type:'numbers',title:'序号'},
			{field:'orderId',  title: '设备编号', align:'center'},
            {field:'wareTime', title: '出库时间', align:'center'},
		]],
		page: true,
		where:{'type':0}
	});
	//重载表格
	$('.btnSearch').on('click',function(){
		table.reload('tableList',{
			page: {
				curr: 1 //重新从第 1 页开始
			},
			where: {
                    orderId: $('#orderId').val(),
			}
		});
	});
});
</script>
</html>