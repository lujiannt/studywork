<%@page import="com.entity.Clerk"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>

<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>/css/signin.css" rel="stylesheet">
<script type="text/javascript">
function jump() {
 window.open ('register.jsp', 'newwindow', 'height=260, width=400, top=200, left=470, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no') 
}
</script>
</head>

<body>
<%
	String uid = null;
Clerk loginUser =  (Clerk)session.getAttribute("loginUser");
if(loginUser!=null) {
session.removeAttribute("loginUser");
}

String msg = (String)session.getAttribute("msg");
%>
<h1 align="center">高校学生勤工俭学管理系统</h1>
<div class="signin">
	<div class="signin-head"><img src="<%=basePath %>/images/test/head_120.png" alt="" class="img-circle"></div>
	<form class="form-signin" action="servlet/ClerkServlet" method="post" role="form">
		<input type="hidden" name="method" value="login">
		<input type="text" class="form-control" placeholder="用户名" name="uid" id="uid"   required autofocus  />
		
		<input type="password" class="form-control" placeholder="密码"  name="pwd" id="pwd" required />
		<button class="btn btn-lg btn-warning btn-block" type="submit">登录</button>
		身份: <input type="radio" name="competence" value="0" checked="checked">学生
		<input type="radio" name="competence" value="1">管理员
		<label class="checkbox">
		<%if(msg!=null) { %>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><%=msg %></font>
		<%} %>
		</label>
		&nbsp;&nbsp;&nbsp;<a href="#" onclick="jump()">账号注册 </a>&nbsp;&nbsp;<a href="#">关于我们</a> &nbsp;&nbsp;<a href="#">意见反馈</a>&nbsp;&nbsp; <a href="#">联系客服</a>
	</form>
</div>

	
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
