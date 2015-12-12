<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="info">
    <c:if test="${empty loginYard}">
        <script>
            window.location.href="<c:url value="/index.html"/>";
        </script>
    </c:if>
    <a>${loginYard.yardName}管理员，欢迎您!</a>&nbsp;&nbsp;
    <a href="<c:url value="/logout.html"/>">退出登录</a>&nbsp;&nbsp;
    <a href="<c:url value="/logout.html"/>">修改信息</a>
</div>
<div id="nav-search">
    <div id="nav">
        <a href="<c:url value="/yard/main.html"/>">首页</a>
        <a href="<c:url value="/yard/user.html"/>">账号管理</a>
        <a href="<c:url value="/yard/course.html"/>">报课管理</a>
        <a href="<c:url value="/yard/history.html"/>">历史记录</a>
    </div>
    <div id="search">

    </div>
</div>
<div id="logo">
    福州大学数计学院自动排课系统
</div>