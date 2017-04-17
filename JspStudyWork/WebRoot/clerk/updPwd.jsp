<%@page import="com.entity.Clerk"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updPwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	--><style type="text/css">
.onecenter {
	text-align: center;
	width: 140px;
}

.h1 {
	color: #7A7A7A;
}

.button{
width: 100px;
line-height: 28px;
text-align: center;
font-weight: bold;
color: #fff;
text-shadow:1px 1px 1px #333;
border-radius: 5px;
position: relative;
overflow: hidden;
}

.button.gray{
color:#999999;
text-shadow:1px 1px 1px #fff;
border:1px solid #79CDCD;
box-shadow: 0 1px 2px #fff inset,0 -1px 0 #a8abae inset;
background: -webkit-linear-gradient(top,#f2f3f7,#e4e8ec);
background: -moz-linear-gradient(top,#f2f3f7,#e4e8ec);
background: linear-gradient(top,#f2f3f7,#e4e8ec);
}

.condition {
border-color: #A4D3EE;
height: 30px;

}

button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}
.myInput{height:34px;width:280px}
</style>
	
<script type="text/javascript"> 

function checkPwd() {
var flag = false;
var pwd1 = document.getElementById("newPwd1").value;
var pwd2 = document.getElementById("newPwd2").value;

if(pwd1!=pwd2) {
alert("两次输入的密码不一样");
}else {
flag = true;
}
return flag;
}


</script> 

  </head>
  
  <body>
  <%
			Clerk loginUser = (Clerk) session.getAttribute("loginUser");
%>
  
  <form action="servlet/ClerkServlet" method="post" onsubmit="return checkPwd()">
  <input  type="hidden" name="method" value="updPwd">
  <input  type="hidden" name="uid" value="<%=loginUser.getUid()%>">
    请输入您的新密码:<input class="myInput" type="password" name="newPwd1" id="newPwd1"><br><br>
    请再次输入新密码:<input class="myInput" type="password" name="newPwd2" id="newPwd2"><br><br><br>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;   &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交">
    </form>
  </body>
</html>
