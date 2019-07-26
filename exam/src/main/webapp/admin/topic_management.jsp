
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            题目管理
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
              <a><cite>题库管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
            <div class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane" style="margin-top: 15px;">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <input type="text" id="search" name="username" value="${search}" placeholder="搜索内容" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="searchTopic()"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                  </div>
                </div>
            </div>
            <xblock>
            <button class="layui-btn" onclick="topic_add('添加题目','topic_add.jsp','900','500')"><i class="layui-icon">&#xe608;</i>添加</button>
            <span class="x-right" style="line-height:25px">共有数据：${topiccount}条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="6%">编号</th>
                        <th width="20%">题目</th>
                        <th width="8%">科目</th>
                        <th width="8%">年级</th>
                        <th width="8%">答案</th>
                        <th width="8%">题型</th>
                        <th width="8%">分制</th>
                        <th width="8%">难度</th>
                        <th width="10%">状态</th>
                        <th width="11%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="topic" items="${topic.content}">
                    <tr>
                        <td>${topic.id}</td>
                        <td>${topic.title}</td>
                        <td>${topic.type}</td>
                        <td>${topic.grade}</td>
                        <td>${topic.answer}</td>
                        <td>${topic.memo}</td>
                        <td>${topic.mark}</td>
                        <td>${topic.level}</td>
                        <td class="td-status" >
                            <c:if test="${topic.flag==1}">
                            <span class="layui-btn layui-btn-normal layui-btn-mini" >
                                已启用
                            </span>
                            </c:if>
                            <c:if test="${topic.flag==0}">
                             <span class="layui-btn layui-btn-disabled layui-btn-mini">
                                已停用
                             </span>
                            </c:if>
                        </td>
                        <td class="td-manage">
                            <c:if test="${topic.flag==0}">
                                <a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用">
                                <i class="layui-icon">&#xe62f;</i>
                                </a>
                            </c:if>
                            <c:if test="${topic.flag==1}">
                            <a style="text-decoration:none" onclick="member_stop(this,'10001')" href="javascript:;" title="停用">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            </c:if>
                            <a title="编辑" href="javascript:;" onclick="topic_management_edit(this,'topic_management_show.jsp','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="topic_management_delete(this)"
                               style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
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

                var start = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,choose: function(datas){
                        end.min = datas; //开始日选好后，重置结束日的最小日期
                        end.start = datas //将结束日的初始值设定为开始日
                    }
                };

                var end = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,choose: function(datas){
                        start.max = datas; //结束日选好后，重置开始日的最大日期
                    }
                };

            });
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
                    url:"findtopic",
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
            //模糊查询
            function searchTopic() {
                var search;
                search=$("#search").val();
                if(search.length==0){
                    layer.msg('不能为空！', {icon: 5,time:1000});
                }else{
                    $.ajax({
                        type:"Post",
                        url:"findtopic",
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
                                layer.msg('没有符合条件的题目', {icon: 5,time:1000});
                            }
                        }
                    });
                }
            }

            /*题目-添加*/
            function topic_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }

            /*题目-停用*/
            function member_stop(obj,id){
                layer.confirm('确认要停用吗？',function(index){
                    var id=$(obj).parents("tr").find("td").eq(0).text();
                    $.ajax({
                        type:"Post",
                        url:"topicStatus",
                        dataType:"json",
                        data:{
                            id:id,
                            status:0
                        },
                        success:function () {
                         return false;
                        }
                    });
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                });
            }

            /*题目-启用*/
            function member_start(obj,id){
                layer.confirm('确认要启用吗？',function(index){
                    var id=$(obj).parents("tr").find("td").eq(0).text();
                    $.ajax({
                        type:"Post",
                        url:"topicStatus",
                        dataType:"json",
                        data:{
                            id:id,
                            status:1
                        },
                        success:function () {
                            return false;
                        }
                    });
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                });
            }
            // 题目-编辑
            function topic_management_edit(obj,url,id,w,h) {
                var id=$(obj).parents("tr").find("td").eq(0).text();
                var name=$(obj).parents("tr").find("td").eq(1).text();
                var type=$(obj).parents("tr").find("td").eq(2).text();
                var grade=$(obj).parents("tr").find("td").eq(3).text();
                var answer=$(obj).parents("tr").find("td").eq(4).text();
                var memo=$(obj).parents("tr").find("td").eq(5).text();
                var mark=$(obj).parents("tr").find("td").eq(6).text();
                var level=$(obj).parents("tr").find("td").eq(7).text();

                x_admin_show("编辑",url+"?id="+id+"&name="+name+"&type="+type+"&grade="+grade+"&answer="+answer+"&memo="+memo+"&mark="+mark+"&level="+level,w,h);
            }
            /*题目-删除*/
            function topic_management_delete(obj){
                var id=$(obj).parents("tr").find("td").eq(0).text();
                var count=$("#topiccount").val()-1;
                layer.confirm('确认要删除吗？',function(index){
                    $.ajax({
                        type:"Post",
                        url:"topicDelete",
                        dataType:"json",
                        data:{
                            id:id,
                        },
                        success:function (data) {
                            if(data==1){
                            //发异步删除数据
                            layer.msg('已删除!',{icon:1,time:1000},function (index) {

                                window.location.reload();
                            });
                                //$(obj).parents("tr").remove();
                                //$("#topiccount").attr("value",count);
                            }
                        }
                    });

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