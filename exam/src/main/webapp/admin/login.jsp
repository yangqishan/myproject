<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="./css/x-admin.css" media="all">
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script src="./js/x-layui.js" charset="utf-8"></script>
    <script type="text/javascript">

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
        //加载验证码
        function loadimage(){

          document.getElementById("randImage").src = "image.jsp?"+Math.random();

        }

        function checkForm() {
            var id = $("#name").val()
            var password = $("#password").val()
            var pagerandom= $("#pagerandom").val();
            if (id.length == 0) {
                layer.confirm('姓名不能为空', {icon: 2, title:'提示'}, function(index){
                    layer.close(index);
                });
                return false;
            }
            if (password.length == 0) {
                layer.confirm('密码不能为空', {icon: 2, title:'提示'}, function(index){

                    layer.close(index);
                });
                return false;
            }

        //登录验证
		$.ajax({
			type: "post",
			url: "logincheck",
			dataType: "json",
			data: {
				name:id,
				pswd:password,
                pagerandom:pagerandom

			},
		  success:function (data) {
			  if (data==1) { //登录成功
                  layer.msg('登录成功', {icon: 1,time: 2000},function () {
                      location.href = '/admin/find';  //跳转
                  });

			   } else if(data==0){ //登录失败
                  layer.confirm('姓名或密码错误', {icon: 5, title:'提示'}, function(index){
                      //do something
                      layer.close(index);
                      $("#name").val("");
                      $("#password").val("");
                      $("#pagerandom").val("");
                  });

			   }else{//验证码错误
			       layer.msg('验证码错误',{icon:5,time:1500});
                  $("#pagerandom").val("");
              }
		  },
		});
            return false;
        }
        //重置所有信息
        function resetValue() {
            $("#name").val("");
            $("#password").val("");
            $("#pagerandom").val("");
        }
    </script>
</head>
<body>
<div align="center" style="padding-top: 20px;">
        <table width="1004" height="584" background="images/login.jpg">
            <tr height="200">
                <td colspan="4"></td>
            </tr>
            <tr height="10">
                <td width="68%"></td>
                <td width="10%"><label>姓名：</label></td>
                <td><input type="text" id="name" name="name"/></td>
                <td width="30%"></td>
            </tr>
            <tr height="10">
                <td width="40%"></td>
                <td width="10%"><label>密码：</label></td>
                <td><input type="password" id="password" name="pswd" /></td>
                <td width="30%"></td>
            </tr>
            <tr height="10">
                <td width="40%"></td>
                <td width="10%"><label>验证码：</label></td>
                <td><input type="text" style="width: 120px" id="pagerandom" name="pagerandom" value="" />
                    <a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"> </a>
                </td>
                <td width="30%"></td>
            </tr>
            <tr height="10">
                <td width="40%"></td>
                <td width="10%">
                    <button class="btn btn-primary" onclick="checkForm()">登录</button>
                </td>
                <td>
                    <button class="btn btn-primary" onclick="resetValue()">重置</button>
                </td>
                <td width="30%"></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
</div>
</body>
</html>
