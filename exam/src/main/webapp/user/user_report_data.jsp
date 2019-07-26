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

    <title>数据分析</title>
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
        <div class="row" id="report2">
            <div class="col-md-4">
                <div class="card card-c1">
                    <div class="card-header card-chart" data-background-color="green">
                        <canvas class="ct-chart" id="myChart1" height="350"></canvas>
                    </div>
                    <div class="card-content">
                        <h4 class="title">考试次数</h4>
                        <p class="category">
                            <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.</p>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <i class="fa fa-clock-o"></i> updated 4 minutes ago
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card card-c1">
                    <div class="card-header card-chart" data-background-color="orange">
                        <canvas class="ct-chart" id="myChart2" height="270" width="500"></canvas>
                    </div>
                    <div class="card-content">
                        <h4 class="title">各科成绩走势</h4>
                        <p class="category">Last Campaign Performance</p>
                    </div>
                    <div class="card-footer">
                        <div class="stats">
                            <i class="fa fa-clock-o"></i>  updated 1 minutes ago
                        </div>
                    </div>
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

<!--Core Javascript -->
<script src="js/mychart.js"></script>
<script type="text/javascript">

    //Mychart1
    new Chart(document.getElementById("myChart1").getContext('2d'), {
        type: 'bar',
        data: {
            labels: ["语文", "数学", "英语", "物理", "化学", "生物", "地理", "历史", "政治"],
            datasets: [{
                label: '',
                type: 'bar',
                data: [${subject0}, ${subject1}, ${subject2}, ${subject3}, ${subject4}, ${subject5}, ${subject6}, ${subject7}, ${subject8}],
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(225, 19, 54, 1)',
                    'rgba(155, 159, 84, 1)',
                    'rgba(44, 19, 164, 1)',
                    'rgba(78, 59, 44, 1)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ''
            }
        }
    });
    //Mychart2
    new Chart(document.getElementById("myChart2"), {
        type: 'line',
        data: {
            labels: ['--','--','--','--','现在'],
            datasets: [{
                data: [${grade04},${grade03},${grade02},${grade01},${grade00}],
                label: '语文',
                borderColor: "#3e95cd",
                fill: false
            }, {
                data: [${grade14},${grade13},${grade12},${grade11},${grade10}],
                label: '数学',
                borderColor: "#8e5ea2",
                fill: false
            }, {
                data: [${grade24},${grade23},${grade22},${grade21},${grade20}],
                label: '英语',
                borderColor: "#3cba9f",
                fill: false
            }, {
                data: [${grade34},${grade33},${grade32},${grade31},${grade30}],
                label: '物理',
                borderColor: "#e8c3b9",
                fill: false
            }, {
                data: [${grade44},${grade43},${grade42},${grade41},${grade40}],
                label: '化学',
                borderColor: "#af65c4",
                fill: false
            }, {
                data: [${grade54},${grade53},${grade52},${grade51},${grade50}],
                label: '生物',
                borderColor: "#1fc464",
                fill: false
            }, {
                data: [${grade64},${grade63},${grade62},${grade61},${grade60}],
                label: '地理',
                borderColor: "#c3c4c4",
                fill: false
            }, {
                data: [${grade74},${grade73},${grade72},${grade71},${grade70}],
                label: '历史',
                borderColor: "#0d0ec4",
                fill: false
            }, {
                data: [${grade84},${grade83},${grade82},${grade81},${grade80}],
                label: '政治',
                borderColor: "#87c492",
                fill: false
            }
            ]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ''
            }
        }
    });
</script>
</body>

</html>