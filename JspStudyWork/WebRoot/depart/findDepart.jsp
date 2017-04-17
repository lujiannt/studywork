<%@page import="com.entity.Depart"%>
<%@page import="com.entity.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>findDepart</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function findDepartByCondition() {
	   var condition =document.getElementById("condition").value;
	   if(condition!=null&&condition!="") {
	   var url = "<%=basePath%>depart/findDepart.jsp?method=findDepartByCondition&condition="+condition;
	   window.location =url;
	   }else {
	   alert("请输入查询条件!");
	   }
	}
</script>	
	
	
<style type="text/css">
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

.table{width:100%;}
.table th{border:1px #d2d2d2 solid;height:40px;line-height:40px;}
.table td{border:1px #d2d2d2 solid;padding:8px 6px;height:50px;width:30px}
</style>
</head>

<body>
<% 

int pageIndex = 1;
String method ="findDepart";
String strIndex = request.getParameter("pageIndex");
String condition = request.getParameter("condition");
if(strIndex!=null) {
pageIndex = Integer.parseInt(strIndex);
}
if(condition!=null&&condition!="") {
method="findDepartByCondition";
}
%>
	<jsp:include page="/servlet/DepartServlet">
		<jsp:param value="<%=method %>" name="method" />
		<jsp:param value="<%=pageIndex %>" name="pageIndex" />
	</jsp:include>
	<h1 class="h1">院系信息 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="condition" class="condition" style="color:#999999;font-family: 'Open Sans', sans-serif;" placeholder="请输入院系编号或名称" name="condition"> <button type="button" class="button gray" onclick="findDepartByCondition()">查询</button>
	</h1>  
	<table class="table" border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">院系编号</th>
			<th class='onecenter' style="color: #7A7A7A">院系名称</th>
			<th class='onecenter' style="color: #7A7A7A">院系领导</th>
			<th class='onecenter' style="color: #7A7A7A">院系电话</th>
			<th class='onecenter' style="color: #7A7A7A">院系类别</th>
		</tr>
		<c:forEach items="${list}" var="depart">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${depart.dno}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${depart.dname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${depart.dleader}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${depart.dphone}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${depart.dkind_name}</td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%List<Depart> list = (List<Depart>)request.getAttribute("list");
		if(list!=null) {
		if(list.size()==0) { %>
		
		<tr>
		  <td  align="center" colspan="5" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<%} }%>
	</table>
	<br/>
	<br/>
	
	<!-- 分页 -->
	<%
	Page p = (Page)request.getAttribute("page"); 
	if(p!=null) {
	%>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span style="color:#575757;font-family: 'Open Sans', sans-serif;">当前第<%=p.getPageIndex()%>页
    
 <a href="<%=basePath %>depart/findDepart.jsp?pageIndex=1" style="color:#575757;font-family: 'Open Sans', sans-serif;">首页</a>
   
 <%if(p.getPageIndex()>1) {%>
 
 <a href="<%=basePath %>depart/findDepart.jsp?pageIndex=<%=pageIndex-1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">上一页</a>
 
 <%}  if(p.getPageIndex()<p.getCount()) {%>
 
 <a href="<%=basePath %>depart/findDepart.jsp?pageIndex=<%=pageIndex+1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">下一页</a>
 
 <% }%>
  
 <a href="<%=basePath %>depart/findDepart.jsp?pageIndex=<%=p.getCount() %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">末页</a> 
   共<%=p.getCount() %>页</span>
   <%} %>	
  <!-- 分页 --> 
  
  
</body>
</html>
