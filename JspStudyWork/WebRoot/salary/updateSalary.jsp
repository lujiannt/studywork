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
	function findSalaryByCondition() {
	   var condition =document.getElementById("condition").value;
	   if(condition!=null&&condition!="") {
	   var url = "<%=basePath%>salary/updateSalary.jsp?method=findSalaryByCondition&condition="+condition;
	   window.location =url;
	   }else {
	   alert("请输入查询条件!");
	   }
	}
	//工资报表的排序
	function findSalaryBySel() {
	  var orderCondition = document.getElementById("orderCondition").value;
	  var condition;
	  if(orderCondition=="salaryup") {
	   condition = "order by salary asc";
	   var url = "<%=basePath%>salary/updateSalary.jsp?method=findOrderSalaryByCondition&condition="+condition;
	   window.location =url;
	   
	  }else if(orderCondition=="salarydown") {
	   condition = "order by salary desc";
	   var url = "<%=basePath%>salary/updateSalary.jsp?method=findOrderSalaryByCondition&condition="+condition;
	   window.location =url;
	  
	  }else if(orderCondition=="postup") {
	   condition = "order by post";
	   var url = "<%=basePath%>salary/updateSalary.jsp?method=findOrderSalaryByCondition&condition="+condition;
	   window.location =url;
	  
	  }else if(orderCondition=="officeup") {
	   condition = "order by s_oid";
	   var url = "<%=basePath%>salary/updateSalary.jsp?method=findOrderSalaryByCondition&condition="+condition;
	   window.location =url;
	  }
	}
	
	
	//删除
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
     var url ="<%=basePath%>servlet/SalaryServlet?dels="+dels+"&method=delSalary";
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
.table td{border:1px #d2d2d2 solid;padding:4px 4px;height:42px;width:30px}
.table td a{color:#668B8B;margin:0 5px;cursor:pointer;}
.myInput{height:30px;width:200px}
</style>
  </head>
  
  <body>
  <% 

int pageIndex = 1;
String method =request.getParameter("method");
String strIndex = request.getParameter("pageIndex");
String condition = request.getParameter("condition");

if(strIndex!=null) {
pageIndex = Integer.parseInt(strIndex);
}
if(method==null||method=="") {
method = "findSalary";
}
%>
  
    <jsp:include page="/servlet/SalaryServlet">
    <jsp:param value="<%=method %>" name="method"/>
    <jsp:param value="<%=pageIndex %>" name="pageIndex"/>
    </jsp:include>
    
    
    <h1 class="h1">工资报表<br/>
    <select class="myInput" onchange="findSalaryBySel()" id="orderCondition">
      <option value="">请选择排序条件</option>
      <option value="salaryup">按照工资升序排序</option>
      <option value="salarydown">按照工资降序排序</option>
      <option value="postup">按照所属岗位排序</option>
      <option value="officeup">按照所属科室排序</option>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="condition" class="condition" style="color:#999999;font-family: 'Open Sans', sans-serif;" placeholder="账单编号或学生学号" name="condition"> <button type="button" class="button gray" onclick="findSalaryByCondition()">查询</button>
	</h1>  
	<table class="table" border='1' bordercolor="#CAE1FF" cellspacing="0" cellpadding="0">
		<tr>
			<th class='onecenter' style="color: #7A7A7A">账单编号</th>
			<th class='onecenter' style="color: #7A7A7A">学生学号</th>
			<th class='onecenter' style="color: #7A7A7A">学生姓名</th>
			<th class='onecenter' style="color: #7A7A7A">所属岗位</th>
			<th class='onecenter' style="color: #7A7A7A">所属科室</th>
			<th class='onecenter' style="color: #7A7A7A">预定工作时间</th>
			<th class='onecenter' style="color: #7A7A7A">实际工作时间</th>
			<th class='onecenter' style="color: #7A7A7A">支付宝账号</th>
			<th class='onecenter' style="color: #7A7A7A">所得薪水</th>
			<th class='onecenter' style="color: #7A7A7A">编辑</th>
			<th class='onecenter' style="color: #7A7A7A">删除</th>
		</tr>
		<c:forEach items="${list}" var="salary">
			<tr>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.sid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.uid}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.uname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.post}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.s_oname}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.worktime1}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.worktime2}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.account}</td>
				<td class='onecenter'
					style="color:#575757;font-family: 'Open Sans', sans-serif;">${salary.salary}</td>
		         <td class='onecenter'><a href="<%=basePath %>salary/updateSalaryDetail.jsp?sid=${salary.sid}&uid=${salary.uid}&uname=${salary.uname}&post=${salary.post}&s_oname=${salary.s_oname}&worktime1=${salary.worktime1}&worktime2=${salary.worktime2}&account=${salary.account}&salary=${salary.salary}&s_oid=${salary.s_oid}" >修改</a></td>
				<td class='onecenter'><input type="checkbox" name="dels" value="${salary.sid}"></td>
			</tr>
		</c:forEach>
		<!-- 没有找到的情况下 -->
		<%List<Post> list = (List<Post>)request.getAttribute("list");
		if(list!=null) {
		if(list.size()==0) { %>
		
		<tr>
		  <td  align="center" colspan="9" class='onecenter'
					style="color:#999999;font-family: 'Open Sans', sans-serif;">未找到相关信息</td>
		</tr>
		
		<%} }%>
		<tr>
		<td colspan="11" align="center">
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
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span style="color:#575757;font-family: 'Open Sans', sans-serif;">当前第<%=p.getPageIndex()%>页
    
 <a href="<%=basePath %>salary/updateSalary.jsp?method=<%=method %>&condition=${condition}&pageIndex=1" style="color:#575757;font-family: 'Open Sans', sans-serif;">首页</a>
   
 <%if(p.getPageIndex()>1) {%>
 
 <a href="<%=basePath %>salary/updateSalary.jsp?method=<%=method %>&condition=${condition}&pageIndex=<%=pageIndex-1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">上一页</a>
 
 <%}  if(p.getPageIndex()<p.getCount()) {%>
 
 <a href="<%=basePath %>salary/updateSalary.jsp?method=<%=method %>&condition=${condition}&pageIndex=<%=pageIndex+1 %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">下一页</a>
 
 <% }%>
  
 <a href="<%=basePath %>salary/updateSalary.jsp?method=<%=method %>&condition=${condition}&pageIndex=<%=p.getCount() %>" style="color:#575757;font-family: 'Open Sans', sans-serif;">末页</a> 
   共<%=p.getCount() %>页</span>
   <%} %>	
  <!-- 分页 --> 
  
  
</body>
</html>
