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

    <title>Bootstrap Admin Template </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        
   <jsp:include page="head.jsp"></jsp:include>

<!--====================================================
                        PAGE CONTENT
======================================================-->
    <div class="page-content d-flex align-items-stretch">

        <!--***** SIDE NAVBAR *****-->
       <jsp:include page="nav.jsp"></jsp:include>
        <div class="content-inner chart-cont">
            <div class="input-group mb-2 mr-sm-2 mb-sm-0" style="width: auto" >
                <input type="text" class="form-control" id="report"  placeholder="成绩单搜索" value="${search}">
                <div class="input-group-addon"><a href="#" onclick="reportsearch()" style="color: blue">搜索</a></div>
            </div>
            <hr>
            <!--***** CONTENT *****-->     
            <div class="row">
                <% String color[]={"table-warning","table-success","table-danger","table-info"};
                    int i=0;
                    String s;
                %>
                <table class="table table-hover">
                  <thead>
                    <tr class="bg-info text-white">
                      <th>编号</th>
                      <th>标题</th>
                      <th>考试时间</th>
                      <th>科目</th>
                      <th>成绩</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>

                  <c:forEach var="userReport" items="${userReport.content}">
                   <%
                           s=color[i++%4];
                           request.setAttribute("s",s);
                   %>
                    <tr class="${s}">
                      <th scope="row">${userReport.id}</th>
                      <td>${userReport.title}</td>
                        <td>${userReport.addtime}</td>
                      <td>${userReport.subject}</td>
                      <td>${userReport.achievement}</td>
                        <td><a href="userTopic?id=${userReport.id}">详情</a></td>
                    </tr>

                  </c:forEach>
                  </tbody>
                </table>

                <c:if test="${pageNow >0}">
                    <a href="searchReport?pageNow=0&search=${search}">首页</a>
                    <a href="searchReport?pageNow=${pageNow-1 }&search=${search}">上一页</a>
                </c:if>

                <c:if test="${pageNow<userReport.totalPages-1}">
                    <a href="searchReport?pageNow=${pageNow+1}&search=${search}">下一页</a>
                    <a href="searchReport?pageNow=${userReport.totalPages-1}&search=${search}">尾页</a>
                </c:if>

            </div> 

        </div>
    </div> 

    <!--Global Javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper/popper.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.validate.min.js"></script> 
    <script src="js/chart.min.js"></script> 
    <script src="js/front.js"></script>

<script src="./lib/layui/layui.js" charset="utf-8"></script>
    <!--Core Javascript -->
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
        //模糊查询成绩单
        function reportsearch() {
            var search=$("#report").val();
            window.location.href="searchReport?search="+search;
        }
    </script> 
</body>

</html>