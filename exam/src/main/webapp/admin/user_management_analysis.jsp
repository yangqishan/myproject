<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
            角色管理-综合能力分析
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-icon-style.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    </head>
    
    <body>
    <div class="col-md-6 mt-2" >
        <div class="card">
            <div class="dropdown pull-right menu-sett-card">
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
            <div class="card-block"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                <canvas  id="radar-chart" width="510" height="510" class="chartjs-render-monitor" style="display: block; width: 510px; height: 510px;"></canvas>
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

    <script src="js/mychart.js"></script>
    <script type="text/javascript">
        //Radar Chart
        //Radar Chart
        new Chart(document.getElementById("radar-chart"), {
            type: 'radar',
            data: {
                labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
                datasets: [
                    {
                        label: "",
                        fill: true,
                        backgroundColor: "rgba(179,181,198,0.2)",
                        borderColor: "rgba(179,181,198,1)",
                        pointBorderColor: "#fff",
                        pointBackgroundColor: "rgba(179,181,198,1)",
                        data: [8.77,55.61,21.69,6.62,6.82]
                    }, {
                        label: "2050",
                        fill: true,
                        backgroundColor: "rgba(255,99,132,0.2)",
                        borderColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        pointBackgroundColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        data: [25.48,54.16,7.61,8.06,4.45]
                    }, {
                        label: "2150",
                        fill: true,
                        backgroundColor: "rgba(255,99,132,0.2)",
                        borderColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        pointBackgroundColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        data: [25.48,54.16,7.61,8.06,4.45]
                    }, {
                        label: "2250",
                        fill: true,
                        backgroundColor: "rgba(255,99,132,0.2)",
                        borderColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        pointBackgroundColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        data: [25.48,54.16,7.61,8.06,4.45]
                    }, {
                        label: "2350",
                        fill: true,
                        backgroundColor: "rgba(255,99,132,0.2)",
                        borderColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        pointBackgroundColor: "rgba(255,99,132,1)",
                        pointBorderColor: "#fff",
                        data: [25.48,54.16,7.61,8.06,4.45]
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


    </script>
    </body>

</html>