<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            数据统计
        </title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="./css/x-admin.css" media="all">
        <!--饼状图开始-->
        <script src="http://img.htmlsucai.com/cdn/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jsapi.js"></script>
<script type="text/javascript" src="js/corechart.js"></script>		
<script type="text/javascript" src="js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
	$('#myTable5').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable1').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>
        <!--结束-->
        
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>用户管理</cite></a>
              <a><cite>数据分析</cite></a>
            </span>
            <a class="layui-btn layui-btn-small"  style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">&#xe64c;</i></a>
        </div>
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
            });

            </script>
            <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
        <!--饼状图开始-->
        <div style="width:100%;margin:0 auto;">
        
        <table width="100%">
        <tr>
    <td colspan="2" align="center">数据分析图表显示</td>
  </tr>
  <tr>
    <td align="center"> <table id='myTable5'>
			<caption>各年级比例</caption>
			<thead>
				<tr>
					<th>总人数</th>
					<th>高一</th>
					<th>高二</th>
					<th>高三</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>${one}+${two}+${three}</th>
					<td>${one}</td>
					<td>${two}</td>
					<td>${three}</td>

                    
				</tr>
			</tbody>
		</table>  </td>
    <td align="center"> <table id='myTable1'>
			<caption>性别比例</caption>
			<thead>
				<tr>
					<th></th>
					<th>男</th>
					<th>女</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th></th>
					<td>${man}</td>
					<td>${women}</td>
					</tr>
			</tbody>
		</table>  </td>
  </tr>
</table>
	</div>	

        <!--结束-->
        <br /><br />
    </body>
</html>