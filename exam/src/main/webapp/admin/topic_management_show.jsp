
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <meta charset="utf-8">
    <title>
        题目管理-编辑
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="./css/x-admin.css" media="all">
</head>

<body>
<div class="x-body">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">
                题号：<%=request.getParameter("id")%>
            </label>
            <span>
                <button class="layui-btn" onclick="topicupdata()">修改</button>
            </span>
            <table  class="layui-table layui-input-block">
                <tbody>
                <tr>
                    <td width="10%">标题</td>
                    <td width="81%">
                        <input type="text" id="title" name="title" required lay-verify="title" value="<%=request.getParameter("name")%>"
                               autocomplete="off" class="layui-input">
                    </td>
                </tr>
                <tr>
                    <td>科目</td>
                    <td>
                        <div class="layui-input-block">
                            <select   >
                                <option id="type" selected="<%=request.getParameter("type")%>"><%=request.getParameter("type")%></option>
                                <option value="语文">语 文</option>
                                <option value="数学">数 学</option>
                                <option value="英语">英 语</option>
                                <option value="物理">物 理</option>
                                <option value="化学">化 学</option>
                                <option value="生物">生 物</option>
                                <option value="历史">历 史</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>年级</td>
                    <td>
                        <div class="layui-input-block">
                            <select>

                                <option id="grade" selected="<%=request.getParameter("grade")%>"><%=request.getParameter("grade")%></option>
                                <option value="高一">高 一</option>
                                <option value="高二">高 二</option>
                                <option value="高三">高 三</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>答案</td>
                      <%  String answer=request.getParameter("answer");
                            request.setAttribute("answer",answer);
                      %>
                    <td>
                        <c:if test="${answer=='A'}">
                            <div class="layui-form">
                                <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="radio" checked name="answer" value="A" title="A">
                                    <input type="radio" name="answer" value="B" title="B">
                                    <input type="radio" name="answer" value="C" title="C">
                                    <input type="radio" name="answer" value="D" title="D">
                                </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${answer=='B'}">
                            <div class="layui-form">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="radio" name="answer" value="A" title="A">
                                        <input type="radio" checked name="answer" value="B" title="B">
                                        <input type="radio" name="answer" value="C" title="C">
                                        <input type="radio" name="answer" value="D" title="D">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${answer=='C'}">
                            <div class="layui-form">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="radio"  name="answer" value="A" title="A">
                                        <input type="radio" name="answer" value="B" title="B">
                                        <input type="radio" checked name="answer" value="C" title="C">
                                        <input type="radio" name="answer" value="D" title="D">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${answer=='D'}">
                            <div class="layui-form">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="radio"  name="answer" value="A" title="A">
                                        <input type="radio" name="answer" value="B" title="B">
                                        <input type="radio" name="answer" value="C" title="C">
                                        <input type="radio" checked name="answer" value="D" title="D">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>题型</td>
                    <td>
                        <div class="layui-input-block">
                            <select >
                                <option id="memo" selected="<%=request.getParameter("memo")%>"><%=request.getParameter("memo")%></option>
                                <option value="选择题">选择题</option>
                                <option value="填空题">填空题</option>
                                <option value="判断题">判断题</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>分制</td>
                    <td>
                        <div class="layui-input-block">
                            <select >
                                <option id="mark" selected="<%=request.getParameter("mark")%>"><%=request.getParameter("mark")%></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>难度</td>
                    <td>
                        <div class="layui-input-block">
                            <select>
                                <option id="level" selected="<%=request.getParameter("level")%>"><%=request.getParameter("level")%></option>
                                <option value="低级">低级</option>
                                <option value="中级">中级</option>
                                <option value="高级">高级</option>
                            </select>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
</div>
<script src="./lib/layui/layui.js" charset="utf-8">
</script>
<script src="./js/x-layui.js" charset="utf-8">
</script>
<script>
    layui.use(['laydate','element','laypage','layer'], function() {
        $ = layui.jquery;//jquery
        laydate = layui.laydate;//日期插件
        lement = layui.element();//面包导航
        laypage = layui.laypage;//分页
        layer = layui.layer;//弹出层

        //以上模块根据需要引入

        laypage({
            cont: 'page'
            , pages: 100
            , first: 1
            , last: 100
            , prev: '<em><</em>'
            , next: '<em>></em>'
        });
    });

    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form()
            ,layer = layui.layer;


        //监听提交
        form.on('submit(save)', function(data){
            console.log(data);
            layer.alert("提交成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });


    });

    //修改属性
    function topicupdata() {
        var id=<%=request.getParameter("id")%>;
        var title=$("#title").val();
        var type=$("#type").val();
        var grade=$("#grade").val();
        var ele=document.getElementsByName("answer")
        var memo=$("#memo").val();
        var mark=$("#mark").val();
        var level=$("#level").val();
        for(var i=0; i<ele.length; i++){
            if(ele[i].checked){
                var answer=ele[i].value;
            }
        }
        $.ajax({
            type:"Post",
            url:"topicEdit",
            dataType:"json",
            data:{
                id:id,
                title:title,
                type:type,
                grade:grade,
                answer:answer,
                memo:memo,
                mark:mark,
                level:level
            },
            success:function (data) {
                layer.msg('已修改!',{icon:1,time:2000},function () {
                    x_admin_close();
                });

            }
        });

    }
</script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>

</html>