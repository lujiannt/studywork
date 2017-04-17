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
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
</script>
<style type="text/css">
.iframe {
	width: 100%;
	height: 100%;
	background-color:transparent;
	allowtransparency:true;
	border: 800px;
	
}


.content-main {
	height: 100%;
	width: 75%;
	margin: 45px; /*设置元素跟其他元素的距离为45像素*/
	float: right; /*设置浮动，实现多列效果，div+Css布局中很重要的*/
	background:none;
}
</style>
</head>
<body>
<%
			Clerk loginUser = (Clerk) session.getAttribute("loginUser");
		%>
<header>
 <h1><img src="images/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <%if(loginUser.getUname().equals("admin")) {%>
  <li><a href="../student/sendMail.jsp"   target="content-main" class="website_icon">推送岗位</a></li>
  <%}else { %>
  <li><a href="../clerk/findClerk.jsp"   target="content-main" class="website_icon">站点首页</a></li>
  <%} %>
  <li><a href="#" class="admin_icon"><%=loginUser.getUname() %></a></li>
  <%if(!loginUser.getUname().equals("admin")) {%>
  <li><a href="#" class="set_icon">账号设置</a></li>
  <% } %>
  <li><a href="../login.jsp" class="quit_icon">安全退出</a></li>
 </ul>
</header>

<!--aside nav-->
<div>
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a href="#" >欢迎登录勤工俭学管理系统</a></h2>
 <ul>
  <li>
   <dl>
    <dt>勤工管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="../clerk/findClerk.jsp"   target="content-main">查询勤工信息</a></dd>
    <dd><a href="../clerk/addClerk.jsp" target="content-main">添加勤工学生</a></dd>
    <dd><a href="../clerk/updateClerk.jsp"  target="content-main">勤工信息管理</a></dd>
    <dd><a href="../post/checkClerk.jsp" target="content-main">学生勤工审核</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>工资管理</dt>
    <dd><a href="../salary/paySalary.jsp" target="content-main">发放职工工资</a></dd>
    <dd><a href="../salary/findSalary.jsp" target="content-main">查询工资账单</a></dd>
    <dd><a href="../salary/updateSalary.jsp" target="content-main">工资账单管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>岗位管理</dt>
    <dd><a href="../post/addPost.jsp" target="content-main">设立新的岗位</a></dd>
    <dd><a href="../post/findPost.jsp" target="content-main">查询岗位信息</a></dd>
    <dd><a href="../post/updatePost.jsp" target="content-main">岗位信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>科室管理</dt>
    <dd><a href="../office/addOffice.jsp"  target="content-main">设立新的科室</a></dd>
    <dd><a href="../office/findOffices.jsp" target="content-main">查询科室信息</a></dd>
    <dd><a href="../office/updateOffice.jsp" target="content-main">科室信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>班级管理</dt>
    <dd><a href="../class/addClass.jsp"  target="content-main">录入班级信息</a></dd>
    <dd><a href="../class/findClass.jsp" target="content-main">查询班级信息</a></dd>
    <dd><a href="../class/updateClass.jsp" target="content-main">班级信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>院系管理</dt>
    <dd><a href="../depart/addDepart.jsp"  target="content-main">录入院系信息</a></dd>
    <dd><a href="../depart/findDepart.jsp" target="content-main">查询院系信息</a></dd>
    <dd><a href="../depart/updateDepart.jsp" target="content-main">院系信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>推送管理</dt>
    <dd><a href="../student/sendMail.jsp"  target="content-main">推送岗位信息</a></dd>
   </dl>
  </li>
 </ul>
</aside>
</div>
<div class="content-main">
		<iframe class="iframe" name="content-main">
         </iframe>
</div>

</body>
</html>
