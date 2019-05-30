<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title>设备管理-设备信息-编辑设备- 设备采购管理系统</title>
	<meta name="keywords" content=" 设备采购管理系统">
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
			<input type="hidden" value="" id="eqId" name="eqId">
			<input type="hidden" value="0" name="isEnd">
			<input type="hidden" value="0" name="isOk">
			<div class="layui-form-item">
				<div class="layui-form-label">设备编号</div>
				<div class="layui-input-block">
					<input type="text" name="eqId" disabled placeholder="请输入设备编号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">所属分类</div>
				<div class="layui-input-block">
					<select name="sortName" id="sortName">
					</select>
				</div>
			</div>
			<div class="layui-form-item ">
				<div class="layui-form-label">设备名称</div>
				<div class="layui-input-block" >
					<input type="text" name="eqName"  required lay-verify="required" placeholder="请输入设备名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">设备的负责人</div>
				<div class="layui-input-block" >
					<select name="isUser" id="isUser">
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">是否过期</div>
				<div class="layui-input-block">
					<select name="isEnd" id="isEnd">
						<option value="0">未过期</option>
						<option value="1">已过期</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">是否损坏</div>
				<div class="layui-input-block">
					<select name="isOk" id="isOk">
						<option value="0">未损坏</option>
						<option value="1">已损坏</option>
					</select>
				</div>
			</div>


			<div class="layui-form-item ">
				<div class="layui-form-label">设备型号</div>
				<div class="layui-input-block" >
					<input type="text" name="model"  required lay-verify="required" placeholder="请输入设备型号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item ">
				<div class="layui-form-label">设备单价</div>
				<div class="layui-input-block" >
					<input type="text" name="unitPrice"  required lay-verify="required" placeholder="请输入设备单价" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item ">
				<div class="layui-form-label">设备产地</div>
				<div class="layui-input-block" >
					<input type="text" name="placeOfOrigin"  required lay-verify="required" placeholder="请输入设备产地" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-label">供应商编号</div>
				<div class="layui-input-block">
					<select name="supName" id="supName">
					</select>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<div class="layui-form-label">备注</div>
				<div class="layui-input-block">
					<textarea  name="remakes"  placeholder="请输入备注信息" class="layui-textarea"></textarea>
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
				"eqId":info.eqId
				,"sortName":info.sortName
				,"eqName":info.eqName
				,"model":info.model
				,"unitPrice":info.unitPrice
				,"placeOfOrigin":info.placeOfOrigin
				,"supName":info.supName
				,"remakes":info.remakes
			});
			$("#isEnd").val(info.isEnd);
			$("#isOk").val(info.isOk);
			form.render();
		}
		//供应商下拉选项
		$.ajax({
			url:'/supplier/list',
			type:'post',
			dataType:"json",
			success:function(data){
				var html = '<option value="">请选择供应商</option>';
				if(data.code===0){
					$.each(data.data,function(index,value){
						// console.log(data.data);
						html += '<option value="'+value.supId+'">'+value.supId+'['+value.supName+']'+'</option>';
						//alert(html);
						// console.log(value.supId+'['+value.supName+']')
					});
					//alert(html);
					$('#supName').html(html);
					if (info.supName != null){
						$("#supName").val(info.supName)
					}
				}
				form.render('select'); //重新渲染select
			},
		});
		$.ajax({
			url:'/user/list',
			type:'post',
			data:{'page':1,'limit':999999},
			dataType:"json",
			success:function(data){
				var html = '<option value="">设备的负责人</option>';
				if(data.code===0){
					$.each(data.data,function(index,value){
						// console.log(data.data);
						html += '<option value="'+value.id+'">'+value.id+'['+value.userName+']'+'</option>';
						//alert(html);
						// console.log(value.supId+'['+value.supName+']')
					});
					//alert(html);
					$('#isUser').html(html);
					if (info.isUser != null){
						$('#isUser').val(info.isUser)
					}
				}
				form.render('select'); //重新渲染select
			},
		});
		//设备下拉选项
		$.ajax({
			url:'/sort/list',
			type:'post',
			dataType:"json",
			success:function(data){
				var html = '<option value="">请选择所属分类</option>';
				if(data.code===0){
					$.each(data.data,function(index,value){
						// console.log(data.data);
						html += '<option value="'+value.sortId+'">'+value.sortName+'</option>';
						//alert(html);
						// console.log(value.supId+'['+value.supName+']')
					});
					//alert(html);
					$('#sortName').html(html);
					if (info.sortName != null){
						$('#sortName').val(info.sortName)
					}
				}
				form.render('select'); //重新渲染select
			},
		});
        //监听提交
        form.on('submit(submit)',function(data){
            layer.confirm('是否确定修改？',{icon: 3, title:'系统信息'},function(index){
                $.ajax({
                    url:'/equipment/save',
                    type:'get',
                    data:data.field,
                    dataType:"json",
                    beforeSend:function(){
                        //console.log(JSON.stringify(data.field));
                    },
                    success:function(data){
                        //do something
                        if(data.code==0){
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