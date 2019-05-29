<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>采购管理-订单审核-教学设备采购管理系统</title>
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
        .layui-search .layui-form {
            background: #fff;
            margin: 20px 0px;
            padding: 20px;
        }

        .layui-search .layui-form button {
            width: 140px
        }

        .layui-form-item {
            margin-bottom: 0px;
        }

        .table {
            background: #fff;
            padding: 20px;
        }

        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: #0e799c;
        }

        .warehousing {
            padding: 0px 16px;
        }
    </style>
</head>
<body>
<div class="layui-search">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-inline">
                <input type="text" name="orderId" id="orderId" autocomplete="off" placeholder="请输入订单编号"
                       class="layui-input">
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
    <a class="layui-btn layui-btn-xs warehousing" lay-event="warehousing">入库</a>
</script>
<script type="text/html" id="stateTpl">
    {{#  if(d.status === '审核通过'){ }}
    <span style="color: #2fc4f5;">{{ d.status }}</span>
    {{#  } else { }}
    <span style="color: #f52a21;">{{ d.status }}</span>
    {{#  } }}
</script>
<script type="text/html" id="switchType">
    {{#  if(d.status == '0'){ }}
    <input type="checkbox" class="switch_checked" lay-filter="type"
           lay-skin="switch" checked="checked" lay-text="是|否">
    {{#  }  else  if(d.status == '1'){ }}
    <input type="checkbox" class="switch_checked" lay-filter="type"
           lay-skin="switch" lay-text="是|否">
    {{#  }else if(d.status == '2'){  }}
    <input type="checkbox" class="switch_checked" lay-filter="type"
           lay-skin="switch" lay-text="是|否">
    {{#  }  }}

</script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var $ = layui.jquery;
        var form = layui.form;
        //加载表格
        table.render({
            elem: '#tableList'
            , url: '/purchase/list'
            , toolbar: true
            , defaultToolbar: ['filter']
            , cols: [[
                {type: 'numbers', title: '序号'},
                {field: 'orderId', title: '订单编号', align: 'center'},
                {field: 'status', title: '订单审核', align: 'center', templet: '#switchType'},
                {field: 'orderTime', title: '订单日期', align: 'center'},
                {field: 'orderProject', title: '项目名称', align: 'center'},
                {field: 'supName', title: '供应商名称', align: 'center'},
                {field: 'userName', title: '采购员', align: 'center'},
                {field: 'eqName', title: '设备名称', align: 'center'},
                {field: 'orderNum', title: '订购数量', align: 'center'},
                {field: 'budget', title: '预算', align: 'center', hide: true},
                {
                    field: 'photo', title: '订单图片', align: 'center', templet:
                        function (d) {
                            return '<div onclick="show_img(this)" ><img src="' + d.photo + '" alt="" ></a></div>';
                        }

                },
                {field: 'explain', title: '订单说明', align: 'center', hide: true},
                {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,
            where:{'examine':2}
            , done: function (res, curr, count) {
                hoverOpenImg();//显示大图
                $('table tr').on('click', function () {
                    $('table tr').css('background', '');
                });
            }

        });

        function hoverOpenImg() {
            var img_show = null; // tips提示
            $('td img').hover(function () {
                //alert($(this).attr('src'));
                var img = "<img class='img_msg' src='" + $(this).attr('src') + "' style='width:160PX;' />";
                img_show = layer.tips(img, this, {
                    tips: [2, 'rgba(41,41,41,.5)']
                    , area: ['200px']
                });
            }, function () {
                layer.close(img_show);
            });
            $('td img').attr();

        }

        //重载表格
        $('.btnSearch').on('click', function () {
            table.reload('tableList', {
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    orderId: $('#orderId').val()
                }
            });
        });
        //监听状态操作
        form.on('switch(type)', function (data) {
            // 获取当前控件
            var selectIfKey=data.othis;
            // 获取当前所在行
            var parentTr = selectIfKey.parents("tr");
            // 获取当前所在行的索引
            var parentTrIndex = parentTr.attr("data-index");
            // 获取“是否主键”的值
            var ifKey=parentTr.find(('td:eq(1)')).text().trim();
            //开关是否开启，true或者false
            var checked = data.elem.checked;
            //获取所需属性值
            var show = 1;
            if (checked == true) {
                show=0;
            } else {
                show=1;
            }
            $.ajax({
                url:'/purchase/save',
                type:'post',
                data:{"orderId":ifKey,"status":show},
                dataType:"json",
                beforeSend:function(){//console.log(JSON.stringify(data.field));
                },
                success:function(data){//do something
                    if(data.code === 0){
                        layer.msg('修改成功', {icon: 1});
                    } else {
                        layer.msg('修改失败', {icon: 2});
                    }
                    parent.layui.table.reload('tableList');
                },
                error:function(data){//do something
                    layer.msg('与服务器连接失败',{icon: 2});
                }
            });
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'warehousing') {
                layer.confirm('订单编号：' + data.orderId + '<br />项目名称：' + data.orderProject, {
                    icon: 3,
                    title: '确定入库?'
                }, function (index) {
                    $.ajax({
                        url: '/equipment/save',
                        type: 'post',
                        data: {'isType':1,'eqId':data.eqId},
                        dataType: "json",
                        beforeSend: function () {//console.log(JSON.stringify(data.field));
                        },
                        success: function (dataInfo) {//do something
                            if (dataInfo.code === 0) {
                                $.ajax({
                                    url: '/purchase/save',
                                    type: 'post',
                                    data: {'examine':0,'orderId':data.orderId},
                                    dataType: "json",
                                    beforeSend: function () {//console.log(JSON.stringify(data.field));
                                    },
                                    success: function (dataInfo1) {//do something
                                        if (dataInfo1.code == 0) {
                                                $.ajax({
                                                    url: '/warehousing/save',
                                                    type: 'post',
                                                    data: {'type':1,'orderId':data.orderId,'warePerson':data.userId},
                                                    dataType: "json",
                                                    beforeSend: function () {//console.log(JSON.stringify(data.field));
                                                    },
                                                    success: function (data) {//do something
                                                        if (data.code == 0) {
                                                            layer.msg('入库成功！', {icon: 1});
                                                            layer.close(index);
                                                            layui.table.reload('tableList');
                                                        } else {
                                                            layer.alert('抱歉，系统繁忙，请稍后再试！', {icon: 2});
                                                        }
                                                    },
                                                    error: function (data) {//do something
                                                        layer.msg('与服务器连接失败', {icon: 2});
                                                    }
                                                });
                                        } else {
                                            layer.alert('抱歉，系统繁忙，请稍后再试！', {icon: 2});
                                        }
                                    },
                                    error: function (data) {//do something
                                        layer.msg('与服务器连接失败', {icon: 2});
                                    }
                                });
                            } else {
                                layer.alert('抱歉，系统繁忙，请稍后再试！', {icon: 2});
                            }

                        },
                        error: function (data) {//do something
                            layer.msg('与服务器连接失败', {icon: 2});
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