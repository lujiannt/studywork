<%@page import="com.entity.Class1"%>
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

<title>findClass</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function findClassByCondition() {
	   var condition =document.getElementById("condition").value;
	   if(condition!=null&&condition!="") {
	   var url = "<%=basePath%>class/updateClass.jsp?method=findClassByCondition&condition="+condition;
	   window.location =url;
	   }else {
	   alert("请输入查询条件!");
	   }
	}
	
function delByCid() {
var mes = confirm("确定将此记录删除?");
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
     alert("并没有选择要删除的对象!"); 
   }else {
     var url ="<%=basePath%>servlet/ClassServlet?dels="+dels+"&method=delClass";
     window.location=url;
   }
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
.table td{border:1px #d2d2d2 solid;padding:5px 4px;height:40px;width:30px}
.table td a{color:#668B8B;margin:0 5px;cursor:pointer;}
</style>
<script type="text/javascript">
function updClass() {
var cname=document.getElementById("cname").value;
var cid=document.getElementById("cid").value;
var c_dname=document.getElementById("c_dname").value;
var class_did=document.getElementById("class_did").value;

if(class_did==""||class_did==null) {
alert("请选择班级所属的院系!");
}else {
var url="<%=basePath%>servlet/ClassServlet?method=updClass&cname="+cname+"&cid="+cid+"&class_did="+class_did+"&c_dname="+c_dname;
window.location = url;
}


}
</script>
</head>

<body>
<% 

int pageIndex = 1;
String method ="findClass";
String strIndex = request.getParameter("pageIndex");
String condition = request.getParameter("condition");
if(strIndex!=null) {
pageIndex = Integer.parseInt(strIndex);
}
if(condition!=null&&condition!="") {
method="findClassByCondition";
}
%>
	<jsp:include page="/servlet/ClassServlet">
		<jsp:param value="<%=method %>" name="method" />
		<jsp:param value="<%=pageIndex %>" name="pageIndex" />
	</jsp:include>
	<h1 class="h1">班级信息编辑 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="condition" class="condition" style="color:#999999;font-family: 'Open Sans', sans-serif;" placeholder="请输入班级编号或名称" name="condition"> <button type="button" class="button gray" onclick="findClassByCondition()">查询</button>
	</h1>  
	<table class="table" border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">班级编号</th>
			<th class='onecenter' style="color: #7A7A7A">班级名称</th>
			<th class='onecenter' style="color: #7A7A7A">所属院系</th>
			<th class='onecenter' style="color: #7A7A7A">修改</th>
			<th class='onecenter' style="color: #7A7A7A">删除</th>
		</tr>
		<c:forEach items="${list}" var="class1">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${class1.cid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${class1.cname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${class1.c_dname}</td>
				<td class='onecenter'><a href="<%=basePath %>class/updClassDetail.jsp?cid=${class1.cid}&cname=${class1.cname}&c_dname=${class1.c_dname}" >修改</a></td>
				<td class='onecenter'><input type="checkbox" name="dels" value="${class1.cid}"></td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%List<Class1> list = (List<Class1>)request.getAttribute("list");
		if(list!=null) {
		if(list.size()==0) { %>
		
		<tr>
		  <td colspan="5" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<% }}%>
		<tr>
		<td colspan="5" align="center">
		<button type="button" class="button gray" onclick="delByCid()">删除</button>
		</td>
		</tr>
	</table>
	<br/>
	<br/>
	
	<!-- 分页 -->
	<%
	Page p = (Page)request.getAttribute("page"); 
	if(p!=null) {
	%>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span style="color:#575757;font-family: 'Open Sans', sans-serif;">当前第<%=p.getPageIndex()%>页
    
 <a href="<%=basePath %>class/updateClass.jsp?pageIndex=1" style="color:#575757;font-family: 'Open Sans', sans-serif;">首页</a>
   
 <%if(p.getPageIndex()>1) {%>
 
 <a href="<%=basePath %>class/updateClass.jsp?pageIndex=<%=pageIndex-1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">上一页</a>
 
 <%}  if(p.getPageIndex()<p.getCount()) {%>
 
 <a href="<%=basePath %>class/updateClass.jsp?pageIndex=<%=pageIndex+1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">下一页</a>
 
 <% }%>
  
 <a href="<%=basePath %>class/updateClass.jsp?pageIndex=<%=p.getCount() %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">末页</a> 
   共<%=p.getCount() %>页</span>
   <%} %>	
  <!-- 分页 --> 
  
  
</body>
</html>
