<%@page import="com.entity.Clerk"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Index</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.3.2.js" type="text/javascript"></script>
<link href="css/zzsc.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$(".subNav").click(
				function() {
					$(this).toggleClass("currentDd").siblings(".subNav")
							.removeClass("currentDd");
					$(this).toggleClass("currentDt").siblings(".subNav")
							.removeClass("currentDt");

					// 修改数字控制速度， slideUp(500)控制卷起速度
					$(this).next(".navContent").slideToggle(500).siblings(
							".navContent").slideUp(500);
				});
	});
</script>


<style type="text/css">
ul li {
	list-style-type: none;
}

.body {
    background-color:#F0F8FF;
	font-size: 25px;
	color: #676767;
	font-family: 'Open Sans', sans-serif;
}

.head {
	height: 100px;
	background-color:#D1EEEE;
}

.content {
	height: 600px;
	width: 100%;
	background-color: none;
}

.content-title {
	height: 500px;
	width: 15%;
	margin: 20px; /*设置元素跟其他元素的距离为20像素*/
	float: left; /*设置浮动，实现多列效果，div+Css布局中很重要的*/
	background: none;
}

.content-main {
	height: 500px;
	width: 75%;
	margin: 45px; /*设置元素跟其他元素的距离为45像素*/
	float: left; /*设置浮动，实现多列效果，div+Css布局中很重要的*/
	background:none;
}
/*
<!--设置iframe 透明 -->
*/
.iframe {
	width: 100%;
	height: 600px;
	background-color:transparent;
	allowtransparency:true;
	border: 0;
	
}
</style>
</head>
<body background="" class="body">
	<div class="head">
		<%
			Clerk loginUser = (Clerk) session.getAttribute("loginUser");
		%>
		&nbsp;&nbsp;欢迎登录高校学生勤工俭学管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a style="font-size:medium;">账户:<%=loginUser.getUname() %> </a> <a href="<%=basePath %>login.jsp"  style="font-size:medium;">退出</a>

	</div>

	<div class="content">
		<div class="content-title">
			<div class="subNavBox">
				<div class="subNav">班级管理</div>
				<ul class="navContent">
					<li><a href="class/addClass.jsp" style="color:#53868B"
						target="content-main">添加班级</a>
					</li>
					<li><a href="class/findClass.jsp" style="color:#53868B"
						target="content-main">查询班级</a>
					</li>
					<li><a href="class/updateClass.jsp" style="color:#53868B"
						target="content-main">编辑班级</a>
					</li>
				</ul>
				<div class="subNav currentDd currentDt">职工管理</div>
				<ul class="navContent " style="display:block">
					<li><a href="clerk/addClerk.jsp" style="color:#53868B"
						target="content-main">职工添加</a>
					</li>
					<li><a href="post/checkClerk.jsp" style="color:#53868B"
						target="content-main">职工审核</a>
					</li>
					<li><a href="clerk/findClerk.jsp" style="color:#53868B" target="content-main">职工查询</a>
					</li>
					<li><a href="clerk/updateClerk.jsp" style="color:#53868B" target="content-main">职工编辑</a>
				</ul>
				<div class="subNav currentDd currentDt">院系管理</div>
				<ul class="navContent " style="display:block">
					<li><a href="depart/addDepart.jsp" style="color:#53868B"
						target="content-main">院系添加</a>
					</li>
					<li><a href="depart/findDepart.jsp" style="color:#53868B" target="content-main">院系查询</a>
					</li>
					<li><a href="depart/updateDepart.jsp" style="color:#53868B" target="content-main">院系编辑</a>
				</ul>
				<div class="subNav">岗位管理</div>
				<ul class="navContent">
					<li><a href="post/findPost.jsp" style="color:#53868B"
						target="content-main">查询岗位</a>
					</li>
					<li><a href="post/addPost.jsp" style="color:#53868B"
						target="content-main">发布岗位</a>
					</li>
					<li><a href="post/updatePost.jsp" style="color:#53868B"
						target="content-main">编辑岗位</a>
					</li>
				</ul>
				<div class="subNav">科室管理</div>
				<ul class="navContent">
					<li><a href="office/findOffices.jsp" style="color:#53868B"
						target="content-main">查询科室</a>
					</li>
					<li><a href="office/addOffice.jsp" style="color:#53868B"
						target="content-main">新增科室</a>
					</li>
					<li><a href="office/updateOffice.jsp" style="color:#53868B"
						target="content-main">编辑科室</a>
					</li>
				</ul>
				<div class="subNav">工资管理</div>
				<ul class="navContent">
					<li><a href="salary/findSalary.jsp" style="color:#53868B"
						target="content-main">工资报表</a>
					</li>
					<li><a href="salary/paySalary.jsp" style="color:#53868B"
						target="content-main">发放工资</a>
					</li>
					<li><a href="salary/updateSalary.jsp" style="color:#53868B"
						target="content-main">编辑报表</a>
					</li>
				</ul>
			</div>
				
		</div>

		<div class="content-main">
		<iframe class="iframe" name="content-main">
         </iframe>
		</div>

	</div>






</body>
</html>
