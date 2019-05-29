<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/layui/css/layui.css" media="all">
	<style>
		.frameContent {padding:30px 30px 0px 0px}
		.frameBtn {text-align:center;margin:20px 0px 0px 30px;padding-top:20px;border-top:1px rgb(204,204,204) dashed}
	</style>
</head>
<body>
<div>
	<form class="layui-form frameContent"  lay-filter="form">
		<input type="hidden" value="1" name="isOk">
		<div class="layui-form-item">
			<div class="layui-form-label">设备编号</div>
			<div class="layui-input-block">
				<input type="text" name="eqId" id="eqId" disabled placeholder="请输入设备编号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-form-label">损坏人</div>
			<div class="layui-input-block" >
				<select name="isUser" id="isUser">
				</select>
			</div>
		</div>
		<div class="layui-form-item ">
			<div class="layui-form-label">损坏日期</div>
			<div class="layui-input-block">
				<input type="text" name="isTime" id="isTime" required lay-verify="required" placeholder="请输入联系地址" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<div class="layui-form-label">损坏原因</div>
			<div class="layui-input-block">
				<textarea  name="isRes"  placeholder="请输入损坏原因" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="frameBtn">
			<button class="layui-btn" lay-submit lay-filter="submit">修改保存</button>
		</div>
	</form>
</div>
</body>
<script src="/layui/layui.js" charset="utf-8"></script>
<script>
	var info = parent.preDate;
	layui.use(['form','laydate'], function(){
		var form = layui.form;
		var $ = layui.jquery;
		var laydate=layui.laydate;

		laydate.render({ //结束时间
			elem: '#isTime'
			,type: 'datetime'
		});

		//表单初始赋值
		if (info != null){
			form.val('form',{
				"eqId":info.eqId,
				"isTime":info.isTime,
				"isRes":info.isRes,
			});
			form.render();
		}
		//采购员
		$.ajax({
			url:'/user/list',
			type:'post',
			data:{'page':1,'limit':999999},
			dataType:"json",
			success:function(data){
				var html = '<option value="">请选择供应商</option>';
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
						$("#isUser").val(info.isUser)
					}
				}
				form.render('select'); //重新渲染select
			},
		});
		//监听提交
		form.on('submit(submit)',function(data){
			layer.confirm('是否确定保存修改？',{icon: 3, title:'系统信息'},function(index){
				$.ajax({
					url:'/equipment/save',
					type:'post',
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
							layer.alert(data.msg,{icon:2});
						}
					},
					error:function(data){
						//do something
						layer.msg('与服务器连接失败',{icon: 2});
					}
				});
			});
			return false;
		});
	});
</script>
</html>