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

    <title> 头部</title>
    <link rel="shortcut icon" href="img/favicon.ico">


</head>
<body>
<header class="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
                <input type="search" placeholder="Search Now" class="form-control">
            </form>
        </div>
        <div class="container-fluid ">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a href="/user/" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down" style="color: black">在线考试系统</div>
                        <div class="brand-text brand-small"><img src="img/logo-icon.png" alt="Logo" class="img-fluid"></div>
                    </a>
                    <a id="toggle-btn" href="#" class="menu-btn active">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </div>
            </div>
            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Expand-->
                <li class="nav-item d-flex align-items-center full_scr_exp"><a class="nav-link" href="#"><img src="img/expand.png" onclick="toggleFullScreen(document.body)" class="img-fluid" alt=""></a></li>
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="#"><i class="icon-search"></i></a></li>
                <!-- Notifications-->
                <li class="nav-item dropdown">
                    <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell-o"></i><span class="noti-numb-bg"></span><span class="badge">12</span></a>
                    <ul aria-labelledby="notifications" class="dropdown-menu">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-envelope bg-red"></i>You have 6 new messages </div>
                                    <div class="notification-time"><small>4 minutes ago</small></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-twitter bg-skyblue"></i>You have 2 followers</div>
                                    <div class="notification-time"><small>4 minutes ago</small></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-upload bg-blue"></i>Server Rebooted</div>
                                    <div class="notification-time"><small>4 minutes ago</small></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item nav-link">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-twitter bg-skyblue"></i>You have 2 followers</div>
                                    <div class="notification-time"><small>10 minutes ago</small></div>
                                </div>
                            </a>
                        </li>
                        <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a></li>
                    </ul>
                </li>
                <!-- Messages                        -->
                <li class="nav-item dropdown"> <a id="messages" class="nav-link logout" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-envelope-o"></i><span class="noti-numb-bg"></span><span class="badge">10</span></a>
                    <ul aria-labelledby="messages" class="dropdown-menu">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="msg-profile"> <img src="/images/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                <div class="msg-body">
                                    <h3 class="h5 msg-nav-h3">Jason Doe</h3><span>Sent You Message</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="msg-profile"> <img src="/images/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                <div class="msg-body">
                                    <h3 class="h5 msg-nav-h3">Frank Williams</h3><span>Sent You Message</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="msg-profile"> <img src="/images/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                <div class="msg-body">
                                    <h3 class="h5 msg-nav-h3">Ashley Wood</h3><span>Sent You Message</span>
                                </div>
                            </a>
                        </li>
                        <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages    </strong></a></li>
                    </ul>
                </li>
                <c:if test="${username!=null}">
                <li class="nav-item dropdown">
                    <a id="profile" class="nav-link logout" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <c:if test="${user.sex=='女'||user.sex=='男'}"><img src="${user.img}" alt="..." class="img-fluid rounded-circle" style="height: 30px; width: 30px;"></c:if>
                        <c:if test="${user.sex==null}"><img src="" alt="..." class="img-fluid rounded-circle" style="height: 30px; width: 30px;"></c:if>
                    </a>
                    <ul aria-labelledby="profile" class="dropdown-menu profile">
                        <li>
                            <a rel="nofollow" href="javascript:;" class="dropdown-item d-flex">
                                <c:if test="${user.sex=='女'||user.sex=='男'}"><img src="${user.img}" alt="..." class="img-fluid rounded-circle" style="height: 30px; width: 30px;"></c:if>
                                <c:if test="${user.sex==null}"><img src="" alt="..." class="img-fluid rounded-circle" style="height: 30px; width: 30px;"></c:if>
                                <div class="msg-body">
                                    <h3 class="h5">${username}</h3>
                                </div>
                            </a>
                            <hr>
                        </li>
                        <li>
                            <a rel="nofollow"  href="reportCount?id=${user.id}" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content" ><i class="fa fa-user "></i>个人中心</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="profile.jsp" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content" ><i class="fa fa-cog"></i>修改密码</div>
                                </div>
                            </a>
                            <hr>
                        </li>
                        <li>
                            <a rel="nofollow" href="user_out" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-power-off"></i>退出</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                </c:if>
                <c:if test="${username==null}">
                <li class="nav-item dropdown">
                    <button type="button" class="btn btn-link"><a rel="nofollow" style="color: red" href="user_login.jsp" >登录</a></button>
                </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>
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

    </script>

</body>
</html>
