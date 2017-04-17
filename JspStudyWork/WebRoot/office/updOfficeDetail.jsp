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
function updOffice() {
var oid=document.getElementById("oid").value;
var oname=document.getElementById("oname").value;
var oleadername=document.getElementById("oleadername").value;
var ophone = document.getElementById("ophone").value;
var o_did=document.getElementById("o_dname").value;

if(o_did==""||o_did==null) {
alert("请选择科室所属的院系!");
}else {
var url="<%=basePath%>servlet/OfficeServlet?method=updOffice&oid="+oid+"&oname="+oname+"&oleadername="+oleadername+"&ophone="+ophone+"&o_did="+o_did;
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
  String oid = request.getParameter("oid");
  String oname = request.getParameter("oname");
  String oleadername = request.getParameter("oleadername");
  String ophone = request.getParameter("ophone");
  String o_did = request.getParameter("o_did");
  String o_dname= request.getParameter("o_dname");
  
  
  
  %>
  <h1 class="h1">科室编辑</h1>
   <input type="hidden" id="cid" name="oid" value="<%=oid %>">
      <br><br>  科室编号:
        <input type="text" class="myInput" id="oid" name="oid" value="<%=oid %>" readonly="readonly" id="oid" style="color:#999999;font-family: 'Open Sans', sans-serif;"></td>
        <br><br>科室名称:
        <input type="text"  class="myInput" placeholder="请输入科室名" id="oname" name="oname" value="<%=oname %>" id="cname" style="color:#999999;font-family: 'Open Sans', sans-serif;"></td>
        <br><br>科室领导:
        <input type="text" class="myInput" placeholder="请输入科室领导名" id="oleadername" name="oleadername" value="<%=oleadername %>" id="cname" style="color:#999999;font-family: 'Open Sans', sans-serif;"></td>
        <br><br>科室电话:
        <input type="text" class="myInput" placeholder="请输入科室电话" id="ophone" name="ophone" value="<%=ophone %>" id="cname" style="color:#999999;font-family: 'Open Sans', sans-serif;"></td>
        <br><br>原来院系:
        <input type="text" class="myInput" id="o_dnameold" value="<%=o_dname %> "  style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly"></td>
     <br><br> 新的院系:
      <select class="myInput" name="o_dname" id="o_dname">
      <option value="" >请选择</option>
           <c:forEach items="${findDepart2list}" var="depart">
              <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select>
    	<br><br>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="updOffice()">修改</button>
    		
  </body>
</html>
