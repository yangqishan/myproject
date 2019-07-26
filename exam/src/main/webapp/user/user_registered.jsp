<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Flat registered Form</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>


<div class="container">
  <div class="info">
    <h1>Flat registered Form</h1><span>Made with <i class="fa fa-heart"></i> by Dream</span>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="css/hat.svg"/></div>

    <input type="text" placeholder="name" id="name" onblur="registered()"/>
    <input type="password" placeholder="password" id="password"/>
    <input type="password" placeholder="Confirm password" id="passwords"/>
    <button onclick="registered()">create</button>
    <p class="message">Already registered? <a href="user_login.jsp">Sign In</a></p>

</div>

<script src='js/jquery.min.js'></script>
<script  src="js/index.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
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
    popheight = 39;
function registered() {

    var name=$("#name").val();
    var pswd=$("#password").val();
    var pswds=$("#passwords").val();
    if(name==""){
        layer.msg('请输入完整信息',{icon:5,time:1500});
        return false;
    }
    $.ajax({
        type:"post",
        url:"findByName",
        dataType:"json",
        data:{
            name:name,
            pswd:""
        },
        success:function (data) {
            if(data==2){
                layer.msg('该用户已经存在',{icon:5,time:1500});
            }else if(pswd==pswds&&pswd!=""){
                $.ajax({
                    type:"post",
                    url:"userRregistered",
                    dataType:"json",
                    data:{
                        name:name,
                        pswd:pswd
                    },
                    success:function (data) {
                        if(data==1){
                            layer.msg('注册成功',{icon:6,time:1500},function (index) {
                                window.location.href="user_login.jsp";
                            });
                        }
                    }
                });
            }else if(pswd!=""&&pswds!=""){
                layer.msg('两次密码不一样',{icon:5,time:1500});
            }else{
                return false;
            }


        }
    });
}

</script>
</body>

</html>
