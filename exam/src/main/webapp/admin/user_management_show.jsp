
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            用户管理-查看
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-icon-style.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    </head>
    
    <body>
        <div class="x-body">
            <blockquote class="layui-elem-quote">
                <img src="images/0.jpg" class="layui-circle" style="width:50px;float:left">
                <dl style="margin-left:80px; color:#019688">
                <dt><span >${userone.name}</span>
              </dl>
            </blockquote>
            <div class="pd-20">
              <table  class="layui-table" lay-skin="line">
                <tbody>
                  <tr>
                    <th  width="80">性别：</th>
                    <td>${userone.sex}</td>
                  </tr>
                  <tr>
                    <th>年级：</th>
                    <td>${userone.grade}</td>
                  </tr>
                  <tr>
                    <th>等级：</th>
                    <td>${userone.level}</td>
                  </tr>
                  <tr>
                      <th>积分</th>
                      <td>${userone.jifen}</td>
                  </tr>
                  <tr>
                    <th>地址：</th>
                    <td>${userone.address}</td>
                  </tr>
                  <tr>
                    <th>注册时间：</th>
                    <td>${userone.jointime}</td>
                  </tr>

                </tbody>
              </table>
            </div>
        </div>
        <div class="col-md-7 mt-2" >
            <div class="card">
                <div class="dropdown pull-right menu-sett-card">
                    <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-ellipsis-v men"></i>
                    </a>
                    <ul aria-labelledby="notifications" class="dropdown-menu">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;
            
              //自定义验证规则
              form.verify({
                nikename: function(value){
                  if(value.length < 5){
                    return '昵称至少得5个字符啊';
                  }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,repass: function(value){
                    if($('#L_pass').val()!=$('#L_repass').val()){
                        return '两次密码不一致';
                    }
                }
              });

              console.log(parent);
              //监听提交
              form.on('submit(add)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("增加成功", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
              });
              
              
            });
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