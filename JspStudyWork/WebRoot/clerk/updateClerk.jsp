<%@page import="com.entity.Clerk"%>
<%@page import="com.entity.Post"%>
<%@page import="com.entity.Page"%>
<%@page import="com.entity.Office"%>
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
	function findClerkByCondition() {
	   var condition =document.getElementById("condition").value;
	   if(condition!=null&&condition!="") {
	   var url = "<%=basePath%>clerk/updateClerk.jsp?method=findClerkByCondition&condition="+condition;
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
     var url ="<%=basePath%>servlet/ClerkServlet?dels="+dels+"&method=delClerk";
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
.table th{border:1px #d2d2d2 solid;height:40px;line-height:20px;}
.table td{border:1px #d2d2d2 solid;padding:4px 3px;height:20px;width:32px}
.table td a{color:#668B8B;margin:0 5px;cursor:pointer;}
}
</style>
  </head>
  
  <body>
  <%
  	int pageIndex = 1;
  String method ="findClerk";
  String strIndex = request.getParameter("pageIndex");
  String condition = request.getParameter("condition");
  if(strIndex!=null) {
  pageIndex = Integer.parseInt(strIndex);
  }
  if(condition!=null&&condition!="") {
  method="findClerkByCondition";
  }
  %>
  
    <jsp:include page="/servlet/ClerkServlet">
    <jsp:param value="<%=method %>" name="method"/>
    <jsp:param value="<%=pageIndex %>" name="pageIndex"/>
    </jsp:include>
    
    
    <h1 class="h1">勤工俭学学生表 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="condition" class="condition" style="color:#999999;font-family: 'Open Sans', sans-serif;" placeholder="请输入学生姓名/学号" name="condition"> <button type="button" class="button gray" onclick="findClerkByCondition()">查询</button>
	</h1>  
	<table border='1' class="table"  bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">职工编号</th>
			<th class='onecenter' style="color: #7A7A7A">职工学号</th>
			<th class='onecenter' style="color: #7A7A7A">职工姓名</th>
			<th class='onecenter' style="color: #7A7A7A">职工性别</th>
			<th class='onecenter' style="color: #7A7A7A">职工电话</th>
			<th class='onecenter' style="color: #7A7A7A">职工邮件</th>
			<th class='onecenter' style="color: #7A7A7A">所属学院</th>
			<th class='onecenter' style="color: #7A7A7A">所属班级</th>
			<th class='onecenter' style="color: #7A7A7A">所属岗位</th>
			<th class='onecenter' style="color: #7A7A7A">工作时间</th>
			<th class='onecenter' style="color: #7A7A7A">职工类别</th>
			<th class='onecenter' style="color: #7A7A7A">支付宝</th>
			<th class='onecenter' style="color: #7A7A7A">编辑</th>
			<th class='onecenter' style="color: #7A7A7A">删除</th>
		</tr>
		<c:forEach items="${list}" var="clerk">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.id}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.uid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.uname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.sex}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.phone}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.email}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.dname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.cname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.upost}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.worktime}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.kname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${clerk.account}</td>
			     <td class='onecenter'><a href="<%=basePath %>clerk/updateClerkDetail.jsp?id=${clerk.id}&uid=${clerk.uid}&uname=${clerk.uname}&sex=${clerk.sex}&phone=${clerk.phone}&email=${clerk.email}&dname=${clerk.dname}&cname=${clerk.cname}&upost=${clerk.upost}&worktime=${clerk.worktime}&kname=${clerk.kname}&kind=${clerk.kind}&depart=${clerk.depart}&uclass=${clerk.uclass}&account=${clerk.account}" >修改</a></td>
				<td class='onecenter'><input type="checkbox" name="dels" value="${clerk.id}"></td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%
			List<Clerk> list = (List<Clerk>)request.getAttribute("list");
				if(list!=null) {
				if(list.size()==0) {
		%>
		
		<tr>
		  <td  align="center" colspan="14" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<%} }%>
		
		<tr>
		<td colspan="14" align="center">
		<button type="button" class="button gray" onclick="delByCid()">删除</button>
		</td>
		</tr>
	</table>
	<br/>
	
	<!-- 分页 -->
	<%
	Page p = (Page)request.getAttribute("page"); 
	if(p!=null) {
	%>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span style="color:#575757;font-family: 'Open Sans', sans-serif;">当前第<%=p.getPageIndex()%>页
    
 <a href="<%=basePath %>clerk/updateClerk.jsp?pageIndex=1" style="color:#575757;font-family: 'Open Sans', sans-serif;">首页</a>
   
 <%if(p.getPageIndex()>1) {%>
 
 <a href="<%=basePath %>clerk/updateClerk.jsp?pageIndex=<%=pageIndex-1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">上一页</a>
 
 <%}  if(p.getPageIndex()<p.getCount()) {%>
 
 <a href="<%=basePath %>clerk/updateClerk.jsp?pageIndex=<%=pageIndex+1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">下一页</a>
 
 <% }%>
  
 <a href="<%=basePath %>clerk/updateClerk.jsp?pageIndex=<%=p.getCount() %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">末页</a> 
   共<%=p.getCount() %>页</span>
   <%} %>	
  <!-- 分页 --> 
  
  
</body>
</html>
