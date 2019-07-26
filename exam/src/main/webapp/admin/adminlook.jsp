
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            个人信息中心
        </title>
        <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
    </head>

    <body>
    <div class="x-body">
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    姓名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="username" disabled="" value="${admin.name}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="oldpass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="oldpass" name="oldpass" required lay-verify="required"
                           autocomplete="off" class="layui-input" onchange="check()">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="newpass" class="layui-form-label">
                    <span class="x-red">*</span>新密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="newpass" name="newpass" required lay-verify="required"
                           autocomplete="off" class="layui-input" onblur="check()">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
        <div class="layui-form-item">
            <label for="repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="repass" name="repass" required lay-verify="required"
                       autocomplete="off" class="layui-input" >
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                </label>
                <div class="layui-input-inline" style="width: 60px;">
                <button  class="layui-btn" lay-filter="save" lay-submit=""onclick="check()" >
                    确定修改
                </button>
                </div>
                <div class="layui-input-inline" style="width: 20px;margin-left: 80px">
                <button  class="layui-btn" lay-filter="save"  onclick="resetValue()">重置</button>
                </div>
            </div>
    </div>
    <script src="./lib/layui/layui.js" charset="utf-8">
    </script>
    <script src="./js/x-layui.js" charset="utf-8">
    </script>
    <script>

        layui.use(['laydate','element','laypage','layer'], function(){
            $ = layui.jquery;//jquery
            laydate = layui.laydate;//日期插件
            lement = layui.element();//面包导航
            laypage = layui.laypage;//分页
            layer = layui.layer;//弹出层

            //以上模块根据需要引入
            laypage({
                cont: 'page'
                ,pages: 100
                ,first: 1
                ,last: 100
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
            });

        });

        //审核密码
        function check(){
           var name=$("#name").val();
           var oldpass=$("#oldpass").val();
           var newpass=$("#newpass").val();
           var repass=$("#repass").val();
            $.ajax({
                type: "post",
                url: "logincheck",
                dataType: "json",
                data: {
                    name:name,
                    pswd:oldpass
                },
                success:function (data) {
                    if(data==1){

                        if(oldpass==newpass){
                            layer.msg('新密码与原密码相同！',{icon: 2,time: 2000});
                            return false;
                        }else{
                            if(newpass==repass&&newpass!=""){
                                layer.confirm('确认修改吗', {icon: 6, title:'提示'}, function(index){
                                    //do something
                                    layer.close(index);
                                    $.ajax({
                                        type: "post",
                                        url: "pswdupdate",
                                        dataType: "json",
                                        data: {
                                            name:name,
                                            pswd:newpass
                                        },
                                        success:function (data) {
                                            layer.msg('修改成功',{icon:1,time:100},function (idex) {
                                                x_admin_close();

                                            })
                                            top.location.href="/admin/";
                                        }
                                    });
                                    return false;
                                });
                            }else{
                                if(repass==""){
                                    return false;
                                }else{
                                    layer.msg('两次密码不相同！',{icon: 2,time: 2000});
                                    $("#newpass").val("");
                                    $("#repass").val("");
                                }
                            }
                        }

                    }else{

                        layer.msg('原密码不正确！',{icon: 2,time: 1000});
                    }
                }

            });

        }
        //重置
        function resetValue() {
            $("#oldpass").val("");
            $("#newpass").val("");
            $("#repass").val("");
        }
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    </body>

</html>