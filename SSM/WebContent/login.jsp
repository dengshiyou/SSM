<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/includeUtil.jsp" %>
<title>登录</title>
<script type="text/javascript">
	$(function(){
		//console.log("${webUrl}");
		//console.log(basePath);
		//console.log(path);
	});
</script>
</head>
<body>
		<form action="${webUrl}/login.do" method="post">
		<table align="center" style="vertical-align:middle;">
	   		<caption>系统登录</caption>
	   		<tr>
	   			<td><a href="showAllUsers.do">用户</a></td><td><button id="showList">链接到用户列表</button><span></span></td>
			</tr>
	   		<tr>
	   			<td>用户名</td><td><input type="text" name="loginName"/></td>
	   		</tr>
	   		<tr>
	   			<td>密码</td><td><input type="password" name="passWord"/></td>
	   		</tr>
	   		<tr>
	   			<td><input type="submit" value="登录"/></td><td><input type="reset" value="取消"/></td>
	    	</tr>
	    </table>
	    </form>
   
</body>
</html>