
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            成绩单管理
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>成绩单</cite></a>
              <a><cite>管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <div class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <h3>${reportTitle}</h3>
                    </div>
                  </div>
                </div>
            </div>
            <xblock><span class="x-right" style="line-height:25px">考生姓名：${userReportName}</span>
            <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/daochu.png" width="15" height="15"></img></i>批量导出</button>
                考试成绩： <span style="color: red">${reportAchievement}分</span>
            <span class="x-right" style="line-height:25px">考试时间：${reportTime}</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="8%">题号</th>
                        <th width="10%">标题</th>
                        <th width="8%">用户答案</th>
                        <th width="8%">标准答案</th>
                        <th width="8%">分制</th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="topicReport" items="${topicReport}">
                    <tr>
                        <td>${topicReport.topic.id}</td>
                        <td>${topicReport.topic.title}</td>
                        <td>${topicReport.answer}</td>
                        <td>${topicReport.topic.answer}</td>
                        <td>${topicReport.topic.mark}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="page"></div>
        </div>
        <br /><br /><br />
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script src="./js/x-layui.js" charset="utf-8"></script>
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