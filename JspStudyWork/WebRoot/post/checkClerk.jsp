<%@page import="com.entity.Post"%>
<%@page import="com.entity.Page"%>
<%@page import="com.entity.Office"%>
<%@page import="com.entity.Clerk"%>
<%@page import="com.entity.Checks"%>
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
    
    <title>My JSP 'findOffices.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	
	//批准申请职位
	function askPost() {
	var mes = confirm("确定批准此岗位吗?");
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
     alert("并没有选择要审核的学生!"); 
   }else if(dels.length>1) {
   alert("一次只可审核一个学生!"); 
   }else {
     var url ="<%=basePath%>servlet/PostServlet?dels="+dels+"&method=askPost";
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
.table td{border:1px #d2d2d2 solid;padding:10px 8px;}
</style>
  </head>
  
  <body>
  <% 
Clerk loginUser = (Clerk) session.getAttribute("loginUser");
String method ="showChecks";

%>
  
    <jsp:include page="/servlet/PostServlet">
    <jsp:param value="<%=method %>" name="method"/>
    </jsp:include>
    
   
    <h1 class="h1">申请岗位 
	</h1>  
	<table class="table" border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">岗位编号</th>
			<th class='onecenter' style="color: #7A7A7A">岗位名称</th>
			<th class='onecenter' style="color: #7A7A7A">学生学号</th>
			<th class='onecenter' style="color: #7A7A7A">学生姓名</th>
			<th class='onecenter' style="color: #7A7A7A">所属班级</th>
			<th class='onecenter' style="color: #7A7A7A">所属院系</th>
			<th class='onecenter' style="color: #7A7A7A">类别</th>
			<th class='onecenter' style="color: #7A7A7A">操作</th>
		</tr>
		<c:forEach items="${list}" var="checks">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.pid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.pname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.uid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.uname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.uclass}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.depart}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${checks.kind}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;"><input type="checkbox" name="dels" value="${checks.chid}"></td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%List<Checks> list = (List<Checks>)request.getAttribute("list");
		if(list!=null) {
		if(list.size()==0) { %>
		
		<tr>
		  <td  align="center" colspan="8" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<%} }%>
		<tr>
		<td colspan="11" align="center">
		<input type="button" class="button gray" value="同意" onclick="askPost()">
		</td>
		</tr>
	</table>
	<br/>
	<br/>
	
  
  
</body>
</html>
