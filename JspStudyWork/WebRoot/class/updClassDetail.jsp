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
  <jsp:include page="/servlet/DepartServlet">
   <jsp:param value="findDepart2" name="method"/>
  </jsp:include>
   <%
  String cid = request.getParameter("cid");
  String cname = request.getParameter("cname");
  String c_dname= request.getParameter("c_dname");%>
  <h1 class="h1">班级编辑</h1>
   <input type="hidden" id="cid" name="cid" value="<%=cid %>">
        <br>班级名称:
        <input type="text" class="myInput" placeholder="请输入班级名" id="cname" name="cname" value="<%=cname %>" id="cname" style="color:#999999;font-family: 'Open Sans', sans-serif;">
     <br><br>  原来院系:
        <input type="text" class="myInput" id="c_dname" value="<%=c_dname %>" readonly="readonly">
     <br><br> 新的院系:
      <select class="myInput" name="class_did" id="class_did">
      <option value="" id="c_dname">请选择</option>
           <c:forEach items="${findDepart2list}" var="depart">
              <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select>
    	<br><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="updClass()">修改</button>
       
  </body>
</html>
