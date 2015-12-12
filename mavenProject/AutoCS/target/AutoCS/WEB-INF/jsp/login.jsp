<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String context = request.getContextPath();
        request.getSession().setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>自动排课系统</title>

    <!-- Bootstrap core CSS -->
    <link href="./res/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./res/css/style/login.css" rel="stylesheet">
    <link href="./res/css/style/main.css" rel="stylesheet">

    <%--<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->--%>
    <%--<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->--%>
    <%--<script src="../../assets/js/ie-emulation-modes-warning.js"></script>--%>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>-->
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js" type="text/javascript"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js" type="text/javascript"></script>
</head>
<body>
<div id="header">
    <div id="search">

    </div>
    <div id="logo">
        福州大学数计学院自动排课系统
    </div>
    <div id = go>
        <c:if test="${!empty errorMsg}">
            <div style="color:red">${errorMsg}</div>
        </c:if>
        <form class="form-signin"  action="${context}/login.html" method="post">
            <label for="inputUserName" class="sr-only">用户名：</label>
            <input type="text" id="inputUserName" name="userName" class="form-control" placeholder="userName" required autofocus>&nbsp
            <label for="inputPassword" class="sr-only">密  码：</label>
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
            <div class="checkbox">
                <label><input id="userType1" name="userType" type="radio" value="1" checked="checked"/>教学办</label>&nbsp
                <label><input id="userType2" name="userType" type="radio" value="2"/>系负责人</label>&nbsp
                <label><input id="userType3" name="userType" type="radio" value="3"/>教师</label>
                <!--<label>-->
                <!--<input type="checkbox" value="remember-me"> Remember me-->
                <!--</label>-->
            </div>
            <div style="width: 100%">
                <div style="float:left; width: 50%">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">登  录</button></div>
                <div style="float:left; width: 50%">
                    <button class="btn btn-lg btn-primary btn-block" type="reset">重  置</button></div></div>
        </form>
    </div>
</div>
</body>
</html>