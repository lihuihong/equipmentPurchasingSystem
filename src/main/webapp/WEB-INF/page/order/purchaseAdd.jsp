<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<title>采购管理-采购订单-增加订单-教学设备采购管理系统</title>
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
		<form class="layui-form frameContent layui-form-pane" lay-filter="form">
			<input type="hidden" value="2" name="status">
			<div class="layui-form-item" style="display: none">
				<div class="layui-form-label">订单编号</div>
				<div class="layui-input-block">
					<input type="hidden" name="" disabled placeholder="订单编号自动生成" autocomplete="off" class="layui-input">
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
			<%--<div class="layui-form-item">
				<div class="layui-form-label">供应商编号</div>
				<div class="layui-input-block">
					<select name="supId" id="supId">
					</select>
				</div>
			</div>--%>
			<div class="layui-form-item ">
				<div class="layui-form-label">申请人</div>
				<div class="layui-input-block" >
						<select name="userId" id="userId">
						</select>
				</div>
			</div>
			<%--<div class="layui-form-item">
				<div class="layui-form-label">设备编号</div>
				<div class="layui-input-block">
					<select name="eqId" id="eqId">
					</select>
				</div>
			</div>--%>

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
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="button" class="layui-btn" id="test1">
						<i class="layui-icon">&#xe67c;</i>上传订单照片
					</button>
				</div>
				<input type="hidden" id="photo" name="photo" value="" />
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<img class="layui-upload-img" width="100px" height="80px"
						 id="demo1" />
					<p id="demoText"></p>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<div class="layui-form-label">订单说明</div>
				<div class="layui-input-block">
					<textarea  name="explainInfo"  placeholder="请输入订单说明信息" class="layui-textarea"></textarea>
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
layui.use(['form','laydate','upload'], function(){
	var form = layui.form;
	var $ = layui.jquery;
    var laydate=layui.laydate;
    var upload=layui.upload;
    // 日期
    laydate.render({
        elem:"#orderTime",
        type:"datetime",
        value:new Date(),//默认显示当前时间
    });
	var uploadInst = upload.render({
		elem: '#test1' //绑定元素
		,url:'/sys/upload/img' //上传接口
		,before: function(obj){
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file, result){
				$('#demo1').attr('src', result); //图片链接（base64）
			});
		}
		,done: function(res){
			//如果上传失败
			if(res.code > 0){
				return layer.msg('上传失败,(可能原因：图片格式不正确)');
			}
			//上传成功
			document.getElementById("photo").value = res.url;//隐藏域保存文件路径

		}
		,error: function(){
			//演示失败状态，并实现重传
			var demoText = $('#demoText');
			demoText.html('<span style="color: #FF5722;">上传失败,(可能原因：图片格式不正确)</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
			demoText.find('.demo-reload').on('click', function(){
				uploadInst.upload();
			});
		}
	});
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
                $('#supId').html(html);
            }
            form.render('select'); //重新渲染select
        },
    });
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
                $('#userId').html(html);
            }
            form.render('select'); //重新渲染select
        },
    });
    //设备下拉选项
    $.ajax({
        url:'/equipment/list',
        type:'post',
        dataType:"json",
        success:function(data){
            var html = '<option value="">请选择设备</option>';
            if(data.code===0){
                $.each(data.data,function(index,value){
                    html += '<option value="'+value.eqId+'">'+value.eqId+'['+value.eqName+']'+'</option>';
                });
                //alert(html);
                $('#eqId').html(html);
            }
            form.render('select'); //重新渲染select
        },
    });
    //监听提交
	form.on('submit(submit)',function(data){
		layer.confirm('是否生成订单？',{icon: 3, title:'系统信息'},function(index){
			$.ajax({
				url:'/purchase/save',
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
						parent.layer.msg('订单生成成功！', {icon : 1});
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