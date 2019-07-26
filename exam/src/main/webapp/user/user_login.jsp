<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Flat Login Form</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

  <link rel="stylesheet" href="css/style.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- 注意，验证码本身是不需要 jquery 库，此处使用 jquery 仅为了在 demo 使用，减少代码量 -->
  <script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>

  <!-- 引入 gt.js，既可以使用其中提供的 initGeetest 初始化函数 -->
  <script src="js/gt.js"></script>
</head>

<body>

  
<div class="container">
  <div class="info">
    <h1>Flat Login Form</h1><span>Made with <i class="fa fa-heart"></i> by Dream</span>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="css/hat.svg"/></div>

  <div class="login-form">
    <input type="text" placeholder="username" id="username"/>
    <input type="password" style="width: 260px" placeholder="password" id="pswd"/>
    <a href="javascript:;" id="set" title="显示密码" style="text-decoration: none;" class="fa fa-eye"  data-pwdloginbox="eye" rseat="pld_cpwd"></a>
    <div>
      <div id="captcha1">
        <p id="wait1" class="show">正在加载验证码......</p>
      </div>
    </div>
    <button id="button">login</button>
    <p class="message">Not registered? <a href="user_registered.jsp">Create an account</a></p>
  </div>
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
/*function login() {
    var username=$("#username").val();
    var pswd=$("#pswd").val();
    $.ajax({
        type:"post",
        url:"findByName",
        dataType:"json",
        data:{
            name:username,
            pswd:pswd
        },
        success:function (data) {
           if(data==0){
               layer.msg('不存在该用户',{icon:5,time:1500});
           }
           if(data==2){
               layer.msg('密码错误',{icon:5,time:1500});
           }
           if(data==1){
               layer.msg('登陆成功',{icon:6,time:1500},function (index) {
                   window.location.href="index.jsp";
               });

           }
        }
    });
}*/
   $("#set").click(function () {
       if($("#pswd").attr("type")=='password') {
           $("#pswd").attr("type", "text");
           $("#set").attr("class", "fa fa-eye-slash");
       }else{
           $("#pswd").attr("type", "password");
           $("#set").attr("class", "fa fa-eye");
       }
   })
    var handler1 = function (captchaObj) {
        $("#button").click(function (e){
            var result = captchaObj.getValidate();
            if (!result) {
                layer.msg('请滑动图片完成拼图！！！',{icon:5,time:1500});

                setTimeout(function () {
                    $("#notice1").hide();
                }, 2000);}
            else{
                //alert("验证成功，登录异步刷新！！！");
                var username=$("#username").val();
                var pswd=$("#pswd").val();
                $.ajax({
                    type:"post",
                    url:"findByName",
                    dataType:"json",
                    data:{
                        name:username,
                        pswd:pswd
                    },
                    success:function (data) {
                        if(data==0){
                            layer.msg('不存在该用户',{icon:5,time:1500});
                        }
                        if(data==2){
                            layer.msg('密码错误',{icon:5,time:1500});
                        }
                        if(data==1){
                            layer.msg('登陆成功',{icon:6,time:1500},function (index) {
                                window.location.href="index.jsp";
                            });

                        }
                    }
                });
            }

            e.preventDefault();
        });

        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha1");
    captchaObj.onReady(function () {
        $("#wait1").hide();
    });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    $.ajax({
        url: "/gt/register1?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "float", // 产品形式，包括：float，popup
                width: "100%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler1);
        }
    });
</script>
</body>
</html>
