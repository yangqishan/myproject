
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            角色管理
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
              <a><cite>用户管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <div class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <input type="text" id="search" value="${search}" placeholder="搜索内容" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="searchUser()"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                  </div>
                </div>
            </div>
            <xblock>

            <a onclick="excel()"class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="images/daochu.png" width="15" height="15"></img></i>批量导出</a>

            <span class="x-right" style="line-height:25px">共有数据：${usercount}条</span></xblock>
            <table class="layui-table" id="dataTable">
                <thead>
                    <tr>
                        <th width="8%">
                            编号
                        </th>
                        <th width="10%">
                            姓名
                        </th>
                        <th width="8%">
                            年龄</th>
                        <th width="8%">性别</th>
                        <th width="8%">年级</th>
                        <th width="20%">注册时间</th>
                        <th width="11%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="user" items="${user.content}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                        <td>${user.sex}</td>
                        <td>${user.grade}</td>
                        <td>${user.jointime}</td>
                        <td class="td-manage">
                            <a title="查看" href="javascript:;" onclick="user_management_look(this,'user_management_show.jsp','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon"><img src="images/look3.png" width="15" height="15"></i>
                            </a>
                            <a title="成绩单" href="javascript:;" onclick="user_management_grade(this,'user_management_grades.jsp','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon"><img src="images/look.png" width="15" height="15"></i>
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
            <c:if test="${pageNow<totalPages}">
                <a onclick="reload(2)">下一页</a>
                <a onclick="reload(3)">尾页</a>
            </c:if>
            </table>
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
                $.ajax({
                    type:"Post",
                    url:"/excel/user",
                    dataType:"json",
                    data:{
                    },
                    success:function (data) {
                        if(data==1){
                            window.location.href="/excel/用户信息.xlsx";
                        }
                    }
                });

            }
            //查询所有用户
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
                var search;
                search=$("#search").val();
                $.ajax({
                    type:"Post",
                    url:"finduser",
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
            //模糊查找
             function searchUser() {
               var search=$("#search").val();
               if(search.length==0){
                   layer.msg('不能为空！', {icon: 5,time:1000});
               }else{
                    $.ajax({
                        type:"Post",
                        url:"finduser",
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
                                layer.msg('没有符合条件的用户', {icon: 5,time:1000});
                            }
                        }
                    });
               }
             }
             /*添加*/
            function role_management_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }


			//查看用户信息
            function user_management_look(obj,url,id,w,h) {
                var uid=$(obj).parents("tr").find("td").eq(0).text();
                $.ajax({
                    type:"Post",
                    url:"findbyid",
                    dataType:"json",
                    data: {
                        id:uid,
                    },
                    success:function (data) {
                        x_admin_show('用户中心',url,w,h);
                    }

                });

            }
			//成绩单
            function user_management_grade(obj,url,id,w,h) {
                var uid=$(obj).parents("tr").find("td").eq(0).text();
                $.ajax({
                    type:"Post",
                    url:"findreportbyuser_id",
                    dataType:"json",
                    data: {
                        id:uid,
                    },
                    success:function (data) {
                        x_admin_show('用户成绩',url,w,h);
                    }

                });

            }
            /*删除*/
            function role_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
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