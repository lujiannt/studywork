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
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript" src="../js/jquery-1.3.2.js"></script>
	 
<script type="text/javascript">
function checkPwd() {
	var pwd1 = document.getElementById("pwd1").value;
	var pwd2 = document.getElementById("pwd2").value;
	if(pwd1!=pwd2) {
		alert("两次输入的密码不一样!");
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

function checkForm() {
var flag = false;
var uid = document.getElementById("uid").value;
var uname = document.getElementById("uname").value;
var pwd=document.getElementById("pwd2").value;
var email = document.getElementById("email").value;
var uclass=document.getElementById("uclass").value;
var account=document.getElementById("account").value;
if(uid!="" &&uid!=null&&uname!=""&&uname!=""&&uclass!=null&&uclass!=""&&account!="" &&account!=null&&pwd!="" &&pwd!=null&&email!="" &&email!=null) {
flag = true;
}else {
alert("信息填写不完整!");
}


if(isNaN(uid)){
  flag= false;
  alert("学号格式不正确");
}

//检测是否为邮箱
var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
if(!reg.test(email)) {
    alert("请输入有效的邮箱地址！");
    flag = false;
}

return flag;
}


</script>
</head> 
 
 
 
  <body>
  <jsp:include page="/servlet/DepartServlet">
   <jsp:param value="findDepart2" name="method"/>
  </jsp:include>
  <form action="servlet/ClerkServlet" method="post" onsubmit="return checkForm()">
  <input type="hidden" name="method" value="register">
  <input type="hidden" name="checkstatus" value="0">
   <input type="hidden" name="competence" value="0">
   	 学号:<input id="uid" name="uid" type="text"/><br>
   	 姓名:<input id="uname" name="uname" type="text"/><br>
         请输入您的密码:<input id="pwd1" name="pwd" type="password"/><br>
         请再次输入密码:<input id="pwd2" name="pwd" type="password" onblur="checkPwd()"/><br>
         性别:<input type="radio" name="sex" value="男" checked="checked">男
         <input type="radio" name="sex" value="男">女
         电话:<input id="phone" name="phone" type="text"/><br>
         邮箱:<input id="email" name="email" type="text"/><br>
         所属院系:<select name="class_did" id="depart" onchange="sel(this.value)"><br>
      <option value="" >请选择所属院系</option>
           <c:forEach items="${findDepart2list}" var="depart">
              <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select>
       所属班级:
       <select  id="uclass" name="uclass" onblur="test1()">
          <option value="">请选择所属班级</option>
       </select><br>
      类别:<select id="kind" name="kind">
             <option  value="1">长期工</option>
             <option value="2">临时工</option>v
           </select><br>
     预计工作时间:<input id="worktime" name="worktime" type="text"/><br>
     银行账号:<input id="account" name="account" type="text"/><br>
     <br><input type="submit" value="提交信息">
  </form> 
  </body>
</html>
