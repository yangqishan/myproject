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
 <div class="alert alert-block alert-success">
  <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
  <i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统.</strong>
 </div>
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              <h1>315</h1>
                              <p>考试用户</p>
                          </div>
                          </a>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                              <h1>526</h1>
                              <p>试卷数量</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1>2954</h1>
                              <p>题库题量</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1>1563</h1>
                              <p>访问记录</p>
                          </div>
                      </section>
                  </div>
              </div>
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
        subtext: '实时获取用户、商品、订单、交易数据记录'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['考试用户','试卷数量','题库题量','访问记录']
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
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'考试用户',
            type:'bar',
            data:[120, 800, 70, 232, 256, 767, 1356, 1622, 326, 200,164, 133],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }           
        },
        {
            name:'试卷数量',
            type:'bar',
            data:[26, 59, 30, 84, 27, 77, 176, 1182, 487, 188, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },
           
			
        }
		, {
            name:'题库题量',
            type:'bar',
            data:[26, 59, 60, 264, 287, 77, 176, 122, 247, 148, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },
           
		}
		, {
            name:'访问记录',
            type:'bar',
            data:[26, 59, 80, 24, 87, 70, 175, 1072, 48, 18, 69, 63],
            markPoint : {
                data : [
                    {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
                    {name : '年最低', value : 22, xAxis: 11, yAxis: 3}
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
