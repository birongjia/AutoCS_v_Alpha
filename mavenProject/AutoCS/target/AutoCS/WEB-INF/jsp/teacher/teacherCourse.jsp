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
        #tabel{width:75%;height:450px;margin-left:150px;margin-top:150px;border:2px solid #666;text-align:center;}

        #button2{width:100%;height:50px;padding:20px 0 0 0;text-align:center;float:left;margin:auto;}
        #button2 input{margin-left:30px;}
    </style>
    <title>教师之开始报课</title>
</head>
<body>
<div id="header">
    <%@ include file="teacherTop.jsp"%>
    <div id="time">
        <p>报课截止时间：XXXX年XX月XX日  XX：XX</p>

    </div>
    <div id="tabel">
        <c:if test="${!empty errorMsg1}">
            <div style="color:red">${errorMsg1}</div>
        </c:if>
        <table border="1px" width="100%">
            <tr><td colspan="8"></td></tr>
            <tr>
                <td width="10%">年级</td>
                <td width="10%">专业</td>
                <td width="10%">专业人数</td>
                <td width="15%">课程名称</td>
                <td width="15%">学分</td>
                <td width="15%">学时</td>
                <td width="5%">实验学时</td>
                <td width="10%">上机学时</td>
                <%--<td width="10%">操作</td>--%>
            </tr>
            <c:forEach var="course" items="${course}" varStatus="status">
                <%--<form id="form${status.count}" method="post" action="${context}/yard/user/${teacher.teacherId}/delete.html">--%>
                <tr>
                    <td>${course.courseGrade}</td>
                    <td>${course.courseMajor}</td>
                    <td>${course.coursePeople}</td>
                    <td>${course.courseName}</td>
                    <td>${course.courseScore}</td>
                    <td>${course.courseHour}</td>
                    <td>${course.testHour}</td>
                    <td>${course.practiceHour}</td>
                        <%--<td>--%>
                        <%--<a href="<c:url value="/yard/user/${teacher.teacherId}/edit.html"/>">更改</a>--%>
                        <%--<input type="hidden" name="_method" value="DELETE" />--%>
                        <%--<a href="javascript:document.getElementById('form${status.count}').submit();">删除</a>--%>
                        <%--</td>--%>
                </tr>
                <%--</form>--%>
            </c:forEach>
        </table>
    </div>

    <div id=button2>
        <input type="submit" name="button" value="提  交"/>
        <input type="reset" name="button" value="返  回"/>
    </div>
</div>
</body>
</html>