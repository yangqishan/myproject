<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>在线答题考试</title>

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
<div class="main">
	<!--nr start-->
	<div class="test_main">
		<h1>${paper.title}</h1>
		<div class="nr_left">
			<div class="test">
					<div class="test_title" >
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i>
						</p>
						<font><input type="button" name="test_jiaojuan" value="交卷" onclick="examok()"></font>
					</div>
					
						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">10</i><span>题，</span><span>合计</span><i class="content_fs">100</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr" >
							<ul>
								<%
									int i=1;
									request.setAttribute("i",i);
								%>
								<c:forEach var="userpaper" items="${userpaper}">
									<li id="qu_0_${i}">
										<div class="test_content_nr_tt">
											<i>${i}</i><span>(10分)</span><font>${userpaper.topic.title}</font><b class="icon iconfont">&#xe881;</b>
										</div>
										<div class="test_content_nr_main">
											<ul>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${i}" id="0_answer_${i}_option_1" value="A"/>
														<label for="0_answer_${i}_option_1">A.
															<p class="ue" style="display: inline;">${userpaper.answerA}</p>
														</label>
												</li>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${i}" id="0_answer_${i}_option_2" value="B"/>
														<label for="0_answer_${i}_option_2">B.
															<p class="ue" style="display: inline;">${userpaper.answerB}</p>
														</label>
												</li>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${i}" id="0_answer_${i}_option_3" value="C"/>
														<label for="0_answer_${i}_option_3">C.
															<p class="ue" style="display: inline;">${userpaper.answerC}</p>
														</label>
												</li>
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer${i}" id="0_answer_${i}_option_4" value="D"/>
														<label for="0_answer_${i}_option_4">D.
															<p class="ue" style="display: inline;">${userpaper.answerD}</p>
														</label>
												</li>
												<% request.setAttribute("i",++i);%>
											</ul>
										</div>
									</li>
								</c:forEach>

								
							</ul>
						</div>

			</div>

		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont">&#xe692;</i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont">&#xe6fb;</i><b class="alt-1">01:40</b>
						</p>
					</div>
					
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">10</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									
										<li><a href="#qu_0_1">1</a></li>
									
										<li><a href="#qu_0_2">2</a></li>
									
										<li><a href="#qu_0_3">3</a></li>
									
										<li><a href="#qu_0_4">4</a></li>
									
										<li><a href="#qu_0_5">5</a></li>
									
										<li><a href="#qu_0_6">6</a></li>
									
										<li><a href="#qu_0_7">7</a></li>
									
										<li><a href="#qu_0_8">8</a></li>
									
										<li><a href="#qu_0_9">9</a></li>
									
										<li><a href="#qu_0_10">10</a></li>
									
								</ul>
							</div>
						</div>

				</div>

			</div>
		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.easy-pie-chart.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
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
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			
		});
	});
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
	function examok() {
        var answers="";
        var score;

        for (var j = 1; j <= 10; j++) {
            var k=0;
            var ele = document.getElementsByName("answer" + j);
            for (var i = 0; i < ele.length; i++) {
                if (ele[i].checked) {
                    var answer = ele[i].value;
                    answers = answers + answer + ",";
                    k=1;
                }
            }
            if(k==0){
                answers = answers + " " + ",";
			}
        }
            if ($('time').text() != "00:00:00") {
                layer.confirm('你确定提前交卷吗？', {icon: 6}, function (index) {
                    layer.msg('正在传送数据', {icon: 1, time: 1000});
                      window.location.href="checkPpaer?answers="+answers+"&id=${paperId}"+"&username=${username}";
                });
            }
    }
</script>
</body>
</html>
