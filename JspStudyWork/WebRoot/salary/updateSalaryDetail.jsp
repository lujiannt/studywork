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
    
    <title>My JSP 'addClass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.onecenter {
	text-align: center;
	width: 140px;
}

.h1 {
	color: #A7A7A7;
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

.p1{
color:#999999;
font-family: 'Open Sans', sans-serif;"
}


button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}
.myInput{height:34px;width:280px}
</style>

<script type="text/javascript">
function updSalary() {
var sid=document.getElementById("sid").value;
var uid=document.getElementById("uid").value;
var uname=document.getElementById("uname").value;
var post = document.getElementById("post").value;
var s_oid = document.getElementById("s_oid").value;
var worktime1=document.getElementById("worktime1").value;
var worktime2=document.getElementById("worktime2").value;
var account=document.getElementById("account").value;
var salary=document.getElementById("salary").value;
var url="<%=basePath%>servlet/SalaryServlet?method=updSalary&sid="+sid+"&uid="+uid+"&uname="+uname+"&post="+post+"&s_oid="+s_oid+"&worktime1="+worktime1+"&worktime2="+worktime2+"&account="+account+"&salary="+salary;
window.location = url;


}


function findClerkAjax(v) {
var xhr = getXhr();
xhr.open("get","servlet/AjaxServlet?method=findClerkAjax&uid="+v,true);
xhr.onreadystatechange = function (){
  if(xhr.readyState == 4 && xhr.status == 200){
       var strs = xhr.responseText;
       if(strs==null||strs=="") {
       document.getElementById("uidErr").innerHTML="未找到该学生!";
       } else {
       strs = strs.split(",");   
       document.getElementById("uname").value=strs[0];       
       document.getElementById("worktime1").value=strs[1];       
       document.getElementById("post").value=strs[2]; 
       document.getElementById("account").value=strs[3]; 
       document.getElementById("s_oname").value=strs[4]; 
       document.getElementById("s_oid").value=strs[5]; 
       }     
  }
};
xhr.send(null);

}
//ajax
function getXhr() {
	var xhr = null;
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHttp");
	}
	return xhr;
}
</script>
  </head>
  
  <body>
  <jsp:include page="/servlet/DepartServlet">
   <jsp:param value="findDepart2" name="method"/>
  </jsp:include>
  <jsp:include page="/servlet/OfficeServlet">
   <jsp:param value="findOffice2" name="method"/>
  </jsp:include>
   <%
  String sid = request.getParameter("sid");
  String uid = request.getParameter("uid");
  String uname = request.getParameter("uname");
  String post = request.getParameter("post");
  String s_oname = request.getParameter("s_oname");
  String worktime1 = request.getParameter("worktime1");
  String worktime2= request.getParameter("worktime2");
  String account= request.getParameter("account");
  String salary= request.getParameter("salary");
  String s_oid= request.getParameter("s_oid");
  
  
  
  %>
  <h1 class="h1">工资账单编辑</h1>
  <input type="hidden" id="s_oid" value="<%=s_oid %>">
        <br><br>账单编号:
        <input class="myInput" type="text" id="sid" name="sid" value="<%=sid %>" readonly="readonly" id="oid" style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>学生学号:
        <input class="myInput" type="text" onblur="findClerkAjax(this.value)" placeholder="请输入学生学号" id="uid" name="uid" value="<%=uid %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>学生姓名:
        <input class="myInput" type="text" placeholder="请输入岗位领导名" id="uname" name="uname" value="<%=uname %>"  readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;" >
       <br><br> 所属岗位:
        <input class="myInput" type="text" placeholder="请输入岗位电话" id="post" name=post" value="<%=post %>"  readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;">
        
       <br><br> 所属科室:
        <input class="myInput" type="text" placeholder="请输入岗位人数" id="s_oname" name="s_oname" value="<%=s_oname %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly">
       <br><br> 预期时间:
        <input class="myInput" type="text"   value="<%=worktime1 %>"  id="worktime1" name="worktime1" style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly">
        <br><br>实际时间:
        <input class="myInput" type="text"   value="<%=worktime2 %>"  id="worktime2" name="worktime1" style="color:#999999;font-family: 'Open Sans', sans-serif;" >
        <br><br>银行账号:
        <input class="myInput" type="text"  value="<%=account %>"  id="account" name="account" style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly">
        <br><br>工资数目:
        <input class="myInput" type="text"   value="<%=salary %>"  id="salary" name="salary" style="color:#999999;font-family: 'Open Sans', sans-serif;">
    	<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<button type="button" class="button gray" onclick="updSalary()">修改</button>
         
       
  </body>
</html>
