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
function updPost() {
var pid=document.getElementById("pid").value;
var pname=document.getElementById("pname").value;
var pleadername=document.getElementById("pleadername").value;
var pleaderphone = document.getElementById("pleaderphone").value;
var pcount = document.getElementById("pcount").value;
var p_oid=document.getElementById("p_oid").value;

if(p_oid==""||p_oid==null) {
alert("请选择该岗位所属的科室!");
}else {
var url="<%=basePath%>servlet/PostServlet?method=updPost&pid="+pid+"&pname="+pname+"&pleadername="+pleadername+"&pleaderphone="+pleaderphone+"&p_oid="+p_oid+"&pcount="+pcount;
window.location = url;
}


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
  String pid = request.getParameter("pid");
  String pname = request.getParameter("pname");
  String pleadername = request.getParameter("pleadername");
  String pleaderphone = request.getParameter("pleaderphone");
  String pcount = request.getParameter("pcount");
  String p_oname = request.getParameter("p_oname");
  String p_dname= request.getParameter("p_dname");
  
  
  
  %>
  <h1 class="h1">岗位编辑</h1>
   <input type="hidden"  name="pid" value="<%=pid %>">
       <br><br>岗位编号:
        <input type="text" class="myInput" id="pid" name="pid" value="<%=pid %>" readonly="readonly" id="oid" style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>岗位名称:
        <input type="text" class="myInput" placeholder="请输入岗位名" id="pname" name="pname" value="<%=pname %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>岗位领导:
        <input type="text" class="myInput" placeholder="请输入岗位领导名" id="pleadername" name="pleadername" value="<%=pleadername %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>岗位电话:
        <input type="text" class="myInput" placeholder="请输入岗位电话" id="pleaderphone" name=pleaderphone" value="<%=pleaderphone %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>岗位人数:
        <input type="text" class="myInput" placeholder="请输入岗位人数" id="pcount" name=pcount" value="<%=pcount %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;">
        <br><br>原来科室:
        <input type="text" class="myInput"  value="<%=p_oname %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly">
       <br><br>新的科室:
      <select class="myInput" name="o_dname" id="p_oid">
      <option value="" >请选择</option>
           <c:forEach items="${findOffice2list}" var="office">
              <option value="${office.oid}" >${office.oname}</option>
           </c:forEach>
       </select>
    	<br><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="updPost()">修改</button>
         
       
  </body>
</html>
