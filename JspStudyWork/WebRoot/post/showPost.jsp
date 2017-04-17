<%@page import="com.entity.Post"%>
<%@page import="com.entity.Page"%>
<%@page import="com.entity.Office"%>
<%@page import="com.entity.Clerk"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>可申请岗位</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function findPostByCondition() {
	   var condition =document.getElementById("condition").value;
	   if(condition!=null&&condition!="") {
	   var url = "<%=basePath%>post/findPost.jsp?method=findPostByCondition&condition="+condition;
	   window.location =url;
	   }else {
	   alert("请输入查询条件!");
	   }
	}
	
	//申请职位
	function askPost() {
	var uid = document.getElementById("uid").value;
	var mes = confirm("确定申请此岗位吗?");
   	if(mes) {
   	var ids=document.getElementsByName("dels");
   	var dels=new Array();
  	var k=0;
   	for(var i=0;i<ids.length;i++) {
    if(ids[i].checked==true) {
        dels[k]=ids[i].value;
        k++;
    }
   	}
   if(dels.length<=0) {
     alert("并没有选择要申请的岗位!"); 
   }else if(dels.length>1) {
   alert("只可申请一个岗位!"); 
   }else {
     var url ="<%=basePath%>servlet/PostServlet?dels="+dels+"&method=ask&uid="+uid;
     window.location=url;
   }
 }
 }
</script>		
	
<style type="text/css">
.onecenter {
	text-align: center;
	width: 110px;
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

.table{width:100%;}
.table th{border:1px #d2d2d2 solid;height:40px;line-height:40px;}
.table td{border:1px #d2d2d2 solid;padding:8px 6px;height:50px;width:30px}
</style>
  </head>
  
  <body>
  <% 
Clerk loginUser = (Clerk) session.getAttribute("loginUser");

int pageIndex = 1;
String method ="findPost";
String strIndex = request.getParameter("pageIndex");
String condition = request.getParameter("condition");
if(strIndex!=null) {
pageIndex = Integer.parseInt(strIndex);
}
if(condition!=null&&condition!="") {
method="findPostByCondition";
}

System.out.print("uid=="+loginUser.getUid());
%>
  
    <jsp:include page="/servlet/PostServlet">
    <jsp:param value="<%=method %>" name="method"/>
    <jsp:param value="<%=pageIndex %>" name="pageIndex"/>
    </jsp:include>
    
    <input type="hidden" name="uid" id="uid" value="<%=loginUser.getUid() %>">
    <h1 class="h1">申请岗位 
	</h1>  
	<table class="table" border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">岗位编号</th>
			<th class='onecenter' style="color: #7A7A7A">岗位名称</th>
			<th class='onecenter' style="color: #7A7A7A">岗位领导</th>
			<th class='onecenter' style="color: #7A7A7A">岗位电话</th>
			<th class='onecenter' style="color: #7A7A7A">岗位人数</th>
			<th class='onecenter' style="color: #7A7A7A">最大人数</th>
			<th class='onecenter' style="color: #7A7A7A">所属科室</th>
			<th class='onecenter' style="color: #7A7A7A">所属学院</th>
			<th class='onecenter' style="color: #7A7A7A">类别</th>
			<th class='onecenter' style="color: #7A7A7A">操作</th>
		</tr>
		<c:forEach items="${list}" var="post">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pleadername}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pleaderphone}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pcount}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.pcount2}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.p_oname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.p_dname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${post.kind}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;"><input type="checkbox" name="dels" value="${post.pid}"></td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%List<Post> list = (List<Post>)request.getAttribute("list");
		if(list!=null) {
		if(list.size()==0) { %>
		
		<tr>
		  <td  align="center" colspan="7" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<%} }%>
		<tr>
		<td colspan="11" align="center">
		<input type="button" class="button gray" value="申请" onclick="askPost()">
		</td>
		</tr>
	</table>
	<br/>
	<br/>
	
  
  
</body>
</html>
