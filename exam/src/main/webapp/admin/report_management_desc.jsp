
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
              <a><cite>首页</cite></a>
              <a><cite>成绩排名</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <div class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">

                  </div>
                </div>
            </div>
            <xblock>
            <a class="layui-btn layui-btn-danger" onclick="excel()"><i class="layui-icon"><img src="images/daochu.png" width="15" height="15"></img></i>批量导出</a>
                <select id="subject">
                    <optgroup label="科目">
                        <c:if test="${subject=='语文'}"><option value="语文" selected>语 文</option></c:if>
                        <c:if test="${subject!='语文'}"><option value="语文">语 文</option></c:if>
                        <c:if test="${subject=='数学'}"><option value="数学" selected>数 学</option></c:if>
                        <c:if test="${subject!='数学'}"><option value="数学">数 学</option></c:if>
                        <c:if test="${subject=='英语'}"><option value="英语" selected>英 语</option></c:if>
                        <c:if test="${subject!='英语'}"><option value="英语">英 语</option></c:if>
                        <c:if test="${subject=='物理'}"><option value="物理" selected>物 理</option></c:if>
                        <c:if test="${subject!='物理'}"><option value="物理">物 理</option></c:if>
                        <c:if test="${subject=='化学'}"><option value="化学" selected>化 学</option></c:if>
                        <c:if test="${subject!='化学'}"><option value="化学">化 学</option></c:if>
                        <c:if test="${subject=='政治'}"><option value="政治" selected>政 治</option></c:if>
                        <c:if test="${subject!='政治'}"><option value="政治">政 治</option></c:if>
                        <c:if test="${subject=='历史'}"><option value="历史" selected>历 史</option></c:if>
                        <c:if test="${subject!='历史'}"><option value="历史">历 史</option></c:if>
                        <c:if test="${subject=='地理'}"><option value="地理" selected>地 理</option></c:if>
                        <c:if test="${subject!='地理'}"><option value="地理">地 理</option></c:if>
                        <c:if test="${subject=='生物'}"><option value="生物" selected>生 物</option></c:if>
                        <c:if test="${subject!='生物'}"><option value="生物">生 物</option></c:if>
                    </optgroup>
                </select>
                <a class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="reload(4)"><i class="layui-icon">&#xe615;</i></a>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="8%">编号</th>
                        <th width="20%">标题</th>
                        <th width="10%">姓名</th>
                        <th width="8%">科目</th>
                        <th width="8%">成绩</th>
                        <th width="10%">考试时间</th>
                        <th width="11%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="report" items="${lists}">
                    <tr>
                        <td>${report.report.id}</td>
                        <td>${report.report.title}</td>
                        <td>${report.name}</td>
                        <td>${report.report.subject}</td>
                        <td>${report.report.achievement}</td>
                        <td>${report.report.addtime}</td>
                        <td class="td-manage">
                            <a title="查看详情" href="javascript:;" onclick="report_management_look(this,'user_management_show.jsp','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon"><img src="images/look3.png" width="15" height="15"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${pageNow>0}">
                <a onclick="reload(0)">首页</a>
                <a onclick="reload(1)">上一页</a>
            </c:if>
            <c:if test="${pageNow<totalPages-1}">
                <a onclick="reload(2)">下一页</a>
                <a onclick="reload(3)">尾页</a>
            </c:if>
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
            //下载用户文件
            function excel() {
                var subject=$("#subject").val();
                $.ajax({
                    type:"Post",
                    url:"/excel/report",
                    dataType:"json",
                    data:{
                        subject:subject
                    },
                    success:function (data) {
                        if(data==1){
                            window.location.href="/excel/成绩单信息.xlsx";
                        }
                    }
                });

            }
            //分页查询
            function reload(i) {
                var pageNow=0;
                if(i==0){
                    pageNow=0;
                }if(i==1){
                    pageNow=${pageNow}-1;
                }if(i==2){
                    pageNow=${pageNow}+1;
                }if(i==3){
                    pageNow=${totalPages}-1;
                }
                var subject=$("#subject").val();
                $.ajax({
                    type:"Post",
                    url:"reportDesc",
                    dataType:"json",
                    data:{
                        pageNow:pageNow,
                        subject:subject
                    },
                    success:function (data) {
                        if(data==1){
                            window.location.reload();
                        }
                    }
                });

            }
			//查看该成绩单对应用户信息和试题详情
            function report_management_look(obj,url,id,w,h) {
                var uid=$(obj).parents("tr").find("td").eq(0).text();
                $.ajax({
                    type:"Post",
                    url:"findReportbyId",
                    dataType:"json",
                    data: {
                        id:uid,
                    },
                    success:function (data) {
                        if(data==1){
                            window.open("report_management_show.jsp");
                        }
                        return false;
                    }

                });

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