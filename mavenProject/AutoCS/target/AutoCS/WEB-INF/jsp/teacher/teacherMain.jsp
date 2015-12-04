<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        #header{width: 100%;}/*设置满屏宽度*/
        /*设置顶部栏效果*/
        #info{height: 30px;background-color:#CCC;text-align:right;padding-top:5px;}
        #info a:hover{color:#FFF;}
        #nav-search{padding:5px 0 0 0;height: 30px;background-color:#9CF;}
        #nav{height: 30px;background-color:#9CF;float: left;}
        /*设置字体样式*/
        #nav a{font-size:14px;display:block; float:left; margin-left:20px; margin-top:6px;color:#fff;letter-spacing:0.2em;
            text-align:center;text-decoration:none;}
        #nav a:hover{color:#d00;
            background:#fff;}
        /*搜索框*/
        #search{height: 30px;background-color:#9CF;float: right;}
        /*系统名称效果*/
        #logo{width:100%;padding: 10px 0 0 0; text-align: center; height: 50px;background-color:#69C;font-size: 40px;font-family:"隶书";color:#FFC;}

        #time{width:50%;height:100px;padding:20px 0 0 0;float:left;text-align:center;}

        #button{width:40%;height:80px;padding:40px 0 0 0;float:left;text-align:left;}
        #tabel{width:75%;height:250px;margin-left:150px;margin-top:150px;border:2px solid #666;text-align:center;}

        #button2{width:100%;height:50px;padding:20px 0 0 0;text-align:center;float:left;margin:auto;}
        #button2 input{margin-left:30px;}
    </style>
    <script type="text/javascript" src="res/js/getDate.js"></script>
    <title>教师主界面</title>
</head>
<body >
<div id="header">
    <%@ include file="teacherTop.jsp"%>
    <div id="time">
        <script type="text/javascript">
            window.onload=getdates();
        </script>
    </div>
    <div id="tabel">此处显示教务处信息</div>
    <br/>
    <c:if test="${empty errorMsg1}"><br/></c:if>
    <c:if test="${!empty errorMsg1}">
        <div style="text-align:center;margin:0 auto;color:red">${errorMsg1}</div>
    </c:if>
    <br/>
    <br/>
    <div style="width:15%;text-align:center;margin:0 auto">
        <div align="left" style="float:left">
            <form action="${context}/teacher/doCourse.html" method="post">
                <input type="submit" value="开 始 报 课"/>&nbsp;&nbsp;</form></div>
        <div align="right">
            <form action="${context}/teacher/result.html" method="post">
                <input type="submit" value="查 看 结 果"/></form></div>
    </div>
</div>
</body>
</html>