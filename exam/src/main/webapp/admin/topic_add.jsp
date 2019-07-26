<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    
    <head>
        <meta charset="utf-8">
        <title>
           题库管理-添加
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
            <form class="layui-form">
                <div class="layui-form-item">
                    <label for="title" class="layui-form-label">
                        <span class="x-red">*</span>标题
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="title" name="title" required lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="type" class="layui-form-label">
                        <span class="x-red">*</span>科目
                    </label>
                    <div class="layui-input-inline">
                        <select lay-verify="required" id="type" name="type">
                                <option>
                                </option>
                                <optgroup label="科目">
                                    <option value="语文">语 文</option>
                                    <option value="数学">数 学</option>
                                    <option value="英语">英 语</option>
                                    <option value="物理">物 理</option>
                                    <option value="化学">化 学</option>
                                    <option value="生物">生 物</option>
                                    <option value="历史">历 史</option>
                                </optgroup>
                            </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="grade" class="layui-form-label">
                        <span class="x-red">*</span>年级
                    </label>
                    <div class="layui-input-inline">
                        <select lay-verify="required" id="grade" name="grade">
                            <option>
                            </option>
                            <optgroup label="年级">
                                <option value="高一">高一</option>
                                <option value="高二">高二</option>
                                <option value="高三">高三</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="memo" class="layui-form-label">
                        <span class="x-red">*</span>题型
                    </label>
                    <div class="layui-input-inline">
                        <select lay-verify="required" id="memo" name="memo">
                            <option>
                            </option>
                            <optgroup label="题型">
                                <option value="选择题" >选择题</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>答案
                    </label>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="radio" name="answer"  value="A" title="A">
                            <input type="radio" name="answer"  value="B" title="B">
                            <input type="radio" name="answer"  value="C" title="C">
                            <input type="radio" name="answer"  value="D" title="D">
                        </div>
                    </div>
                </div>
                <div class="layui-form" id="select">

                </div>
                <div class="layui-form-item">
                    <label for="mark" class="layui-form-label">
                        <span class="x-red">*</span>分制
                    </label>
                    <div class="layui-input-inline">
                        <select lay-verify="required" id="mark" name="mark" >
                                <option value="1">10</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="level" class="layui-form-label">
                        <span class="x-red">*</span>难度
                    </label>
                    <div class="layui-input-inline">
                        <select lay-verify="required" id="level" name="level">
                                <option value="初级">初级</option>
                                <option value="中级">中级</option>
                                <option value="高级">高级</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label  class="layui-form-label">
                    </label>
                    <button  class="layui-btn" lay-filter="add" lay-submit="">
                        增加
                    </button>
                </div>
            </form>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer','upload'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;


              //监听提交
              form.on('submit(add)', function(data){
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
                          id:0,
                          title:title,
                          type:type,
                          grade:grade,
                          answer:answer,
                          memo:memo,
                          mark:mark,
                          level:level
                      },
                      success:function (data) {
                      }

                  });

                  //发异步，把数据提交给php
                  layer.alert("增加成功", {icon: 6}, function () {
                      // 获得frame索引
                      var index = parent.layer.getFrameIndex(window.name);
                      //关闭当前frame
                      parent.layer.close(index);
                  });
                  return false;

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
    </body>

</html>