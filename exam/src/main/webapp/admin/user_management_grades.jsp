
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
<link rel="dns-prefetch" href="//axvert.chsi.com.cn">
<link rel="dns-prefetch" href="//t1.chei.com.cn">
<link rel="dns-prefetch" href="//t2.chei.com.cn">
<link rel="dns-prefetch" href="//t3.chei.com.cn">
<link rel="dns-prefetch" href="//t4.chei.com.cn">
<link rel="dns-prefetch" href="//www.google-analytics.com">
<link rel="stylesheet"
	href='https://t4.chei.com.cn/yz/apply/assets2018/iview/css/iview.css'>
<link rel="stylesheet"
	href='https://t2.chei.com.cn/yz/apply/assets2018/css/wb-pc.min.css?2018092001'>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div id="app" class="main-wrapper">
		<h2 class="yzwb-header">用户成绩</h2>
		<div class="yzwb-box">
			<table class="ch-table ch-table-info margin-bottom-20"
				style="width: 100%;">
				<tbody>
				<c:forEach var="report" items="${report}">
					<tr>
						<td width="20%" class="c-grey">${report.title}</td>
						<td width="30%">${report.achievement}分</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src='https://t1.chei.com.cn/yz/apply/assets2018/js/least-ie11.min.js'></script>
  </body>
</html>
