<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style8.css"/>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="assets/css/codemirror.css" rel="stylesheet">
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/jquery.min.js"></script>
        <script src="assets/dist/echarts.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

  </head>
  
  <body>
    
    <div class="page-content clearfix">

             <!--实时交易记录-->
             <div class="clearfix">
             <div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> 
 
         </div>
 
<script type="text/javascript">
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-50);  
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-50);
		});
 });

        require.config({
            paths: {
                echarts: './assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '实时数据',
        subtext: '实时获取各年级各科平均分'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['高一','高二','高三']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['语文','数学','英语','物理','化学','生物','地理','政治','历史']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'高一',
            type:'bar',
            data:[${sessionScope.sums00/sessionScope.sum00}, ${sessionScope.sums01/sessionScope.sum01}, ${sessionScope.sums02/sessionScope.sum02}, ${sessionScope.sums03/sessionScope.sum03}, ${sessionScope.sums04/sessionScope.sum04}, ${sessionScope.sums05/sessionScope.sum05}, ${sessionScope.sums06/sessionScope.sum06},${sessionScope.sums07/sessionScope.sum07}, ${sessionScope.sums08/sessionScope.sum08}],
            markPoint : {
                data : [
                    {type : 'max', name: '最高'},
                    {type : 'min', name: '最低'}
                ]
            }           
        },
        {
            name:'高二',
            type:'bar',
            data:[${sessionScope.sums10/sessionScope.sum10}, ${sessionScope.sums11/sessionScope.sum11}, ${sessionScope.sums12/sessionScope.sum12}, ${sessionScope.sums13/sessionScope.sum13}, ${sessionScope.sums14/sessionScope.sum14}, ${sessionScope.sums15/sessionScope.sum15}, ${sessionScope.sums16/sessionScope.sum16},${sessionScope.sums17/sessionScope.sum17}, ${sessionScope.sums18/sessionScope.sum18}],
            markPoint : {
                data : [
                    {type : 'max', name: '最高'},
                    {type : 'min', name: '最低'}
                ]
            },
           
			
        }
		, {
            name:'高三',
            type:'bar',
            data:[${sessionScope.sums20/sessionScope.sum20}, ${sessionScope.sums21/sessionScope.sum21}, ${sessionScope.sums22/sessionScope.sum22}, ${sessionScope.sums23/sessionScope.sum23}, ${sessionScope.sums24/sessionScope.sum24}, ${sessionScope.sums25/sessionScope.sum25}, ${sessionScope.sums26/sessionScope.sum26},${sessionScope.sums27/sessionScope.sum27}, ${sessionScope.sums28/sessionScope.sum28}],
            markPoint : {
                data : [
                    {type : 'max', name: '最高'},
                    {type : 'min', name: '最低'}
                ]
            },
           
		}

    ]
};
                    
                myChart.setOption(option);
            }
        );
    </script> 
     </div>
    
  </body>
</html>
