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

<title>My JSP 'success.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.info {
	font-family: "微软雅黑";
	color: green;
}

.onecenter {
	text-align: center;
	width: 140px;
}
</style>

<script type="text/javascript"> 
</script> 
</head>

<body>
	<table border="0">
		<tr>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
		</tr>
		<tr>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
		</tr>
		<tr>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
		</tr>
		<tr>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
		</tr>
		<tr>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
			<th class='onecenter' style="color: #A4D3EE"></th>
		</tr>
		<tr>
			<td colspan="7" align="center"><span class="info">审核失败!</span>
			</td>
		</tr>
		<tr>
			<td colspan="7" align="center"><span id="show"></span>
			</td>
		</tr>
	</table>


</body>
</html>
