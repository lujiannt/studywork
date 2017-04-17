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
function addOffice() {
var oname=document.getElementById("oname").value;
var oleadername = document.getElementById("oleadername").value;
var ophone = document.getElementById("ophone").value;
var o_did=document.getElementById("class_did").value;

if(oname==""||oname==null){
alert("请输入科室名!");
}else if(o_did==""||o_did==null) {
alert("请选择班级所属的院系!");
}else {
var url="<%=basePath%>servlet/OfficeServlet?method=addOffice&oname="+oname+"&o_did="+o_did+"&ophone="+ophone+"&oleadername="+oleadername;
window.location = url;
}


}
</script>
  </head>
  
  <body>
  <jsp:include page="/servlet/DepartServlet">
   <jsp:param value="findDepart2" name="method"/>
  </jsp:include>
    <h1 class="h1">设立科室</h1><br><br>
    <form action="servlet/ClassSerclet" method="post">
        科室名称:
        <input class="myInput" type="text" placeholder="请输入科室名" name="oname" id="oname" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br><br>
    科室领导:
        <input class="myInput" type="text" placeholder="请输入领导名" name="oleadername" id="oleadername" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br><br>
   科室电话:
        <input class="myInput" type="text" placeholder="请输入科室电话" name="ophone" id="ophone" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br><br>
   所属院系:
      <select  class="myInput" name="class_did" id="class_did">
      <option value="">请选择所属院系</option>
           <c:forEach items="${findDepart2list}" var="depart">
              <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select><br><br><br><br>
    		&nbsp; &nbsp; &nbsp; &nbsp;    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="addOffice()">添加</button>
       
         
       
    </form> 
  </body>
</html>
