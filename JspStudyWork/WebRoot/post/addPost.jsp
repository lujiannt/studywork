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
function addPost() {

var pname=document.getElementById("pname").value;
var pleadername = document.getElementById("pleadername").value;
var pleaderphone = document.getElementById("pleaderphone").value;
var pcount=document.getElementById("pcount").value;
var p_oid=document.getElementById("class_did").value;
var pcount2 = document.getElementById("pcount2").value;
var kind = document.getElementById("kind").value;

if(pname==""||pname==null){
alert("请输入岗位名!");
}else if(p_oid==""||p_oid==null) {
alert("请选择岗位所属的科室!");
}else if(isNaN(pcount) || isNaN(pcount2)) {
alert("岗位人数应该是数字!");
}else {
var url="<%=basePath%>servlet/PostServlet?method=addPost&pname="+pname+"&pleadername="+pleadername+"&pleaderphone="+pleaderphone+"&p_oid="+p_oid+"&pcount="+pcount+"&pcount2="+pcount2+"&kind="+kind;
window.location = url;
}


}
</script>
  </head>
  
  <body>
  <jsp:include page="/servlet/OfficeServlet">
   <jsp:param value="findOffice2" name="method"/>
  </jsp:include>
    <h1 class="h1">发布岗位</h1>
        岗位名称:
        <input class="myInput" type="text" placeholder="请输入岗位名" name="pname" id="pname" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
       岗位领导:
       <input class="myInput" type="text" placeholder="请输入岗位领导名" name="pleadername" id="pleadername" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        岗位电话:
        <input class="myInput" type="text" placeholder="请输入岗位电话" name="pleaderphone" id="pleaderphone" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        岗位人数:
        <input class="myInput" type="text" placeholder="请输入岗位人数" name="pcount" id="pcount" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        最大人数:
        <input class="myInput" type="text" placeholder="请输入最大岗位人数" name="pcount2" id="pcount2" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        所属科室:
      <select class="myInput" name="class_did" id="class_did">
      <option value="">请选择所属科室</option>
           <c:forEach items="${findOffice2list}" var="office">
              <option value="${office.oid}" >${office.oname}</option>
           </c:forEach>
       </select><br><br>
      所属类别:
             <select class="myInput"  id="kind" name="kind">
             <option  value="1">长期</option>
             <option value="2" selected="selected">临时</option>
           </select><br><br>
    		&nbsp; &nbsp; &nbsp; &nbsp;    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="addPost()">添加</button>
  </body>
</html>
