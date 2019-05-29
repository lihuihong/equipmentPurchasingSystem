<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title>设备管理-设备分类-编辑分类-教学设备采购管理系统</title>
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
		<form class="layui-form frameContent" lay-filter="form">
			<div class="layui-form-item">
				<div class="layui-form-label">分类编号</div>
				<div class="layui-input-block">
					<input type="text" name="sortId" disabled placeholder="请输入分类编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">分类名称</div>
				<div class="layui-input-block">
					<input type="text" name="sortName" required lay-verify="required" placeholder="请输入分类名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<div class="layui-form-label">分类描述</div>
				<div class="layui-input-block">
					<textarea  name="describeInfo" required lay-verify="required" placeholder="请输入描述信息" class="layui-textarea"></textarea>
				</div>
			</div>

			<div class="layui-form-item ">
				<div class="layui-form-label">创建时间</div>
				<div class="layui-input-block" >
					<input type="text" name="createTime" id="createTime" disabled required lay-verify="required" placeholder="请输入创建时间" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="frameBtn">
				<button type="button" class="layui-btn" lay-submit lay-filter="submit">确定修改</button>
				<button type="button" class="layui-btn layui-btn-normal btnClose">关闭</button>
			</div>
		</form>
	</div>
</body>
<script src=" /layui/layui.js" charset="utf-8"></script>
<script>
	var info = parent.preDate;
    layui.use(['form'], function(){
        var form = layui.form;
        var $ = layui.jquery;
		//表单初始赋值
		if (info != null){
			form.val('form',{
				"sortId":info.sortId
				,"sortName":info.sortName
				,"describeInfo":info.describeInfo
				,"createTime":info.createTime
			});
			form.render();
		}
        //监听提交
        form.on('submit(submit)',function(data){
            layer.confirm('是否确定修改？',{icon: 3, title:'系统信息'},function(index){
                $.ajax({
                    url:'/sort/save',
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
                            parent.layer.msg('修改成功', {icon : 1});
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
				layui.table.reload('tableList');
            });
            return false;
        });
        //关闭
        $('.btnClose').on('click',function(){
            var index = parent.layer.getFrameIndex(window.name);//获取当前窗口索引
            parent.layer.close(index);
        });
    });
</script>
</html>