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

    <title>Bootstrap Admin Template </title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/apps/email.css">
    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/profile.css">
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


        <div class="content-inner chart-cont">

            <!--***** CONTENT *****-->     
            <div class="row mt-2" id="card-prof">
                <div class="col-md-3">
                    <div class="card hovercard">
                        <div class="cardheader"></div>
                        <div class="avatar">
                         <img alt="" src="${user.img}" class="img-fluid">
                        </div>
                        <div class="info">
                            <div class="title">
                                <a target="_blank" href="#">${username}</a>
                            </div>
                            <div class="desc"></div>
                            <hr>
                        </div>
                        <nav class="nav text-center prof-nav">
                            <ul  class="list-unstyled ">
                                <li><a href="#">个人中心</a></li>
                                <li>
                                                        <a href="#myModal" data-toggle="modal" title="修改头像">修改头像 </a>
                                                        <!-- Modal -->
                                                        <div aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">X</button>
                                                                    </div>
                                                                    <div class="modal-body">

                                                                            <div id="avatar" class="avatar">
                                                                                <span> <img alt="" src="/images/avatar-1.jpg" style="margin-top: 30px" onclick="img(0)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-2.jpg" style="margin-top: 30px" onclick="img(1)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-3.jpg" style="margin-top: 30px" onclick="img(2)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-4.jpg" style="margin-top: 30px" onclick="img(3)" class="img-fluid rounded-circle"></span>

                                                                                <span> <img alt="" src="/images/avatar-5.jpg" style="margin-top: 30px" onclick="img(4)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-6.jpg" style="margin-top: 30px" onclick="img(5)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-7.jpg" style="margin-top: 30px" onclick="img(6)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-8.jpg" style="margin-top: 30px" onclick="img(7)" class="img-fluid rounded-circle"></span>

                                                                                <span> <img alt="" src="/images/avatar-9.jpg" style="margin-top: 30px" onclick="img(8)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-10.jpg" style="margin-top: 30px" onclick="img(9)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-11.jpg" style="margin-top: 30px" onclick="img(10)" class="img-fluid rounded-circle"></span>
                                                                                <span> <img alt="" src="/images/avatar-12.jpg" style="margin-top: 30px" onclick="img(11)" class="img-fluid rounded-circle"></span>
                                                                            </div>
                                                                        <form id="uploadForm" enctype="multipart/form-data" method="Post" action="/user/upload?name=${username}" >
                                                                            <div class="row form-group">
                                                                                <div class="offset-lg-2 col-lg-10">
                                                                                    <input type="file" id="file" name="fileUpload">
                                                                                </div>
                                                                            </div>
                                                                            <button id="upload">添加</button>
                                                                        </form>

                                                                            <span>提交</span>
                                                                            <button class="btn btn-send ml-3" onclick="edit()"></button>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                </li>
                                <li><a href="#">等级:${user.level}</a></li>
                                <li><a href="#">积分:${user.jifen}</a></li>
                                <li><a href="#">注册时间：${user.jointime}</a></li>
                                <li><a href="user_out">退出</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="card hovercard">
                        <div class="tab" role="tabpanel"> 
                            <ul class="nav nav-tabs" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" href="#buzz" role="tab" data-toggle="tab"><span><i class="fa fa-user"></i></span> 个人中心</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#zz" role="tab" data-toggle="tab"><span><i class="fa fa-inbox"></i></span> 完善信息</a>
                                </li>
                              <li class="nav-item">
                                <a class="nav-link" href="#references" role="tab" data-toggle="tab"><span><i class="fa fa-cog"></i></span>修改密码</a>
                              </li>
                            </ul>

                            <!--***** 个人中心 *****-->
                            <div class="tab-content tabs">
                              <div role="tabpanel" class="tab-pane fade show active" id="profile">
                                    <div class="row" id="report4">
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-fb">
                                              <a href="searchReport"><i class="fa fa-facebook"></i></a>
                                                <div>${reportCount} +</div>
                                                <p>成绩单</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-tw">
                                               <a href="userReportAnalysis?id=${user.id}"> <i class="fa fa-twitter"></i></a>
                                                <div>2345 +</div>
                                                <p>成绩分析</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-gp">
                                                <a href="userPower?id=${user.id}"><i class="fa fa-google-plus"></i></a>
                                                <div>1253 +</div>
                                                <p>六维能力图</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <h5 class="col-12 mb-2">User Info</h5>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-graduation-cap"> 年级:${user.grade} </i></strong>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-adjust"> 年龄:${user.age} </i></strong>
                                            </div>

                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-intersex"> 性别: ${user.sex}</i></strong>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-map-marker"> 地址: ${user.address}</i></strong>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                                <div role="tabpanel" class="tab-pane fade" id="bu">
                                    <div class="row" id="report4">
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-fb">
                                                <a href="userReport"><i class="fa fa-facebook"></i></a>
                                                <div>3250 +</div>
                                                <p>成绩单</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-tw">
                                                <a href="user_report_data.jsp"> <i class="fa fa-twitter"></i></a>
                                                <div>2345 +</div>
                                                <p>成绩分析</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center social-bottom sb-gp">
                                                <a href="userPower?id=${user.id}"><i class="fa fa-google-plus"></i></a>
                                                <div>1253 +</div>
                                                <p>六维能力图</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <h5 class="col-12 mb-2">User Info</h5>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-graduation-cap"> 年级: ${user.grade}</i></strong>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-adjust"> 年龄:${user.age} </i></strong>
                                            </div>

                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-intersex"> 性别: ${user.sex}</i></strong>
                                            </div>
                                            <div class="form-group">
                                                <strong class="mr-5"><i class="fa fa-map-marker"> 地址:${user.address} </i></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--***** 完善信息 *****-->
                                <div role="tabpanel" class="tab-pane fade" id="zz">
                                    <div class="row mx-2">

                                        <div class="card form" id="form2">
                                            <div class="card-header">
                                                <h3>基本信息</h3>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label for="grade" style="width: 50px;" class=" col-form-label" >年级</label>
                                                        <div class="col-9">
                                                            <input class="form-control" type="text" placeholder="grade" onblur="grade()" value="${user.grade}" id="grade">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="sex" style="width: 50px;" class=" col-form-label" >性别</label>
                                                        <div class="col-9">
                                                            <input class="form-control" type="text" placeholder="sex" onblur="sex()" value="${user.sex}"  id="sex">
                                                        </div>
                                                    </div>
                                            </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label for="age" style="width: 50px;" class=" col-form-label" >年龄</label>
                                                        <div class="col-9">
                                                            <input class="form-control" type="text" placeholder="age" onblur="age()" value="${user.age}"  id="age">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="address" style="width: 50px;" class=" col-form-label" >地址</label>
                                                        <div class="col-9">
                                                            <input class="form-control" type="text" placeholder="address" onblur="ddress()"value="${user.address}" id="address">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <div class="col-9">

                                                            <button class="btn btn-danger btn-lg" onclick="useredit()" style="margin-left: 50px"></button>
                                                            <label style="width: 85px" class=" col-form-label">提交</label>
                                                            <button type="button" class="btn btn-primary"  onclick="reset()"></button>
                                                            <label  class=" col-form-label" >重置</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--***** 修改密码 *****-->
                              <div role="tabpanel" class="tab-pane fade" id="references">
                                    <div class="row mx-2">
                                        <div class="col-md-12 panel-heading">
                                            <h3 class="panel-title">${username}</h3><br>
                                        </div>
                                        <div class="col-md-6 ">
                                            <div class="form-group row">
                                                <label for="Password" style="width: 85px;" class=" col-form-label">原密码：</label>
                                                <div class="col-9">
                                                    <input type="password" class="form-control" onblur="check()" id="Password" placeholder="Password">
                                                </div>
                                            </div> 
                                            <div class="form-group row">
                                                <label for="newPassword" style="width: 85px;" class=" col-form-label">密 码：</label>
                                                <div class="col-9">
                                                    <input type="password" class="form-control" id="newPassword" placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="newPassword1" style="width: 85px;" class=" col-form-label">确认密码：</label>
                                                <div class="col-9">
                                                    <input type="password" class="form-control"  id="newPassword1" placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="newPassword1" style="width: 85px;" class=" col-form-label"></label>
                                                <div class="col-9">
                                                    <button class="btn btn-danger btn-lg" onclick="check()"></button>
                                                    <label for="newPassword1" style="width: 85px" class=" col-form-label">修改</label>
                                                    <button type="button" class="btn btn-primary"  onclick="reset()"></button>
                                                    <label for="newPassword1"  class=" col-form-label" >重置</label>
                                                </div>
                                            </div>

                                        </div>
                                    </div> 
                              </div>
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
    <script>
        new Chart(document.getElementById("myChart-nav").getContext('2d'), {
          type: 'doughnut',
          data: {
            labels: ["M", "T", "W", "T", "F", "S", "S"],
            datasets: [{
              backgroundColor: [
                "#2ecc71",
                "#3498db",
                "#95a5a6",
                "#9b59b6",
                "#f1c40f",
                "#e74c3c",
                "#34495e"
              ],
              data: [12, 19, 3, 17, 28, 24, 7]
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


    </script>

<script src="./lib/layui/layui.js" charset="utf-8"></script>
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

    function reset() {
        $("#grade").val("");
        $("#sex").val("");
        $("#age").val("");
        $("#adress ").val("");
        $("#Password").val("");
        $("#newPassword").val("");
        $("#newPassword1").val("");
    }
    var userimg;
    //选择头像
    function img(id) {
        var sid=id+1;
        userimg="/images/avatar-"+sid+".jpg";
        $("#avatar").find("span").eq(id).html('<img alt="" id="avatar-1"  src="/images/avatar-'+sid+'.jpg" style="margin-top: 30px;background-color: red" onclick="reimg('+id+')" class="img-fluid rounded-circle">');
        for(var i=0;i<12;i++){
            var j=i+1;
            if(id!=i){
                $("#avatar").find("span").eq(i).html('<img alt="" id="avatar-1"  src="/images/avatar-'+j+'.jpg" style="margin-top: 30px;" onclick="img('+i+')" class="img-fluid rounded-circle">');
            }
        }

    }
    //取消选择头像
    function reimg(id) {
        userimg=""
        var sid=id+1;
        $("#avatar").find("span").eq(id).html('<img alt="" id="avatar-1"  src="/images/avatar-'+sid+'.jpg" style="margin-top: 30px;" onclick="img('+id+')" class="img-fluid rounded-circle">');

    }
    function edit() {
        window.location.href="userImg?img="+userimg;
    }
    //审核密码
    function check() {
        var name='<%=session.getAttribute("username")%>';
        var oldpass=$("#Password").val();
        var newpass=$("#newPassword").val();
        var repass=$("#newPassword1").val();
        $.ajax({
            type: "post",
            url: "findByName",
            dataType: "json",
            data: {
                name:name,
                pswd:oldpass
            },
            success:function (data) {
                if (data == 1) {
                    if(newpass==repass&&newpass!=""&&repass!=oldpass){
                        $.ajax({
                            type:"post",
                            url:"userUpdate",
                            dataType:"json",
                            data:{
                                name:name,
                                pswd:newpass
                            },
                            success:function (data) {
                                if(data==1){
                                    layer.msg('修改成功', {icon: 6, time: 1500},function (index) {
                                        window.location.href="index.jsp";
                                    });

                                }
                            }
                        });
                    }else{
                        if(newpass==""||repass==""){
                            return false;
                        }else if(newpass!=repass){
                    layer.msg('两次密码不一样', {icon: 5, time: 1500});
                        }else{
                            layer.msg('新密码与原密码相同', {icon: 5, time: 1500});
                        }
                    }
                } else {
                    layer.msg('原密码不正确', {icon: 5, time: 1500});
                }
            }
        });
    }

    function age() {
        var age=$("#age").val();
        if(age>=100||age<0){
            layer.msg('年龄在0~100',{icon:5,time:1500});
        }
    }


    //完善基本信息
    function useredit() {
        var name='<%=session.getAttribute("username")%>';
        var grade=$("#grade").val();
        var sex=$("#sex").val();
        var age=$("#age").val();
        var address=$("#address").val();
         if((sex=="男"||sex=="女")&&(age<=100&&age>=0)&&(grade=="高一"||grade=="高二"||grade=="高三")){
        $.ajax({
            type:"post",
            url:"userEdit",
            dataType:"json",
            data:{
                name:name,
                grade:grade,
                sex:sex,
                age:age,
                address:address
            },
            success:function (data) {
                if(data==1){
                    layer.msg('修改成功',{icon:6,time:1500},function (index) {
                        window.location.reload();
                    })
                }
            }
        });
        }
        else{
             layer.msg('填入正确的信息',{icon:5,time:1500});
           return false;
        }
    }
</script>
</body>

</html>