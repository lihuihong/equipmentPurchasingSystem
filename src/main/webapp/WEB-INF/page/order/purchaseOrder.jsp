<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title>采购管理-采购订单-教学设备采购管理系统</title>
	<meta name="keywords" content="教学设备采购管理系统">
	<meta name="description" content="教学设备采购管理系统">
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
				<label class="layui-form-label">订单编号</label>
				<div class="layui-input-inline">
					<input type="text" name="orderId" id="orderId" autocomplete="off" placeholder="请输入订单编号" class="layui-input">
				</div>
				<button type="button" class="layui-btn btnSearch" lay-filter="search" lay-submit>查询</button>
				<button type="button" class="layui-btn layui-btn-normal btnAdd">+ 新增订单</button>
			</div>
		</form>
	</div>
 <div class="table">
	 <table class="layui-hide" id="tableList" lay-filter="demo"></table>
 </div>
</body>
<script src=" /layui/layui.js" charset="utf-8"></script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="stateTpl">
	{{#  if(d.status === '0'){ }}
	<span style="color: #2fc4f5;">{{ "审核通过" }}</span>
	{{#  } else if(d.status === '1') { }}
	<span style="color: #f52a21;">{{ "审核失败" }}</span>
	{{#  } else if(d.status === '2') { }}
	<span style="color: #f52a21;">{{ "未审核" }}</span>
	{{#  } }}
</script>
<script>
layui.use('table', function(){
	var table = layui.table;
	var $ = layui.jquery;
	//加载表格
	table.render({
		elem: '#tableList'
		,url:'/purchase/list'
        ,toolbar: true
		,defaultToolbar: ['filter']
        ,cols: [[
            {type:'numbers',title:'序号'},
			{field:'orderId',  title: '订单编号', align:'center'},
			{field:'orderTime', title: '订单日期', align:'center'},
            {field:'orderProject', title: '项目名称', align:'center'},
            {field:'supName', title: '供应商名称', align:'center'},
            {field:'userName', title: '采购员', align:'center'},
            {field:'eqName', title: '设备名称', align:'center'},
            {field:'orderNum', title: '订购数量', align:'center'},
            {field:'budget', title: '预算', align:'center',hide:true},
            {field:'explain', title: '订单说明', align:'center',hide:true},
            {field:'status', title: '订单状态', align:'center',templet:"#stateTpl"},
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
                    orderId: $('#orderId').val(),
			}
		});
	});
	//监听工具条
	table.on('tool(demo)', function(obj){
		var data = obj.data;
		if(obj.event === 'del'){
			layer.confirm('订单编号：'+data.orderId+'<br />项目名称：'+data.orderProject, {icon: 3, title:'是否确定删除?'}, function(index){
				$.ajax({
					url:'/purchase/delete',
					type:'post',
					data:{'eqId':data.orderId},
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
		} else if(obj.event === 'edit'){
			preDate = data;
			layer.open({
				title: '编辑订单',
				type: 2,
                area: ['580px', '680px'],
				maxmin: true,
				btnAlign: 'c',
				anim: 0,
				shade: [0.5, 'rgb(0,0,0)'],
				content: '/page/order/purchaseEdit',
				zIndex: layer.zIndex, //重点1
				success: function(layero){
					//layer.setTop(layero); //顶置窗口
				},
				yes: function(index, layero){
					//确认按钮
				}
			});
		}
	});
	//新增分类
	$('.btnAdd').on('click',function(){
		layer.open({
			title: '新增订单',
			type: 2,
			area: ['580px', '700px'],
			maxmin: true,
			btnAlign: 'c',
			anim: 0,
			shade: [0.5, 'rgb(0,0,0)'],
			content: '/page/order/purchaseAdd',
			zIndex: layer.zIndex, //重点1
			success: function(layero){
				//layer.setTop(layero); //顶置窗口
			},
			yes: function(index, layero){
				//确认按钮
			}
		});
	});
});
</script>
</html>