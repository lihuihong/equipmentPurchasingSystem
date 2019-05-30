<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>设备管理-过期设备- 设备采购管理系统</title>
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
					<input type="text" name="eqName" id="eqName" autocomplete="off" placeholder="请输入相关信息" class="layui-input">
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
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
layui.use('table', function(){
	var table = layui.table;
	var $ = layui.jquery;
	//加载表格
	table.render({
		elem: '#tableList'
		,url:'/equipment/listIsEnd'
        ,cols: [[
            {field:'eqId',  title: '设备编号', align:'center'},
            {field:'sortName1', title: '所属分类', align:'center'},
            {field:'eqName', title: '设备名称', align:'center'},
            {field:'model', title: '设备型号', align:'center'},
            {field:'unitPrice', title: '设备单价', align:'center'},
            {field:'placeOfOrigin', title: '设备产地', align:'center'},
            {field:'supName', title: '供应商', align:'center'},
            {field:'remakes', title: '备注', align:'center'},
            {fixed: 'right',title: '操作', align:'center', toolbar: '#barDemo'}
		]],
		page: true
	});
	//重载表格
	$('.btnSearch').on('click',function(){
		table.reload('tableList',{
			page: {
				curr: 1 //重新从第 1 页开始
			},
			where: {
                    eqName: $('#eqName').val(),
			}
		});
	});
	//监听工具条
	table.on('tool(demo)', function(obj){
		var data = obj.data;
	 if(obj.event === 'del'){
			layer.confirm('设备编号：'+data.eqId+'<br />设备名称：'+data.eqName, {icon: 3, title:'是否确定删除?'}, function(index){
				$.ajax({
					url:'/equipment/delete"',
					type:'post',
					data:{'eqId':data.eqId},
					dataType:"json",
					beforeSend:function(){//console.log(JSON.stringify(data.field));
                    },
					success:function(data){//do something
						if(data.code===0){
							layer.msg('恭喜，删除成功！',{icon:1});
						} else {
							layer.alert('抱歉，系统繁忙，请稍后再试！',{icon:2});
						}
					},
					error:function(data){//do something
						layer.msg('与服务器连接失败',{icon: 2});
					}
				});
				layer.close(index);
				layui.table.reload('tableList');
			});
		}
	});
});
</script>
</html>