
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            试卷管理
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
              <a><cite>试卷管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <div class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <input type="text" id="search" name="username" value="${search}" placeholder="输入标题或科目搜索" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="searchPaper()"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                  </div>
                </div>
            </div>
            <xblock>
                        <select id="subject">
                            <optgroup label="科目">
                                <option value="语文">语 文</option>
                                <option value="数学">数 学</option>
                                <option value="英语">英 语</option>
                                <option value="物理">物 理</option>
                                <option value="化学">化 学</option>
                                <option value="生物">生 物</option>
                                <option value="地理">地 理</option>
                                <option value="政治">政 治</option>
                                <option value="历史">历 史</option>
                            </optgroup>
                        </select>
                <button class="layui-btn" onclick="addpaper(0)"><i class="layui-icon">&#xe608;</i>自动</button>
            <span class="x-right" style="line-height:25px">共有数据：${paperCount}条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="8%">编号</th>
                        <th width="20%">标题</th>
                        <th width="8%">科目</th>
                        <th width="8%">年级</th>
                        <th width="10%">上传时间</th>
                        <th width="11%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="paper" items="${paper.content}">
                    <tr>
                        <td>${paper.id}</td>
                        <td>${paper.title}</td>
                        <td>${paper.type}</td>
                        <td>${paper.grade}</td>
                        <td>${paper.addtime}</td>
                        <td class="td-manage">
                            <a title="查看详情" href="javascript:;" onclick="paper_management_look(this,'paper_management_show.jsp','4','','510')"
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

            //分页查询
            function reload(i) {
                var pageNow;
                if(i==0){
                    pageNow=0;
                }if(i==1){
                    pageNow=${pageNow}-1;
                }if(i==2){
                    pageNow=${pageNow}+1;
                }if(i==3){
                    pageNow=${totalPages}-1;
                }
                var search=$("#search").val();
                $.ajax({
                    type:"Post",
                    url:"findPaper",
                    dataType:"json",
                    data:{
                        pageNow:pageNow,
                        search:search
                    },
                    success:function (data) {
                        if(data==1){
                            window.location.reload();
                        }
                    }
                });
            }
            //模糊查找试卷
             function searchPaper() {
               var search=$("#search").val();
               if(search.length==0){
                   layer.msg('不能为空！', {icon: 5,time:1000});
               }else{
                    $.ajax({
                        type:"Post",
                        url:"findPaper",
                        dataType:"json",
                        data:{
                            search:search,
                        },
                        success:function (data) {
                            if(data==1){
                            layer.msg('查找成功', {icon: 6,time:1000},function (index) {
                                window.location.reload();
                            });
                            }else{
                                layer.msg('没有符合条件的试卷', {icon: 5,time:1000});
                            }
                        }
                    });
               }
             }

			//查看该试卷的详情
            function paper_management_look(obj,url,id,w,h) {
                var uid=$(obj).parents("tr").find("td").eq(0).text();
                $.ajax({
                    type:"Post",
                    url:"findPaperbyId",
                    dataType:"json",
                    data: {
                        id:uid,
                    },
                    success:function (data) {
                        if(data==1){
                            x_admin_show('题目详情',url,w,h);
                           // window.open("paper_management_show.jsp");
                        }
                        return false;
                    }

                });

            }
            //添加试卷
            function addpaper(tid) {
                 var subject=$("#subject").val();
                $.ajax({
                    type:"Post",
                    url:"addPaper",
                    dataType:"json",
                    data:{
                        israndom:tid,
                        subject:subject
                    },
                    success:function (data) {
                        if(data==1){
                            layer.msg('正在自动生成....', {icon: 4,time:2000},function (index) {
                                layer.msg('成功', {icon: 1,time:1000},function (index) {
                                    layer.msg('试卷名字为：'+subject+'模拟试卷', {icon: 1,time:2000},function (index) {
                                        window.location.reload();
                                    });
                                })

                            });
                        }
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