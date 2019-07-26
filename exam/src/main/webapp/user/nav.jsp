<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <title>导航栏</title>

<body>
<nav class="side-navbar">
    <hr>
    <div class="card form" id="form6">
    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="CustomSelect">
        <option selected>选择科目</option>
        <option value="语文">语文</option>
        <option value="数学">数学</option>
        <option value="英语">英语</option>
        <option value="物理">物理</option>
        <option value="化学">化学</option>
        <option value="生物">生物</option>
        <option value="地理">地理</option>
        <option value="政治">政治</option>
        <option value="历史">历史</option>
    </select>
    </div>
    <hr>
    <!-- Sidebar Navidation Menus-->
    <ul class="list-unstyled">
        <li class="active"> <a href="index.jsp"><i class="icon-home"></i>主页</a></li>
        <li><a href="javascript:;" onclick="random()"><i class="icon-interface-windows"></i>随机练习</a></li>
        <li><a href="#pages" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-file-text-o"></i>强化训练</a>
            <ul id="pages" class="collapse list-unstyled">
                <li><a href="javascript:;" onclick="random()">初级</a></li>
                <li><a href="javascript:;" onclick="random()">中级</a></li>
                <li><a href="javascript:;" onclick="random()">高级</a></li>
            </ul>
        </li>
        <li><a href="javascript:;" onclick="random()"> <i class="fa fa-building-o"></i>模拟考试</a>

        </li>
        <li> <a href="calendar.jsp"> <i class="fa fa-map-o"></i>日历</a></li>
        <c:if test="${user!=null}">
            <li> <a href="userTime?id=${user.id}"><i class="fa fa-globe"></i>时间简史</a></li>
        </c:if>
    </ul>
</nav>
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
 function random() {
     var subject=$("#CustomSelect").val();
     if(subject=="选择科目") {
         layer.msg('没有选科目', {icon: 5, time: 1000});
     }else{
         layer.confirm('确定选择'+subject+'吗？',{icon:6},function (index) {
             layer.msg('正在加载试卷。。',{icon:6,time:1500},function (index) {
                 window.location.href="userExam?subject="+subject;
             })
         })
     }
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
