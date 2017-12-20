<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<script type="text/javascript" src="<%=path%>/resources/scripts/jquery-1.11.1.min.js"></script>
<link href="<%=path%>/resources/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/easyui/themes/icon.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/easyuiUtil.js"></script>
<title></title>
<script type="text/javascript">

function doSearch()
{
	$("#rightIFrame").contents().find(".search_btn").click();
}

</script>
</head>
<body class="easyui-layout"   scroll="no" >
   <!--  主界面 -->
   <div id="mainPanle" region="center">
     <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
	  	 <div title="附加明日出库" >
           <iframe id="rightIFrame" name="rightIFrame" width="100%" height="100%" style="float:left;" scrolling="auto"  frameborder="0"  src="<%=path%>/app/taskinfo/bvmbillinfo/bvmBillInfoList.jsp"></iframe>
         </div>
     </div>  
   </div>
</body>

<span style="display:none;">
     <input  type="button"  class="search_btn" value="查找" style="margin-left:5px;" onClick="doSearch()" />
</span>

</html>
