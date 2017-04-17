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
line-height: 24px;
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
function updClerk() {


var id=document.getElementById("id").value;
var uid = document.getElementById("uid").value;
var uname = document.getElementById("uname").value;
var sex=document.getElementById("sex").value;
var phone=document.getElementById("phone").value;
var email=document.getElementById("email").value;
var depart=document.getElementById("depart").value;
var uclass=document.getElementById("uclass").value;
var upost=document.getElementById("upost").value;
var worktime=document.getElementById("worktime").value;
var kind=document.getElementById("kind").value;
var account=document.getElementById("account").value;
//判断有没有修改的内容
var id1=document.getElementById("id1").value;
var uid1= document.getElementById("uid1").value;
var uname1 = document.getElementById("uname1").value;
var sex1=document.getElementById("sex1").value;
var phone1=document.getElementById("phone1").value;
var email1=document.getElementById("email1").value;
var depart1=document.getElementById("depart1").value;
var uclass1=document.getElementById("uclass1").value;
var upost1=document.getElementById("upost1").value;
var worktime1=document.getElementById("worktime1").value;
var kind1=document.getElementById("kind1").value;
var account1=document.getElementById("account1").value;
if(id==id1&&uid==uid1&&uname==uname1&&sex==sex1&&phone==phone1&&email==email1&&depart==""&&uclass==""&&upost==""&&worktime==worktime1&&kind==kind1&&account==account1) {
var mes = confirm("您还没有修改任何内容,要继续吗？");
  if(mes) {
    var url="<%=basePath%>servlet/ClerkServlet?method=updClerk&id="+id+"&uid="+uid+"&uname="+uname+"&sex="+sex+"&phone="+phone+"&email="+email+"&depart="+depart1+"&uclass="+uclass1+"&upost="+upost1+"&worktime="+worktime+"&kind="+kind1+"&account="+account1;
    window.location = url;
  }
}else if(depart==""||uclass==""||upost=="") {
alert("请选择新的院系班级和岗位!");
}else {
var url="<%=basePath%>servlet/ClerkServlet?method=updClerk&id="+id+"&uid="+uid+"&uname="+uname+"&sex="+sex+"&phone="+phone+"&email="+email+"&depart="+depart+"&uclass="+uclass+"&upost="+upost+"&worktime="+worktime+"&kind="+kind+"&account="+account;
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
  <jsp:include page="/servlet/OfficeServlet">
   <jsp:param value="findOffice2" name="method"/>
  </jsp:include>
  <jsp:include page="/servlet/PostServlet">
   <jsp:param value="findPost2" name="method"/>
  </jsp:include>
   <%
 	String id = request.getParameter("id");
	String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String dname = request.getParameter("dname");
		String cname = request.getParameter("cname");
		String upost = request.getParameter("upost");
		String worktime = request.getParameter("worktime");
		String kname = request.getParameter("kname");
		String kind = request.getParameter("kind");
		String depart = request.getParameter("depart");
		String uclass = request.getParameter("uclass");
		String account = request.getParameter("account");
  
  
  
  %>
  <h1 class="h1">职工编辑</h1>
<input type="hidden" id="id1" value="<%=id %>">
<input type="hidden" id="uid1" value="<%=uid%>">
<input type="hidden" id="uname1" value="<%=uname %>">
<input type="hidden" id="sex1" value="<%=sex %>">
<input type="hidden" id="phone1" value="<%=phone %>">
<input type="hidden" id="email1" value="<%=email %>">
<input type="hidden" id="depart1" value="<%=depart %>">
<input type="hidden" id="uclass1" value="<%=uclass %>">
<input type="hidden" id="upost1" value="<%=upost %>">
<input type="hidden" id="worktime1" value="<%=worktime %>">
<input type="hidden" id="kind1" value="<%=kind %>">
<input type="hidden" id="account1" value="<%=account %>">
        职工编号:
        <input  class="myInput"  type="text" id="id" name="id" value="<%=id %>" readonly="readonly" id="oid" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br>
        学生学号:
        <input  class="myInput"  type="text" placeholder="请输入学生学号" id="uid" name="uid" value="<%=uid %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;"><br>
        学生姓名:
        <input  class="myInput"  type="text" placeholder="请输入学生姓名" id="uname" name="uname" value="<%=uname %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;"><br>
        学生性别:
        <%if(sex.equals("男")) {%>
           <select class="myInput" id="sex">
             <option value="男">男</option>
             <option  value="女">女</option>
           </select>
        <%}else { %>
       <select class="myInput" id="sex">
             <option  value="女">女</option>
             <option value="男">男</option>
           </select>
        <%} %>
     <br>  联系电话:
	<input class="myInput" type="text" placeholder="请输入岗位电话" id="phone"
		name="phone" value="<%=phone %>"
		style="color:#999999;font-family: 'Open Sans', sans-serif;">
	<br>
     联系邮箱:
        <input  class="myInput"  type="text" placeholder="请输入联系邮箱" id="email" name="phone" value="<%=email %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;"><br>
   原来院系:
        <input  class="myInput"  type="text"  value="<%=dname %>"   readonly="readonly" style="color:#999999;font-family: 'Open Sans', sans-serif;"><br>
 现在院系:
      
         <select  class="myInput"  name="class_did" id="depart" onchange="sel(this.value)">
           <option value="" >请选择新的所属院系</option>
           <c:forEach items="${findDepart2list}" var="depart">
                 <option value="${depart.id}" >${depart.dname}</option>
           </c:forEach>
       </select>
      <br>  原来班级:
        <input  class="myInput"  type="text"   value="<%=cname %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly">
      <br>现在班级:
          <select  class="myInput"   id="uclass">
          <option value="">请选择所属班级</option>
          </select>
     <br>   原来岗位:
        <input type="text"  class="myInput"   value="<%=upost %>"  style="color:#999999;font-family: 'Open Sans', sans-serif;" readonly="readonly"></td>
       <br> 现在岗位:
          <select  class="myInput"  id="upost">
          <option value="">请选择新的所属岗位</option>
            <c:forEach items="${findPost2list}" var="post">
              <option value="${post.pname}" >${post.pname}</option>
           </c:forEach>
          </select>
      
      <br>工作时间:
        <input  class="myInput"  type="text" placeholder="请输入工作的月份" id="worktime" value="<%=worktime %>" name="worktime" id="worktime" style="color:#999999;font-family: 'Open Sans', sans-serif;">
      <br>  所属类别:
        <%if(kname.equals("长期工")) {%>
             <select class="myInput" id="kind">
             <option value="1">长期工</option>
             <option  value="2">临时工</option>
           </select>
        <%} else {%>
             <select class="myInput" id="kind">
             <option  value="2">临时工</option>
             <option value="1">长期工</option>
           </select>
        <%} %>
    <br> 银行账号:
        <input  class="myInput"  type="text" placeholder="请输入支付宝账号" id="account" value="<%=account %>" name="account" id="worktime" style="color:#999999;font-family: 'Open Sans', sans-serif;">
    		<button type="button" class="button gray" onclick="updClerk()">修改</button>
         
       
    </form> 
  </body>
</html>
