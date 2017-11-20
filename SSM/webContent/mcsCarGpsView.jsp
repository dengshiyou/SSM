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
		       <th>车辆位置数据oid：</th>
		        <td>
		      	   ${bo.carGpsDataOid}
			   </td>
		       <th>设备编号：</th>
		        <td>
		      	   ${bo.deviceNo}
			   </td>
			</tr>
            <tr>
		       <th>车辆oid：</th>
		        <td>
		      	   ${bo.carOid}
			   </td>
		       <th>车牌号：</th>
		        <td>
		      	   ${bo.carNo}
			   </td>
			</tr>
            <tr>
		       <th>纬度：</th>
		        <td>
		      	   ${bo.latitude}
			   </td>
		       <th>纬度半球：N 北玮 S 南玮：</th>
		        <td>
		      	   ${bo.nsInd}
			   </td>
			</tr>
            <tr>
		       <th>经度：</th>
		        <td>
		      	   ${bo.longitude}
			   </td>
		       <th>经度半球：E 东经 W 西经：</th>
		        <td>
		      	   ${bo.ewInd}
			   </td>
			</tr>
            <tr>
		       <th>地面速率：000.0~999.9节：</th>
		        <td>
		      	   ${bo.speed}
			   </td>
		       <th>地面航向：000.0~359.9度，以真北方为参考基准：</th>
		        <td>
		      	   ${bo.course}
			   </td>
			</tr>
            <tr>
		       <th>模式指示：A 自主定位 D 差分 E 估算 N 数据无效：</th>
		        <td>
		      	   ${bo.gpsMode}
			   </td>
		       <th>UTC日期：</th>
		        <td>
		      	   ${bo.utcDate}
			   </td>
			</tr>
            <tr>
		       <th>UTC时间：</th>
		        <td>
		      	   ${bo.utcTime}
			   </td>
		       <th>GPS时间：</th>
		        <td>
		      	   ${bo.gpsTime}
			   </td>
			</tr>
            <tr>
		       <th>备用字段1：</th>
		        <td>
		      	   ${bo.backCol1}
			   </td>
		       <th>备用字段2：</th>
		        <td>
		      	   ${bo.backCol2}
			   </td>
			</tr>
		 </table>
		 </table>
	</div>
  </div>
	
</form> 
</body>
</html>



