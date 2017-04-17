<%@page import="com.entity.Clerk"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<script src="../js/kit.js"></script>
		<!--[if IE]>
		<script src="js/ieFix.js"></script>
		<![endif]-->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-30210234-1']);
			_gaq.push(['_trackPageview']);
			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
         function changeKind_idValue() {
         var value=document.getElementById();
         
         } 
		</script>
		<script src="../js/dom.js"></script>
		<script src="../js/form.js"></script>
		<link rel="stylesheet" href="../css/css.css" />
		<link rel="stylesheet" href="../css/login.css" />
		<link rel="stylesheet" href="../css/validator.css" />
		<!--validator-->
		<script src="../js/validator.js"></script>
		<script src="../js/autowired.validator.js"></script>
		<style>
			table td {
				font-size: 14px;
			}
			label {
				cursor: pointer;
				margin-right: 1em;
			}
		</style>
	</head>
	<body>
	<%
	String dno=request.getParameter("dno");
	String dname=request.getParameter("dname");
	String dleader=request.getParameter("dleader");
	String dphone=request.getParameter("dphone");
	String dkind=request.getParameter("dkind_name");
	
	 %>
		<div id="regist-main">
		<h1>修改院系信息</h1>
			<form id="registForm" action="../servlet/DepartServlet" method="get" onsubmit="">
			<input type="hidden" name="method" value="updDepart"/>
			<input type="hidden" name="dno" value="<%=dno %>"/>
				<ol>
					<li>
						<label for="Email">院系编号：
						<span class="kitjs-validator" for="@dno" rules="[{notNull:true, message:'院系编号不能为空'}]"></span>
						</label>
						<span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
						<input id="Email" name="dno1" type="text" style="color:#999999;font-family: 'Open Sans', sans-serif;" value="<%=dno %>" disabled="disabled"/>
					</li>
					<li>
						<label for="UserName">院系名称：
						<span class="kitjs-validator" for="@dname" rules="[{notNull:true, message:'院系名称不能为空'}]"></span>
						</label>
						<span class="field-validation-valid" data-valmsg-for="UserName" data-valmsg-replace="true"></span>
						<input id="UserName" name="dname" type="text" style="color:#999999;font-family: 'Open Sans', sans-serif;" value="<%=dname %>"/>
					</li>
					<li>
						<label for="Password">联系电话：
						<span class="kitjs-validator" for="@dphone" rules="[{notNull:true, message:'电话不能为空'},{minLength:'8',message:'电话长度最少为8位'}]"></span>
						</label>
						<span class="field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
						<input id="Password" name="dphone" type="text" style="color:#999999;font-family: 'Open Sans', sans-serif;" value="<%=dphone %>"/>
					</li>
					<li>
						<label for="Password">院系领导：
						<span class="kitjs-validator" for="@dleader" rules="[{notNull:true, message:'领导名不能为空'}]"></span>
						</label>
						<span class="field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
						<input id="Password" name="dleader" type="text" style="color:#999999;font-family: 'Open Sans', sans-serif;" value="<%=dleader %>"/>
					</li>
					<li>
					<label for="Email">院系类别：</label>
					  <select name="dkind_id">
					  <%if(dkind.equals("理科")) {%>
                              <option value="4">理科</option>
                              <option value="3">文科</option>
					  <%}else if(dkind.equals("文科")) {%>
                              <option value="3">文科</option>
                              <option value="4">理科</option>
					  <%} %>
                         </select> 
					</li>
				</ol>
				<div class="registError"></div>
				
				<input type="submit" value="确认修改" class="btn-submit"/>
		    <span><%="    " %>              ${msg}</span>
			</form>
		</div>
		
	</body>
</html>