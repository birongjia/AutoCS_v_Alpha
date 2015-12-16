<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
	
	  body{background:url(image/background04.jpg) no-repeat 0 0;
	      background-size:100% 100%;margin:auto;}
	
	
	
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
        #logo{padding: 10px 0 0 0; text-align: center; height: 50px;background-color:#69C;font-size: 40px;font-family:"隶书";color:#FFC;}
        /*系名称栏设置*/
        #major{width:22%;height:500px;padding:25px 0 0 0;text-align:center;background-color:#EAEAEA;float:left;margin: auto;border:        3px   solid #cccccc;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;   border-bottom-right-radius: 10px;}
        #major a{font-size:18px;color:#00C;}
        #major a:hover{color:#F06;}
		#major input{float:right;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;background:#FFC;}
        /*设置按钮安放位置*/
        #button1{width:60%;height:50px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;}
     
        #button2{width:60%;height:50px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;border-top:2px solid #9FF;}
        #button2 input{margin-left:50px;}
        /*暂时放空的地方*/
        #sth{width:60%;height:60px;padding:50px 0 20px 50px;text-align:left;float:left;margin:auto;}
        #sth a{font-size:20px;font-family:Arial;}
        /*放置时间选择框*/
        #time{width:30%;height:250px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;}
        #time1{width:20%;height:100px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;}
        #form{padding:20px 0 0 0;margin:0px;font-size:14px;}
        /*#time2{width:20%;height:100px;text-align:left;margin-top:150px;float:left;border:2px solid #9FF;}*/
    </style>
    <title>教学办之报课管理</title>
</head>
<body>
<div id="header">
<%@ include file="yardTop.jsp"%>



  
             <input type="submit" style="background:#9CF;margin-left:30.5%;border-top-left-radius: 10px;border-top-right-radius: 10px;                                 border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" value="开始报课"/>
                         </div>
                         
                         
                         
                         
    <br/>
    <div>
        <form action="${context}/yard/course/start.html" method="post" enctype="multipart/form-data">
        
        
        
        
        
             <div id="major">
        <a >计 算 机 科 学 与 技 术</a> <input type="submit" value="上传"/><br/><br/><br/>
        <a>数 学</a><input type="submit"  value="上传"/><br/><br/><br/>
        <a >信 息 安 全</a> <input type="submit"  value="上传"/><br/><br/><br/>
        <a >软 件 工 程</a> <input type="submit"  value="上传"/><br/><br/><br/>
        <a >计 算 机 实 验 班</a> <input type="submit" value="上传"/><br/><br/><br/>
        <a >数 学 实 验 班</a> <input type="submit"  value="上传"/><br/><br/><br/>
        <a >数 理 综 合 班</a> <input type="submit"  value="上传"/><br/><br/><br/>
    </div>
          
          
          
          
            <div id="button1">
            
            
           
              
              <input type="submit" style="background:#9CF;margin-left:7%;border-top-left-radius: 10px;border-top-right-radius: 10px;       
            border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" value="查看报课"/>
       
            
            
            
            
                <br/>
                <c:if test="${empty errorMsg1}"><br/></c:if>
                <c:if test="${!empty errorMsg1}">
                    <div style="color:red">${errorMsg1}</div>
                </c:if>
                <label>选择学期：<select name="semester">
                    <option value="0" selected="selected" >选择</option>
                    <option value="1" id="1"><%=Calendar.getInstance().get(Calendar.YEAR)%>01</option>
                    <option value="2" id="2"><%=Calendar.getInstance().get(Calendar.YEAR)%>02</option>
                </select></label>
                    <input type="file" name="file" value="导入课表"/>
            </div>
            <br>
            <div id=sth>

                <a> <img src="http://t04.pic.sogou.com/02180dee779e8a8c-c6d81a1366188f77-b687d8000eb0132f4db7ec0ce3773c39.jpg" width="70" height="70"/>开始/截止报课设置</a>
            </div>
            <br>
            <div id=time>
                <label>开始报课：<input name="beginCourse" type="date"/></label><br/><br/>
                <label>截止报课：<input name="endCourse" type="date"/></label><br/><br/>
                <label>开始审核：<input name="beginCheck" type="date"/></label><br/><br/>
                <label>审核截止：<input name="endCheck" type="date"/></label><br/><br/>
                <input style="background:#CFF;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" type="reset" value="重置"/>
            </div>
           
        </form>

        
        </div>
</div>
<!--
    <div id=time1>
        <img src="http://t03.pic.sogou.com/02180dee779e8a8c-9a2dfd51a14e3358-3bc24e914a3291e6ecba8a76c5e5bac1.jpg"/>
    </div>
    -->
    </div>
</div>
</body>
</html>
