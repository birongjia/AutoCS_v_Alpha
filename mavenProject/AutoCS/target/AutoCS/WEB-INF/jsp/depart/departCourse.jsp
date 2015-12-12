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
    <link href="${context}/res/css/style/departCourse.css" rel="stylesheet" type="text/css"/>
    <title>系负责人之报课管理-查询</title>
</head>

<body>
<div id="header">
    <%@ include file="departTop.jsp"%>
    <div id="time">
        <p>报课截止时间：XXXX年XX月XX日  XX：XX</p>
        <p>审核截止时间：XXXX年XX月XX日  XX：XX</p>
    </div>
    <div id="button">
        查询报课信息：<br/><br/>
        <c:if test="${empty errorMsg1}"><br/></c:if>
        <c:if test="${!empty errorMsg1}">
            <div style="color:red">${errorMsg1}</div>
        </c:if>
        <form action="${context}/depart/course/find.html" method="post">
            <label>教工号：<input type="text" name="teacherUserName"/></label><br><br>
            <label>教师名：<input type="text" name="teacherName"/></label>
            <input type="submit" name="button" value="查  询"/>
        </form>
        <br>
        <form action="${context}/depart/summary.html" method="post">
            <input type="submit" name="button" value="查看汇总表格"/>
        </form>
    </div>
    <br>
    <div id="tabel">
        <table border="1px" width="100%">
            <tr>
                <td width="10%">用户名（工号）</td>
                <td width="10%">密码</td>
                <td width="10%">姓名</td>
                <td width="15%">所属系</td>
                <td width="15%">邮箱</td>
                <td width="15%">手机</td>
                <td width="5%">性别</td>
                <td width="10%">生日</td>
            </tr>
            <tr>
                <c:if test="${!empty resultMsg1}">
                    <td colspan="8"><div style="color:red">${resultMsg1}</div></td>
                </c:if>
            </tr>
            <c:forEach var="teacher" items="${teacher}" varStatus="status">
                <tr>
                    <td>${teacher.teacherUserName}</td>
                    <td>${teacher.teacherPassword}</td>
                    <td>${teacher.teacherName}</td>
                    <td>${teacher.teacherDepartment}</td>
                    <td>${teacher.teacherEmail}</td>
                    <td>${teacher.teacherTelephone}</td>
                    <td>${teacher.teacherSex}</td>
                    <td>${teacher.teacherBirthday}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id=button2>
        <input type="submit" name="button" value="下一页"/>
        <input type="submit" name="button" value="返回"/>
    </div>
</div>
</body>
</html>