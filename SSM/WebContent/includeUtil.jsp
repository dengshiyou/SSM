<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- js文件 -->
<script src="${jsPath}/jquery-3.0.0.min.js" ></script> 

<!-- jbox插件 -->
<script src="${webUrl}/resources/Source/jBox.js" ></script> 
<script src="${webUrl}/resources/Source/jBox.min.js" ></script>
<link type="text/css" rel="stylesheet" href="${webUrl}/resources/Source/jBox.css"/>  

<!-- 公共常量 -->
<script>
	//绝对路径	
	var basePath = "<%=basePath %>";
	//相对路径
	var path = "<%=path%>";
</script>