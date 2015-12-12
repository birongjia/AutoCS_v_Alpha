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
    <link href="${context}/res/css/style/teacherCourse.css" rel="stylesheet" type="text/css"/>
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