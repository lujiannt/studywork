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
	   var url = "depart/result.jsp?method=findDepartByCondition&condition="+condition;
	   window.location =url;
	
	}
</script>	
	
	
<style type="text/css">
.onecenter {
	text-align: center;
	width: 140px;
}

.h1 {
	color: #A4D3EE;
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
</style>
</head>

<body>
	<h1 class="h1">院系详细信息表 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="condition" class="condition" style="color:#999999;font-family: 'Open Sans', sans-serif;" placeholder="请输入院系编号或名称" name="condition"> <button type="button" class="button gray" onclick="findDepartByCondition()">查询</button>
	</h1>  
	<table border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #A4D3EE">院系编号</th>
			<th class='onecenter' style="color: #A4D3EE">院系名称</th>
			<th class='onecenter' style="color: #A4D3EE">院系领导</th>
			<th class='onecenter' style="color: #A4D3EE">院系电话</th>
			<th class='onecenter' style="color: #A4D3EE">院系类别</th>
		</tr>
		<c:forEach items="${list}" var="depart">
			<tr>
				<td class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">${depart.dno}</td>
				<td class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">${depart.dname}</td>
				<td class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">${depart.dleader}</td>
				<td class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">${depart.dphone}</td>
				<td class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">${depart.dkind_name}</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<br/>
	
  
  
</body>
</html>
