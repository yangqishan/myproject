
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
                      <input type="text" id="search" name="username"  placeholder="搜索内容" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="searchTopic()"><i class="layui-icon">&#xe615;</i></button>
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
                        <option value="历史">历 史</option>
                    </optgroup>
                </select>
            <button class="layui-btn" onclick="topic_add('添加用户','','900','500')"><i class="layui-icon">&#xe608;</i>添加</button>
            <span class="x-right" style="line-height:25px">共有数据：${topiccount}条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th width="5%">
                            <input type="checkbox" name="" value="">
                        </th>
                        <th width="6%">编号</th>
                        <th width="20%">题目</th>
                        <th width="8%">科目</th>
                        <th width="8%">年级</th>
                        <th width="8%">答案</th>
                        <th width="8%">题型</th>
                        <th width="8%">分制</th>
                        <th width="8%">难度</th>
                        <th width="11%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>

                <c:forEach var="topic" items="${topic}">
                    <c:if test="${topic.flag==1}">
                    <tr>
                        <td> <input type="checkbox"  value="${topic.id}" id="ele${topic.id}" name="answer${topic.id}"onclick="num(this)"></td>
                        <td>${topic.id}</td>
                        <td>${topic.title}</td>
                        <td>${topic.type}</td>
                        <td>${topic.grade}</td>
                        <td>${topic.answer}</td>
                        <td>${topic.memo}</td>
                        <td>${topic.mark}</td>
                        <td>${topic.level}</td>
                        <td class="td-manage">

                            <a title="编辑" href="javascript:;" onclick="topic_management_edit(this,'topic_management_show.jsp','4','','510')"
                               class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
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
            var i=0;
            function num(obj) {
                var status=$(obj).parents("tr").find("td").eq(0).find("input").is(':checked');
                if(i<10&&status){
                    i++;
                    layer.msg('现在已选'+i+'个题目', {icon: 6,time:500});
                }else if(!status){
                    i--;
                    layer.msg('取消该题目现在已选'+i+'个题目', {icon: 5,time:500});
                }else{
                    //设置不选中
                    layer.msg('已经有10个题目', {icon: 6,time:500});
                }
            }
            //模糊查询
            function searchTopic() {
                var search=$("#search").val();
                if(search.length==0){
                    layer.msg('不能为空！', {icon: 5,time:1000});
                }else{
                    $.ajax({
                        type:"Post",
                        url:"searchtopic",
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
                var sum="";
                var subject=$("#subject").val();
                for(var i=1;i<110;i++){
                if ($("#ele"+i).is(':checked') ) {
                    sum=sum+$("#ele"+i).val()+",";
                 }
                    }
                    $.ajax({
                       type:"post",
                        url:"addPapers",
                        dataType:"json",
                        data:{
                           sum:sum,
                           subject:subject,
                        },
                        success:function (data) {
                           if(data==1){
                               layer.msg('添加'+subject+'试卷成功',{icon:1,time:1500});
                           }
                        }
                    });
            }
            // 题目-编辑
            function topic_management_edit(obj,url,id,w,h) {
                var id=$(obj).parents("tr").find("td").eq(1).text();
                var name=$(obj).parents("tr").find("td").eq(2).text();
                var type=$(obj).parents("tr").find("td").eq(3).text();
                var grade=$(obj).parents("tr").find("td").eq(4).text();
                var answer=$(obj).parents("tr").find("td").eq(5).text();
                var memo=$(obj).parents("tr").find("td").eq(6).text();
                var mark=$(obj).parents("tr").find("td").eq(7).text();
                var level=$(obj).parents("tr").find("td").eq(8).text();

                x_admin_show("编辑",url+"?id="+id+"&name="+name+"&type="+type+"&grade="+grade+"&answer="+answer+"&memo="+memo+"&mark="+mark+"&level="+level,w,h);
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