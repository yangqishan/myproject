<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>
        主页
    </title>
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="./css/x-admin.css" media="all">

        <script type="text/javascript">
            function getdate() {
                var date = new Date();
                //获取时间
                var dl = date.toLocaleString();
                //格式化
                var div1 = document.getElementById("Show_Time");
                //获取div
                div1.innerHTML = dl;
                //添加进入div
            }
        //定时器每一秒触发一次
        setInterval("getdate()", 1000);

    </script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <ul class="layui-nav" lay-filter="">
                <li class="layui-nav-item x-index" > <span id="Show_Time" style="margin-right: 20px;color: red;font-size:30px;"></span></li>
                <li class="layui-nav-item"><img src="images/0.jpg" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt="111"></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">${admin.name}</a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                      <dd><a href="javascript:;" onclick="adminlook('个人中心','adminlook.jsp','4','','510')">修改密码</a></dd>
                        <dd><a href="adminout">退出</a></dd>
                    </dl>
                </li>
                <!-- <li class="layui-nav-item">
                  <a href="" title="消息">
                      <i class="layui-icon" style="top: 1px;">&#xe63a;</i>
                  </a>
                  </li> -->
                <li class="layui-nav-item x-index"><a href="/user/">前台首页</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black x-side">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
                <!--题库管理-->
                <li class="layui-nav-item">
                    <a class="javascript:;" href="javascript:;" _href="main.html">
                        <i class="layui-icon" style="top: 3px;">&#xe62d;</i><cite>题库管理</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="topic_management.jsp" onclick="topic_management()">
                                <cite>题目详情</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="topic_management_data.jsp" onclick="topic_management_data()">
                                <cite>数据统计</cite>
                            </a>
                        </dd>
                        </dd>
                    </dl>
                </li>
                <!--用户管理-->
                <li class="layui-nav-item">
                    <a class="javascript:;" href="javascript:;" _href="main.html">
                        <i class="layui-icon" style="top: 3px;">&#xe613;</i><cite>用户管理</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class="">
                            <a href="javascript:" _href="user_management.jsp" onclick="user_management()">
                                <cite>用户详情</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:" _href="user_management_jifen.jsp" onclick="user_management_jifen()">
                                <cite>积分排名</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="user_management_data.jsp" onclick="user_management_data()">
                                <cite>数据统计</cite>
                            </a>
                        </dd>
                        </dd>
                    </dl>
                </li>
                <!--试卷管理-->
                <li class="layui-nav-item">
                    <a class="javascript:;" href="javascript:;" _href="main.html">
                        <i class="layui-icon" style="top: 3px;">&#xe60a;</i><cite>试卷管理</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="paper_management.jsp" onclick="paper_management()">
                                <cite>试卷详情</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="paper_management_add.jsp" onclick="paper_management_add()">
                                <cite>手动添加试卷</cite>
                            </a>
                        </dd>
                        </dd>
                    </dl>
                </li>
                <!--成绩管理-->
                <li class="layui-nav-item">
                    <a class="javascript:;" href="javascript:;" _href="main.html">
                        <i class="layui-icon" style="top: 3px;">&#xe637;</i><cite>成绩管理</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="report_management.jsp" onclick="report_management()">
                                <cite>成绩详情</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="report_management_desc.jsp">
                                <cite>成绩排名</cite>
                            </a>
                        </dd>
                        </dd>
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="report_management_data.jsp" onclick="report_management_data()">
                                <cite>成绩分析</cite>
                            </a>
                        </dd>
                        </dd>
                    </dl>
                </li>
                <!--网站信息管理-->
                <li class="layui-nav-item">
                    <a class="javascript:;" href="javascript:;">
                        <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>网站信息管理</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd class="">
                        <dd class="">
                            <a href="javascript:;" _href="">
                                <i class="layui-icon"></i><cite>首页</cite>
                            </a>
                        </dd>
                        </dd>

                    </dl>
                </li>
            </ul>
        </div>

    </div>
    <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true">
        <div class="x-slide_left"></div>
        <ul class="layui-tab-title">
            <li class="layui-this">
                数据管理
                <i class="layui-icon layui-unselect layui-tab-close">ဆ</i>
            </li>
        </ul>
        <div class="layui-tab-content site-demo site-demo-body">
            <div class="layui-tab-item layui-show">
                <iframe frameborder="0" src="Home.jsp" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
    <div class="site-mobile-shade">
    </div>
</div>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script src="./js/x-layui.js"></script>
<script src="./js/x-admin.js"></script>
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

      function adminlook(title,url,id,w,h) {
            x_admin_show(title,url,w,h);
   }
   //用户积分排名
   function user_management_jifen() {
       $.ajax({
           type:"Post",
           url:"userJifen",
           dataType:"json",
           data:{

           },
           success:function () {
               return false;
           }
       });
   }
    //用户添加头像
    function user_management_img() {
        $.ajax({
            type:"Post",
            url:"userimg",
            dataType:"json",
            data:{

            },
            success:function () {
                return false;
            }
        });
    }
   //手动添加试卷
   function paper_management_add() {
       $.ajax({
           type:"Post",
           url:"paperAdd",
           dataType:"json",
           data:{

           },
           success:function () {

               return false;
           }
       });
   }
   //查询题目信息
    function topic_management() {
        $.ajax({
            type:"Post",
            url:"findtopic",
            dataType:"json",
            data:{

            },
            success:function () {

                return false;
            }
        });
    }
   //查询用户信息
    function user_management() {
        $.ajax({
            type:"Post",
            url:"finduser",
            dataType: "json",
            data: {

            },
            success:function () {
               return false;
            }
        });
    }
    //用户数据分析
    function user_management_data() {
        $.ajax({
            type:"Post",
            url:"userAnalysis",
            dataType:"json",
            data:{

            },
            success:function () {
                return false;
            }
        });
    }
    //题目数据分析
    function topic_management_data() {
        $.ajax({
            type:"Post",
            url:"topicAnalysis",
            dataType:"json",
            data:{

            },
            success:function () {
                return false;
            }
        });
    }
    //查询成绩单详情
    function report_management() {
        $.ajax({
            type:"Post",
            url:"findReport",
            dataType:"json",
            data:{

            },
            success:function () {
                return false;
            }
        });
    }
    //成绩单数据分析
    function report_management_data() {
        $.ajax({
            type:"Post",
            url:"reportAnalysis",
            dataType:"json",
            data:{

            },
            success:function () {
                return false;
            }
        });
    }
    //查询试卷详情
    function paper_management() {
        $.ajax({
            type:"Post",
            url:"findPaper",
            dataType:"json",
            data:{

            },
            success:function () {
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