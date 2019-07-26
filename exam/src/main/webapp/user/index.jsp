<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>首页</title>
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/ui-elements/card.css">
    <link rel="stylesheet" href="css/styles.css">
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


        <div class="content-inner">

            <!--***** REPORT-1 *****-->

            <!--***** REPORT-2 *****-->
            <div class="row" id="report1">
                <div class="col-sm-1">
                    <div class="card">
                        <div class="card-block" >
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0"><i class="ti-arrow-up text-danger">积</i></h2>
                            </div>
                            <hr>
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0"><i class="ti-arrow-up text-danger">分</i></h2>
                            </div>
                            <hr>
                            <div class="text-left report1-cont">
                                <h2 class="font-light m-b-0"><i class="ti-arrow-up text-danger">榜</i></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    String g[]={"danger","success","warning","info","info"};
                    int i=0;
                %>
                <c:forEach items="${highjifen.content}" var="highjifen">
                    <%
                        request.setAttribute("color",g[i]);
                        request.setAttribute("i",++i);

                    %>
                    <div class="col-sm-2">
                        <div class="card">
                            <div class="card-block" >
                                <a rel="nofollow " href="userReportAnalysis?id=${highjifen.id}" class=" d-flex">
                                <div class="text-left report1-cont">
                                    <h2 class="font-light m-b-0"><i class="ti-arrow-up text-${color}">NO.${i}</i></h2>
                                     <span><img src="${highjifen.img}" title="${highjifen.name}" class="img-fluid rounded-circle" style="width: 50px;height: 50px"></span>
                                    <span class="text-muted">${highjifen.name}</span>
                                </div>
                                </a>
                                <span class="text-success">${highjifen.jifen}分</span>
                                <div class="progress">
                                </div>
                                <p><small>Last month 10% Growth</small></p>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>
            <!--***** REPORT-3 *****-->
            <div class="row" id="report3">
                <div class="col-md-6">
                    <div class="card card-c2">
                        <table class="table table-hover">
                          <thead>
                            <div class="dropdown pull-right menu-sett-card">
                                <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-ellipsis-v men"></i>
                                </a>
                                <ul aria-labelledby="notifications" class="dropdown-menu">
                                    <li>
                                        <a rel="nofollow"  href="#" class="dropdown-item nav-link">Edit</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                                    </li>
                                    <li>
                                        <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                                    </li>
                                </ul>
                            </div>
                            <tr>
                              <th>科目</th>
                              <th>更新时间</th>
                              <th>及格率</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${percent}" var="percent">
                              <tr>
                                  <td>${percent.subject}</td>
                                  <td>01/06/2019</td>
                                  <td>
                                      <div class="progress">
                                          <c:if test="${percent.sum>=75}"><div class="progress-bar bg-success" title="${percent.sum}%" role="progressbar" style="width: ${percent.sum}%; height:10px;" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div></c:if>
                                          <c:if test="${percent.sum<75&&percent.sum>60}"><div class="progress-bar bg-info" role="progressbar" title="${percent.sum}%"style="width: ${percent.sum}%; height:10px;" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div></c:if>
                                          <c:if test="${percent.sum>=35&&percent.sum<=60}"><div class="progress-bar bg-warning" role="progressbar" title="${percent.sum}%" style="width: ${percent.sum}%; height:10px;" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div></c:if>
                                          <c:if test="${percent.sum<35}"><div class="progress-bar bg-danger" role="progressbar"  title="${percent.sum}%" style="width: ${percent.sum}%; height:10px;" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div></c:if>
                                      </div>
                                  </td>
                              </tr>
                          </c:forEach>
                          </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-c2">
                        <div class="dropdown pull-right menu-sett-card" >
                            <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-ellipsis-v men"></i>
                            </a>
                            <ul aria-labelledby="notifications" class="dropdown-menu">
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                                </li>
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                                </li>
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                                </li>
                            </ul>
                        </div>
                        <div class="header">
                            <h4 class="title" style="color: red;">高分榜</h4>
                            <p class="category" id="Show_Time"></p>
                            <hr>
                        </div>
                        <div class="content newsf-list">
                            <ul class="list-unstyled">
                                <c:forEach items="${highscore}" var="highscore" begin="0" end="4">
                                    <li class="border border-success">
                                        <a rel="nofollow " href="userReportAnalysis?id=${highscore.report.userId}" class=" d-flex">
                                            <div class="news-f-img"> <img src="${highscore.report.ranswer}" title="${highscore.name}" class="img-fluid rounded-circle"></div>
                                            <div class="msg-body" >
                                                <small>${highscore.report.title} </small><br>
                                                    ${highscore.report.subject}   <max>${highscore.report.achievement}分</max>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                                <div id="upload" class="collapse list-unstyled">
                                    <c:forEach items="${highscore}" var="highscore" begin="5" end="9">
                                        <li class="border border-success">
                                            <a rel="nofollow " href="userReportAnalysis?id=${highscore.report.userId}" class=" d-flex">
                                                <div class="news-f-img"> <img src="${highscore.report.ranswer}" title="${highscore.name}" class="img-fluid rounded-circle"></div>
                                                <div class="msg-body" >
                                                    <small>${highscore.report.title} </small><br>
                                                        ${highscore.report.subject}<max>${highscore.report.achievement}分</max>
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </div>
                            </ul>
                            <div style="text-align: center" ><a href="#upload" aria-expanded="false" id="set" data-toggle="collapse">加载更多<i id="i" class="fa fa-angle-double-down"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-c2">
                        <div class="dropdown pull-right menu-sett-card" >
                            <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-ellipsis-v men"></i>
                            </a>
                            <ul aria-labelledby="notifications" class="dropdown-menu">
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">Edit</a>
                                </li>
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">FAQ</a>
                                </li>
                                <li>
                                    <a rel="nofollow" href="#" class="dropdown-item nav-link">Support</a>
                                </li>
                            </ul>
                        </div>
                        <div class="header">
                            <h4 class="title" style="color:yellow">竞技榜</h4>
                            <p class="category" id="Show_Time1"></p>
                            <hr>
                        </div>
                        <div class="content newsf-list">
                            <ul class="list-unstyled">
                                <C:forEach items="${highnum}" var="highnum" begin="0" end="4">
                                    <li class="border border-primary">
                                        <a rel="nofollow" href="userReportAnalysis?id=${highnum.id}" class=" d-flex">
                                            <div class="news-f-img"> <img src="${highnum.img}" title="${highnum.name}" class="img-fluid rounded-circle"></div>
                                            <div class="msg-body">
                                                <small>${highnum.name}</small><br>
                                                ${highnum.jifen}次考试
                                            </div>
                                        </a>
                                    </li>
                                </C:forEach>
                                <div id="upload1" class="collapse list-unstyled">
                                    <C:forEach items="${highnum}" var="highnum" begin="5" end="9">
                                        <li class="border border-primary">
                                            <a rel="nofollow" href="userReportAnalysis?id=${highnum.id}" class=" d-flex">
                                                <div class="news-f-img"> <img src="${highnum.img}" title="${highnum.name}" class="img-fluid rounded-circle"></div>
                                                <div class="msg-body">
                                                    <small>${highnum.name}</small><br>
                                                        ${highnum.jifen}次考试
                                                </div>
                                            </a>
                                        </li>
                                    </C:forEach>
                                </div>
                            </ul>
                            <div style="text-align: center"><a href="#upload1" aria-expanded="false" id="seti" data-toggle="collapse">加载更多<i id="ii" class="fa fa-angle-double-down"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!--***** FOOTER *****-->
            <div class="row" id="report4">
                <div class="col-md-3">
                    <div class="card text-center social-bottom sb-fb">
                        <i class="fa fa-facebook"></i>
                        <div>3250 +</div>
                        <p>Likes</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center social-bottom sb-tw">
                        <i class="fa fa-twitter"></i>
                        <div>2345 +</div>
                        <p>Following</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center social-bottom sb-gp">
                        <i class="fa fa-google-plus"></i>
                        <div>1253 +</div>
                        <p>Followers</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-center social-bottom sb-in">
                        <i class="fa fa-instagram"></i>
                        <div>4524 +</div>
                        <p>Likes</p>
                    </div>
                </div>
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
<script src="js/chart-page.js"></script>
    <!--Core Javascript -->
<script type="text/javascript">
    var myDate = new Date();
    var dl = myDate.toLocaleString();
    var year=myDate.getFullYear();
    var month=myDate.getMonth();
    var date=myDate.getDate();
    //格式化
    var div1 = document.getElementById("Show_Time")
    var div2 = document.getElementById("Show_Time1");
    //获取div
    div1.innerHTML ="更新时间："+dl;
    div2.innerHTML ="更新时间："+dl;

    $("#set").click(function () {
        var status=$("#i").attr("class")
        if(status=='fa fa-angle-double-down'){
            $("#set").html('回收<i id="i" class="fa fa-angle-double-up"></i>');
        }else{
            $("#set").html('加载更多<i id="i" class="fa fa-angle-double-down"></i>');
        }

    })

    $("#seti").click(function () {
        var status=$("#ii").attr("class")
        if(status=='fa fa-angle-double-down') {
            $("#seti").html('回收<i id="ii" class="fa fa-angle-double-up"></i></a>');
        }else{
            $("#seti").html('加载更多<i id="ii" class="fa fa-angle-double-down"></i></a>');
        }
    })
</script>
</body>

</html>