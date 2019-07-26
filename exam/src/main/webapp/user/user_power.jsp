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
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/profile.css">
    <title>用户能力</title>
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

        <!--***** CHART *****-->
        <div class="row">


            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" id="table" class="nav-link active" role="tab" data-toggle="tab">表格</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" id="canvas" class="nav-link"  role="tab" data-toggle="tab">图形</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-block">
                        <canvas id="polar-chart2" width="400" height="400"></canvas>
                    </div>

                    <div>
                        <table class="table table-hover" width="400" height="400" style="display: none">
                            <thead>
                            <tr class="bg-info text-white">
                                <th>科目</th>
                                <td>最高分</td>
                                <td>最低分</td>
                                <td>平均分</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">语文</th>
                                <td>${max0}分</td>
                                <td>${min0}分</td>
                                <td>${avg0}分</td>
                            </tr>
                            <tr class="table-warning">
                                <th scope="row">数学</th>
                                <td>${max1}分</td>
                                <td>${min1}分</td>
                                <td>${avg1}分</td>
                            </tr>
                            <tr>
                                <th scope="row">英语</th>
                                <td>${max2}分</td>
                                <td>${min2}分</td>
                                <td>${avg2}分</td>
                            </tr>
                            <tr class="table-success">
                                <th scope="row">物理</th>
                                <td>${max3}分</td>
                                <td>${min3}分</td>
                                <td>${avg3}分</td>
                            </tr>
                            <tr>
                                <th scope="row">化学</th>
                                <td>${max4}分</td>
                                <td>${min4}分</td>
                                <td>${avg4}分</td>
                            </tr>
                            <tr class="table-danger">
                                <th scope="row">生物</th>
                                <td>${max5}分</td>
                                <td>${min5}分</td>
                                <td>${avg5}分</td>
                            </tr>
                            <tr>
                                <th scope="row">地理</th>
                                <td>${max6}分</td>
                                <td>${min6}分</td>
                                <td>${avg6}分</td>
                            </tr>
                            <tr class="table-info">
                                <th scope="row">政治</th>
                                <td>${max7}分</td>
                                <td>${min7}分</td>
                                <td>${avg7}分</td>
                            </tr>
                            <tr>
                                <th scope="row">历史</th>
                                <td>${max8}分</td>
                                <td>${min8}分</td>
                                <td>${avg8}分</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

            <div class="col-md-6 mt-2">
                <div class="card">
                    <div class="dropdown pull-right menu-sett-card" >
                        <a id="notifications" class="nav-link" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-ellipsis-v men"></i>
                        </a>
                        <ul aria-labelledby="notifications" class="dropdown-menu">
                            <li>
                                <a rel="nofollow" href="#" id="table1" class="nav-link" role="tab" data-toggle="tab">表格</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="#" id="canvas1" class="nav-link active" role="tab" data-toggle="tab">图形</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <canvas id="radar-chart" width="400" height="400"></canvas>
                    </div>

                    <div>
                        <table class="table table-hover" width="400" height="400" style="display: none">
                            <thead>
                            <tr class="bg-info text-white">
                                <th>科目</th>
                                <td>最高分</td>
                                <td>最低分</td>
                                <td>平均分</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">语文</th>
                                <td>${max0}分</td>
                                <td>${min0}分</td>
                                <td>${avg0}分</td>
                            </tr>
                            <tr class="table-warning">
                                <th scope="row">数学</th>
                                <td>${max1}分</td>
                                <td>${min1}分</td>
                                <td>${avg1}分</td>
                            </tr>
                            <tr>
                                <th scope="row">英语</th>
                                <td>${max2}分</td>
                                <td>${min2}分</td>
                                <td>${avg2}分</td>
                            </tr>
                            <tr class="table-success">
                                <th scope="row">物理</th>
                                <td>${max3}分</td>
                                <td>${min3}分</td>
                                <td>${avg3}分</td>
                            </tr>
                            <tr>
                                <th scope="row">化学</th>
                                <td>${max4}分</td>
                                <td>${min4}分</td>
                                <td>${avg4}分</td>
                            </tr>
                            <tr class="table-danger">
                                <th scope="row">生物</th>
                                <td>${max5}分</td>
                                <td>${min5}分</td>
                                <td>${avg5}分</td>
                            </tr>
                            <tr>
                                <th scope="row">地理</th>
                                <td>${max6}分</td>
                                <td>${min6}分</td>
                                <td>${avg6}分</td>
                            </tr>
                            <tr class="table-info">
                                <th scope="row">政治</th>
                                <td>${max7}分</td>
                                <td>${min7}分</td>
                                <td>${avg7}分</td>
                            </tr>
                            <tr>
                                <th scope="row">历史</th>
                                <td>${max8}分</td>
                                <td>${min8}分</td>
                                <td>${avg8}分</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

         <canvas></canvas>
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


<!--Core Javascript -->
<script type="text/javascript">


    $("#table").click(function () {
        $("#polar-chart2").hide();
        $("table").eq(0).slideDown();
    })
    $("#canvas").click(function () {
        $("#polar-chart2").show();
        $("table").eq(0).hide();
    })

    $("#table1").click(function () {
        $("#radar-chart").hide();
        $("table").eq(1).slideDown();
    })
    $("#canvas1").click(function () {
        $("#radar-chart").show();
        $("table").eq(1).hide();
    })
    //Radar Chart
    new Chart(document.getElementById("radar-chart"), {
        type: 'radar',
        data: {
            labels: ["计算力", "逻辑思维", "空间感", "创造力","语言能力"],
            datasets: [
                 {
                    label:"${user.name}",
                    fill: true,
                    backgroundColor: "rgba(255,99,132,0.2)",
                    borderColor: "rgba(255,99,132,1)",
                    pointBorderColor: "#fff",
                    pointBackgroundColor: "rgba(255,99,132,1)",
                    pointBorderColor: "#fff",
                    data: [${avg1},${(avg3+avg4+avg5)/3.00},${avg6},${(avg7+avg8)/2.00},${(avg0+avg2)/2.00}]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Distribution in % of world Business'
            }
        }
    });

    //Polar Chart2
    new Chart(document.getElementById("polar-chart2").getContext('2d'), {
        type: 'polarArea',
        data: {
            labels: ["语文", "数学", "英语", "物理", "化学", "生物", "地理", "政治", "历史"],
            datasets: [

                {
                    backgroundColor: [
                        "#2ecc71",
                        "#3498db",
                        "#95a5a6",
                        "#9b59b6",
                        "#f1c40f",
                        "#e74c3c",
                        "#34495e",
                        "#c43116",
                        "#eb12ff"
                    ],
                    data: [${min0}, ${min1}, ${min2}, ${min3}, ${min4}, ${min5}, ${min6}, ${min7}, ${min8}]
                },
                {
                    backgroundColor: [
                        "#2ecc71",
                        "#3498db",
                        "#95a5a6",
                        "#9b59b6",
                        "#f1c40f",
                        "#e74c3c",
                        "#34495e",
                        "#c43116",
                        "#eb12ff"
                    ],
                    data: [${avg0}, ${avg1}, ${avg2}, ${avg3}, ${avg4}, ${avg5}, ${avg6}, ${avg7}, ${avg8}]
                },
                {

                    backgroundColor: [
                        "#2ecc71",
                        "#3498db",
                        "#95a5a6",
                        "#9b59b6",
                        "#f1c40f",
                        "#e74c3c",
                        "#34495e",
                        "#c43116",
                        "#eb12ff"
                    ],
                    data: [${max0}, ${max1}, ${max2}, ${max3}, ${max4}, ${max5}, ${max6}, ${max7}, ${max8}]
                }]
        }
    });
</script>
</body>
</html>
