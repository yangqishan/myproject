<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>试卷详情</title>
	<link rel="shortcut icon" href="img/favicon.ico">

	<!-- global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-icon-style.css">
	<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

	<!-- Core stylesheets -->
	<link rel="stylesheet" href="css/profile.css">
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/test.css" rel="stylesheet" type="text/css" />
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}
</style>

</head>
<body>

<!--====================================================
                         MAIN NAVBAR
======================================================-->
<jsp:include page="head.jsp"></jsp:include>

<div class="main">
	<!--nr start-->
	<div class="test_main">
		<h2>${title}</h2>
		<div class="nr_left">
			<div class="test">
				<form action="" method="post">
					<div class="test_title">
						<font><input type="button" name="test_jiaojuan" onclick="excel()" value="打印"></font>
					</div>
					
						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">10</i><span>题，</span><span>合计</span><i class="content_fs" style="color: red;">${achievement}</i><span>分</span>
								</p>
								<h2 style="color: red"></h2>
							</div>
						</div>
					<% int i=1;
					request.setAttribute("i",i);
					%>
						<div class="test_content_nr">
							<ul>
								<c:forEach var="userTopicReport" items="${userTopicReport}">

								<li id="${i}">
									<div class="test_content_nr_tt">
										<i>${i}</i><span>(10分)</span><font>${userTopicReport.topic.title} </font><b class="icon iconfont">&#xe881;</b>
									</div>
									<% i=i+1;
										request.setAttribute("i",i);
									%>
									<div class="test_content_nr_main">
										<c:if test="${userTopicReport.answer=='A'}">
											<ul>

												<li class="option">
													<label >
														<p class="ue" style="display: inline;color: red">A.${userTopicReport.answerA}</p>
													</label>
												</li>

												<li class="option">
													<label >
														<p class="ue" style="display: inline;">B.${userTopicReport.answerB}</p>
													</label>
												</li>
												<li class="option">
													<label>
														<p class="ue" style="display: inline;">C.${userTopicReport.answerC}</p>
													</label>
												</li>
												<li class="option">
													<label >
														<p class="ue" style="display: inline;">D.${userTopicReport.answerD}</p>
													</label>
												</li>
												<c:if test="${userTopicReport.topic.answer!=userTopicReport.answer}">
													<li class="option">
													<label>
														正确答案
														<p class="ue" style="display: inline;">${userTopicReport.topic.answer}</p>
													</label>
												</li>
												</c:if>
											</ul>
										</c:if>
										<c:if test="${userTopicReport.answer=='B'}">
											<ul>

												<li class="option">
													<label>
														<p class="ue" style="display: inline;">A.${userTopicReport.answerA}</p>
													</label>
												</li>
												<li class="option">
													<label>

														<p class="ue" style="display: inline;color: red">B.${userTopicReport.answerB}</p>
													</label>
												</li>

												<li class="option">
													<label>
														<p class="ue" style="display: inline;">C.${userTopicReport.answerC}</p>
													</label>
												</li>
												<li class="option">
													<label >
														<p class="ue" style="display: inline;">D.${userTopicReport.answerD}</p>
													</label>
												</li>
												<c:if test="${userTopicReport.topic.answer!=userTopicReport.answer}">
													<li class="option">
														<label>
															正确答案
															<p class="ue" style="display: inline;">${userTopicReport.topic.answer}</p>
														</label>
													</li>
												</c:if>

											</ul>
										</c:if>
										<c:if test="${userTopicReport.answer=='C'}">
											<ul>

												<li class="option">
													<label >
														<p class="ue" style="display: inline;">A.${userTopicReport.answerA}</p>
													</label>
												</li>
												<li class="option">
													<label>
														<p class="ue" style="display: inline;">B.${userTopicReport.answerB}</p>
													</label>
												</li>
												<li class="option">
													<label>
														<p class="ue" style="display: inline;color: red">C.${userTopicReport.answerC}</p>
													</label>
												</li>
												<li class="option">
													<label>
														<p class="ue" style="display: inline;">D.${userTopicReport.answerD}</p>
													</label>
												</li>
												<c:if test="${userTopicReport.topic.answer!=userTopicReport.answer}">
													<li class="option">
														<label>
															正确答案
															<p class="ue" style="display: inline;">${userTopicReport.topic.answer}</p>
														</label>
													</li>
												</c:if>

											</ul>
										</c:if>
										<c:if test="${userTopicReport.answer=='D'}">
											<ul>

												<li class="option">
													<label>

														<p class="ue" style="display: inline;">A.${userTopicReport.answerA}</p>
													</label>
												</li>

												<li class="option">
													<label >

														<p class="ue" style="display: inline;">B.${userTopicReport.answerB}</p>
													</label>
												</li>

												<li class="option">
													<label>

														<p class="ue" style="display: inline;">C.${userTopicReport.answerC}</p>
													</label>
												</li>
												<li class="option">
													<label >

														<p class="ue" style="display: inline;color: red">D.${userTopicReport.answerD}</p>
													</label>
												</li>
												<c:if test="${userTopicReport.topic.answer!=userTopicReport.answer}">
													<li class="option">
														<label>
															正确答案
															<p class="ue" style="display: inline;">${userTopicReport.topic.answer}</p>
														</label>
													</li>
												</c:if>
											</ul>
										</c:if>

									</div>
								</li>


								</c:forEach>
							</ul>
						</div>
					
				</form>
			</div>

		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
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
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="js/jquery.countdown.js"></script>
<script>
	window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		
	});
	
	
	$(function() {
		$('li.option label').click(function() {
		debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			
		});
	});

        //下载用户文件
        function excel() {
            $.ajax({
                type:"Post",
                url:"/excel/word",
                dataType:"json",
                data:{
                },
                success:function (data) {
                    if(data==1){
                        window.location.href="/excel/试卷详情.docx";
                    }
                }
            });

        }

</script>


</body>
</html>
