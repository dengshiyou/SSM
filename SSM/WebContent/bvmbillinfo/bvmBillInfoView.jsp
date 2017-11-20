<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/app/common/includeUtil.jsp" %>
<title></title>
<script type="text/javascript">
var oid = "";
var pathUrl = "";
var messageTips = "";

$(document).ready(function()
{	
	openProgress(); // 打开进度条
	enterTab("pageForm");
	initUptData();
	closeProgress(); // 关闭进度条
});

// 修改还原参数
function initUptData()
{
	oid = "${bo.oid}";
	if (isOptEdit(oid))
	{
		// 修改
		 
	}
}	

</script>
</head>
<body class="bg_fff">
<form  id="pageForm" name="pageForm" method="post" >
<input type="hidden" id="oid"  name="oid" value="${bo.oid}"   />
  <div class="tab_wrapper">
 	 <div class="tab_table">
      <table width="100%" class="detail_table">
            <tr>
		       <th>开始时间：</th>
		        <td>
		      	   ${bo.taskStartTime}
			   </td>
			</tr>
            <tr>
		       <th>调拨单名称：</th>
		        <td>
		      	   ${bo.billName}
			   </td>
			</tr>
            <tr>
		       <th>备注：</th>
		        <td>
		      	   ${bo.memo}
			   </td>
			</tr>
		 </table>
		 </table>
	</div>
  </div>
	
</form> 
</body>
</html>



