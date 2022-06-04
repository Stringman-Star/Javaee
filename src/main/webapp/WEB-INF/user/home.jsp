<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>最終影城</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/toubu.css"/>
<link href="${pageContext.request.contextPath}/css/style.css" type="text/css" rel="stylesheet" media="all">
<script type="text/javascript">
    setInterval(function() {
        //时间
        var mydate = new Date();
        var year = mydate.getFullYear()
        var month = mydate.getMonth() + 1;
        var data = mydate.getDate();
        var h = mydate.getHours(); //获取当前小时数(0-23)
        var m = mydate.getMinutes(); //获取当前分钟数(0-59)
        var s = mydate.getSeconds(); //获取当前秒数(0-59)
        var cg = year + "/" + month + "/" + data + "     " + h + ":" + m + ":" + s;
        $("#time").html(cg)
    }, 1)
</script>
<script>
    $(function(){
        $("#tui").click(function() {
            $.ajax({
                type:"get",
                url:"tui",
                success:function(data){
                    window.location.reload();
                }
            });
        })

        $("#but1").click(function () {
            var search=$("#search").val()
            window.location.href="mohu?page=1&name="+search;
        })
        $("#login").on("click","#toLogin",function(){
            $.ajax({
                type:"post",
                url:"login",
                data:{
                    userAccount:$("#userName").val(),
                    userPassword:$("#userPassword").val()
                },
                success:function(data){
                    if(data!=null){
                        window.location.reload();
                    }else{
                        alert("登录失败")
                    }
                },
                error:function () {
                    alert("服务器请求失效")
                }
            });
        })

        $("#but66").click(function () {
            var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
            var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (uPattern.test($("#userName1").val())){
                if (uPattern.test($("#account").val())) {
                    if (uPattern.test($("#userPassword2").val())) {
                        if ($("#userPassword2").val()==$("#userPassword3").val()){
                            if (ePattern.test($("#emli").val())){
                                if (uPattern.test($("#phone").val())){
                                    $.ajax({
                                        type:"post",
                                        url:"zhu",
                                        data:{
                                            userName:$("#userName1").val(),
                                            userAccount:$("#account").val(),
                                            userPassword:$("#userPassword2").val(),
                                            userEmli:$("#emli").val(),
                                            userPhone:$("#phone").val()
                                        },
                                        success:function(data){
                                            if(data>0){
                                                alert("注册成功")
                                                window.location.reload();
                                            }else{
                                                alert("注册失败")
                                            }
                                        },
                                        error:function () {
                                            alert("服务器请求失效")
                                        }
                                    });
                                } else{
                                    alert("手机号输入不正确")
                                }
                            } else {
                                alert("邮箱输入不正确")
                            }
                        } else{
                            alert("密码不一致")
                        }
                    }else{
                        alert("密码输入不正确")
                    }
                }else {
                    alert("用户名输入不正确")
                }
            } else{
                alert("昵称输入不正确")
            }
        })
    })
</script>
<style type="text/css">
    body {
        background: #2E323B;
    }
    #tuijian {
        width: 50%;
        height: 40px;
        background: -webkit-linear-gradient(left, #111111, #2E323B);
    }
    #jiao{
        float: right;
        width: 50%;
        height: 40px;
        background: -webkit-linear-gradient(right, #111111, #2E323B);
    }
    #jiao strong{
        float: right;
    }
    .piao {
        text-align: center;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        width: 250px;
        padding: 8px;
        line-height: 20px;
        background: #5f5f6d;
    }
</style>

<body>
<div class="container">
    <div class="row" id="tou">
        <nav class="navbar navbar-default col-lg-12" style="text-align: center;">
            <div class="logo navbar-header" style="width: 90px; height: 51px; padding: 8px;">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/logo.png" style="width: 88px;" height="50.59px" alt="" /></a>
            </div>
            <div class="container-fluid" style="margin-left: 120px; padding: 10px; margin: 0px;">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul id="ul" class="nav navbar-nav" style="margin-left: 20px;">
                        <li>
                            <a href="${pageContext.request.contextPath}">首页</a>
                        </li>
                        <li>
                            <a href="list">电影</a>
                        </li>
                        <li>
                            <a href="we">影城介绍</a>
                        </li>
                    </ul>
                    <div class="navbar-nav container-fluid" style="position: relative;">
                        <div style="margin-left:30px;" style="display: block;">
                            <input id="search" type="text" placeholder="电影名称">
                            <span id="but1" class="glyphicon glyphicon-search"></span>
                            <font id="time">#</font>
                        </div>

                    </div>

                    <div style="float: right;" id="islog">
                        <c:if test="${user!=null}">
                            <a href="personal"><img  src="${pageContext.request.contextPath}${user.imgUrl}" class="img-circle" style="width: 40px; margin-right: 10px; height: 40px"></a>
                            <a href="personal">${user.userName}</a>&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;"><span class=" glyphicon glyphicon-off" style="font-size: 14px; margin-right: 5px;"></span><span >退出</span></button>
                        </c:if>
                        <c:if test="${user==null}">
                            <img data-toggle='modal' data-target='#login' id="img" src="${pageContext.request.contextPath}/img/ht.jpg" class="img-circle" style="width: 40px; margin-right: 10px; height: 40px">
                            <a data-toggle='modal' data-target='#login'>登录</a>&nbsp;&nbsp;
                        </c:if>

                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
<div style="height: 20px;"></div>
<!--轮播图-->
<div class="container" style="padding: 0px;">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <a href="filma?filmId=2"><img src="img/rotation1.jpeg" alt="First slide"></a>
            </div>
            <div class="item">
                <a href="filma?filmId=1"><img src="img/rotation2.jpg" width="100%"></a>
            </div>
            <div class="item">
                <a href="filma?filmId=4"><img src="img/轮播6.jpg" alt="Third slide"></a>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div style="height: 20px;"></div>
<!-- 是否退出登录 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center;">是否退出登录</h4>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button id="tui" type="button" class="btn btn-danger">退出登录</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--首页推荐-->
<div class="container" style="padding: 0px;float: none;">
    <div id="tuijian">
        <strong style="color: white; line-height:40px; font-size:18px; margin-left:20px ;">今日推荐</strong>
    </div>
    <div id="piao" class="container">
        <table bgcolor="0" align="center">
            <tr>
                <c:forEach items="${map.info}" var="film" varStatus="vs" begin="0" end="3">
                    <td>
                        <div style="width: 250px; margin:10px;">
                            <a href="filma?filmId=${film.filmId}"><img src="${pageContext.request.contextPath}${film.posterUrl}" style="width: 250px;height: 380px"/></a>
                            <div class="piao">
                                <a href="filma?filmId=${film.filmId}"><p style="color: white; top: 50px;">${film.filmName}</p></a>
                                <a href="filma?filmId=${film.filmId}"><p style="color: white; top: 50px;">导演:${film.director}</p></a>
                            </div>
                        </div>
                    </td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach items="${map.info}" var="film" varStatus="vs" begin="4" end="7">
                    <td>
                        <div style="width: 250px; margin:10px;">
                            <a href="filma?filmId=${film.filmId}"><img src="${pageContext.request.contextPath}${film.posterUrl}" style="width: 250px;height: 380px"/></a>
                            <div class="piao">
                                <a href="filma?filmId=${film.filmId}"><p style="color: white; top: 50px;">${film.filmName}</p></a>
                                <a href="filma?filmId=${film.filmId}"><p style="color: white; top: 50px;">导演:${film.director}</p></a>
                            </div>
                        </div>
                    </td>
                </c:forEach>
            </tr>
        </table>
    </div>
</div>
<div class="container" style="margin-top: 10px;">
    <div id="jiao">
        <a href="list"><strong style="color: white; line-height:40px; font-size:18px; margin-left:20px ;">更多电影>></strong></a>
    </div>
</div>
<div class="container" style="margin-top: 30px;">
</div>
<!--登录模态框 -->
<div class="modal fade" id="login" style="margin-top: 200px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="table">
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">用户名</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="userName" placeholder="请输入用户名">
                        </td>
                    </tr>
                    <tr height="50px">
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword" placeholder="请输入密码">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button  id="toLogin" style="position: absolute; left: 52%;" type="button" class="btn btn-success" data-dismiss="modal">登录</button>
                <a style="position: absolute; right: 10%;line-height:50px;" data-dismiss="modal" data-toggle='modal' data-target='#register'>注册</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!--注册模态框 -->
<div class="modal fade" id="register" style="margin-top: 200px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">用户注册</h4>
            </div>
            <div class="text-center" style="margin-top: 15px; text-align: center; margin-bottom: 15px;">
                <table align="center" id="table2">
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">昵称</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="userName1" placeholder="请输入用户名">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">用户名</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="account" placeholder="请输入账号">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword2" placeholder="请输入密码">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">确认密码</label>
                        </td>
                        <td>
                            <input type="password" class="form-control" style="display: inherit;width: 200px;" id="userPassword3" placeholder="确认密码">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">邮箱</label>
                        </td>
                        <td>
                            <input type="email" class="form-control" style="display: inherit;width: 200px;" id="emli" placeholder="邮箱">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" width="80px">
                            <label for="firstname" class="control-label">手机号</label>
                        </td>
                        <td>
                            <input type="text" class="form-control" style="display: inherit;width: 200px;" id="phone" placeholder="手机号">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer" style="position:relative;height: 60px; line-height: 60px;">
                <button style="position: absolute; left: 42%;" type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                <button id="but66" style="position: absolute; left: 52%;" type="button" class="btn btn-success">注册</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

</body>
</html>
