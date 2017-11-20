<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/app/common/includeUtil.jsp" %>
<title></title>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<% 
	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DATE, 1);
	String datetime = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
%>
<script type="text/javascript">
var oid = "";
var pathUrl = "";
var messageTips = "";
var billType = "${billType}";
var dHeight = 400;
var dWidth = 650;
$(document).ready(function()
{	
	openProgress(); // 打开进度条
	enterTab("pageForm");
	$.ajaxSetup({
        async: false
    });
    $('.validatebox-text').bind('blur', function(){
		$(this).validatebox('enableValidation').validatebox('validate');
	});
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
// 新增或者修改
function doAdd()
{
	// 校验
	var isFlag = $("#pageForm").form("validate");
	if(!isFlag)
	{
		return;
	}
    doAddOpt();
}

// 保存
function doAddOpt()
{
	var obj = {};
	obj.messageTips = "调拨单申请";
	obj.messageTips2 = "你所在机构不是金库，不能新增调拨单！";
	obj.oid = oid; 
	obj.isback = 1;
	obj.url = "<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/addBO"; // 路径
	obj.para1 = encodeURIPara1($("#pageForm").serialize()); // 参数
	utilTabAdd(obj); 
}

function doAddCallBack(res)
{
	var msg1 = "保存调拨单申请成功！";
	if (isOptEdit(oid))
	{
		msg1 = "编辑调拨单申请成功！";
	}
	alertSuccessLayler(msg1);
	doAfterEmpOpt();
}

</script>
</head>
<body class="bg_fff">
<form  id="pageForm" name="pageForm" method="post" >
<input type="hidden" id="oid"  name="oid" value="${bo.oid}"   />
<c:if test="${! empty billType}"><input type="hidden" name="billType" value="${billType}" /></c:if>
  <div class="tab_wrapper">
 	 <div class="tab_table">
      <table width="100%" class="layout_table" id="table1">
            <c:if test="${bo.flag != 'ls' }">
            <tr>
		       <th style="width:120px;"><label class="red">*</label>执行日期：</th>
		       <td>
	   			   <input type="text"  style="width:150px; background:#fbfeff url(<%=path%>/resources/images/iframe_img/new_sales_date_icon_11.png) no-repeat right center; "
		      	         id="taskStartTime" name="taskStartTime"  class="tab_date" etype="date"  required="true"
		      	         <c:if test="${! empty bo.taskStartTime}">value="${bo.taskStartTime}"</c:if>
		      	         <c:if test="${empty bo.taskStartTime}">value="<%=datetime%>"</c:if>
		      	         onfocus="new WdatePicker({minDate:'%y-%M-{%d+1}',readOnly:true})" 
		      	         />
			   </td>
			</tr>
			</c:if>
            <tr>
		       <th><label class="red">*</label>任务名称：</th>
		       <td>
	               <input type="text" style="width:150px;" id="billName" name="billName" value="${bo.billName}"   maxlength="100" 
		      	         class="easyui-validatebox"   required="true"/>
			   </td>
			</tr>
            <tr>
		       <th>备注：</th>
		       <td>
		      	   <textarea name="memo" id="memo" style="width:300px;">${bo.memo }</textarea>
			   </td>
			</tr>
		 </table>
	</div>
  </div>
	
  <div class="opration_wrapper">
	  <input type="button" class="layer_search_btn mr_21" value="保存" onclick="doAdd();" />
	  <input type="button" class="layer_cancel_btn" value="取消"  />
  </div> 
  
  
</form> 
</body>
</html>



