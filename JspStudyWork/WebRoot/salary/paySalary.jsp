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

.p1{
color:#999999;
font-family: 'Open Sans', sans-serif;"
}

button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}
.myInput{height:34px;width:280px}
</style>

<script type="text/javascript">
function addSalary() {

var uid=document.getElementById("uid").value;
var uname = document.getElementById("uname").value;
var worktime1 = document.getElementById("worktime1").value;
var worktime2=document.getElementById("worktime2").value;
var post=document.getElementById("post").value;
var salary=document.getElementById("salary").value;
var account=document.getElementById("account").value;

if(worktime2==""||worktime2==null){
alert("请输入实际工作时间!");
}else if(salary==""||salary==null) {
alert("请输入要发放的工资!");
}else {
var url="<%=basePath%>servlet/SalaryServlet?method=addSalary&uid="+uid+"&uname="+uname+"&worktime1="+worktime1+"&worktime2="+worktime2+"&post="+post+"&salary="+salary+"&account="+account;
window.location = url;
}


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
  <jsp:include page="/servlet/OfficeServlet">
   <jsp:param value="findOffice2" name="method"/>
  </jsp:include>
    <h1 class="h1">发放工资</h1>
    <form action="servlet/ClassSerclet" method="post">
                 勤工学生学号:
        <input class="myInput" type="text" onblur="findClerkAjax(this.value)" placeholder="请输入学生学号" name="uid" id="uid" style="color:#999999;font-family: 'Open Sans', sans-serif;"><span id="uidErr" style="color: red"></span><br><br>
        
        
                 勤工学生姓名:
        <input type="text" class="myInput" placeholder="请输入学生姓名" name="uname" id="uname" readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;"><span id="unameErr"></span><br><br>
        
               预定工作时间:
       <input type="text" class="myInput" placeholder="请输入预定工作时间" name="worktime1" id="worktime1" readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
       
       实际工作时间:
      <input type="text" class="myInput" placeholder="请输入实际工作月数" name="worktime2" id="worktime2" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        
     学生所属岗位:
      <input type="text" class="myInput" placeholder="请输入所属岗位" name="post" id="post" readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        
    学生银行账号:
      <input type="text" class="myInput" name="account" readonly="readonly" placeholder="请输入支付宝账号" id="account" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
  
     发放工资金额:
      <input type="text" class="myInput" name="salary" placeholder="请输入工资" id="salary" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br><br>
       
  
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="addSalary()">发放工资</button>
       
         
       
    </form> 
  </body>
</html>
