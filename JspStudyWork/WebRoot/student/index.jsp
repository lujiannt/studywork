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
		String method = "checkClerkIsCheked";
%>
    <jsp:include page="/servlet/ClerkServlet">
    <jsp:param value="<%=method %>" name="method"/>
    <jsp:param value="<%=loginUser.getUid() %>" name="uid"/>
    </jsp:include>



<header>
 <h1><img src="images/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="../clerk/findMyInfo.jsp"   target="content-main" class="website_icon">站点首页</a></li>
  <li><a href="#" class="admin_icon"><%=loginUser.getUname() %></a></li>
  <%if(!loginUser.getUname().equals("admin")) {%>
  <li><a href="../clerk/updPwd.jsp" target="content-main" class="set_icon">账号设置</a></li>
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
    <dt>账号管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="../clerk/findMyInfo.jsp"   target="content-main">查询我的信息</a></dd>
    <dd><a href="../clerk/updPwd.jsp" target="content-main">修改密码</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>申请消息</dt>
    <dd><a href="showNews.jsp" target="content-main">查看申请消息</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>岗位管理</dt>
    <%if(request.getAttribute("check").equals("yes")) {%>
    <dd><a href="../post/showPost.jsp" target="content-main">申请岗位</a></dd>
    <%} else {%>
    <dd><a href="../post/showMyPost.jsp" target="content-main">我的岗位</a></dd>
    <%} %>
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
