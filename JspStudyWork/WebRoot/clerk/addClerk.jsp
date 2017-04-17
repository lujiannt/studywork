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

.h3 {
	color: #7A7A7A;
}

.button{
width: 100px;
line-height: 30px;
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


body {
color:#3B3B3B;

}
button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}
.myInput{height:34px;width:280px}
</style>
<script type="text/javascript">
function addClerk() {
var uid = document.getElementById("uid").value;
var uname = document.getElementById("uname").value;
var sex=document.getElementById("sex").value;
var phone=document.getElementById("phone").value;
var depart=document.getElementById("depart").value;
var uclass=document.getElementById("uclass").value;
var upost=document.getElementById("upost").value;
var worktime=document.getElementById("worktime").value;
var kind=document.getElementById("kind").value;
var account=document.getElementById("account").value;


//检测是否为邮箱
var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;

if(upost==""||upost==null){
alert("请选择岗位!");
}else if(uname==""||uname==null) {
alert("请输入学生的姓名!");
}else if(uid==""||uid==null) {
alert("请输入学生的学号!");
}else if(account==""||account==null) {
alert("请输入学生的支付宝账号!");
}else if(isNaN(uid)) {
alert("学号应该是数字");
}else if(isNaN(worktime)){
alert("月份应该是数字");
}else {
var url="<%=basePath%>servlet/ClerkServlet?method=addClerk&uid="+uid+"&uname="+uname+"&sex="+sex+"&phone="+phone+"&depart="+depart+"&uclass="+uclass+"&upost="+upost+"&worktime="+worktime+"&kind="+kind+"&account="+account;
window.location = url;
}


}

//ajax联动菜单查出院系里面的班级
function sel(v) {
var xhr = getXhr();
xhr.open("get","servlet/AjaxServlet?method=ajax&id="+v,true);
xhr.onreadystatechange = function (){
  if(xhr.readyState == 4 && xhr.status == 200){
  //从后台传来一个字符串， id1,name1;id2,name2
      var strs = xhr.responseText;
      //根据;将传来的字符串分割成数组 
      strs = strs.split(";");
	  var s2 = document.getElementById("uclass");
	  var k =0;
      for(var i=0;i<strs.length;i++) {
      //根据,将上面所分割的数组分别一个个再次按照,分割成数组 {id name}
         var str = strs[i].split(",");
       //创建新的option  
		 var opt = new Option(str[1],str[0]);
		 s2.options[i+1] = opt;
		 k++;
      }
      s2.options.length=k+1;
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
   <jsp:include page="/servlet/PostServlet">
   <jsp:param value="findPost2" name="method"/>
  </jsp:include>
    <h1 class="h3">添加勤工学生</h3>
    <form action="servlet/ClassSerclet" method="post">
        学生学号:
        <input class="myInput" type="text" placeholder="请输入学生学号" name="uid" id="uid" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        学生姓名:
        <input class="myInput" type="text" placeholder="请输入学生姓名" name="uname" id="uname" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
        学生性别:
        <input type="radio" name="sex" id="sex" value="男" checked="checked"><font style="color:#999999;font-family: 'Open Sans', sans-serif;">男</font>
             <input type="radio" name="sex" id="sex" value="女"><font style="color:#999999;font-family: 'Open Sans', sans-serif;">女</font><br><br>
        学生电话:
       <input class="myInput" type="text" placeholder="请输入学生电话" name="phone" id="phone" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
    <!--  邮箱地址:
     <input class="myInput" type="text" placeholder="请输入邮箱地址" name="email" id="email" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br> -->
    所属院系:
      <select  class="myInput" name="class_did" id="depart" onchange="sel(this.value)">
      <option value=""   style="color:">请选择院系</option>
           <c:forEach items="${findDepart2list}" var="depart">
              <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select><br><br>  
     所属班级:
         <select class="myInput" id="uclass">
          <option value="">请选择班级</option>
       </select><br><br>
     
      工作时间:
      <input class="myInput" type="text" placeholder="请输入工作的月份" name="worktime" id="worktime" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
     
    
    所属类别:
     <select class="myInput" id="kind">
             <option  value="1">长期工</option>
             <option value="2">临时工</option>
           </select><br><br>   
      分配岗位:
      <select class="myInput" name="class_did" id="upost">
      <option value="" >请选择所属岗位</option>
           <c:forEach items="${findPost2list}" var="post">
              <option value="${post.pname}"  >${post.pname}</option>
           </c:forEach>
       </select><br><br>
        银行账号: <input class="myInput" type="text" placeholder="请输入支付宝账号" name="account" id="account" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br><br>
    		&nbsp; &nbsp; &nbsp; &nbsp;    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="button gray" onclick="addClerk()">添加</button>
       
         
       
    </form> 
  </body>
</html>
