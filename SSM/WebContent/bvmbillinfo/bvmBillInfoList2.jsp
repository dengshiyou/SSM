<%@page import="com.fr.web.core.A.s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/app/common/includeUtil.jsp" %>
<title>查询</title>
   <%@ page import="java.util.*"%> 
   <%@ page import="java.text.*"%> 
   <% 
      Calendar c = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //获取系统时间 
   	  String  startTime = sdf.format(c.getTime());
   	  c.add(Calendar.DATE, 1);
   	  String endTime = sdf.format(c.getTime());
   %>
<script type="text/javascript">
var dHeight = 550;
var dWidth = 900;

// 初始化
$(document).ready(function()
{
	openProgress(); // 打开进度条
	initColTables();
	closeProgress(); // 关闭进度条
});

/**
 * 初始化table
 */
function initColTables()
{
	$('#queryTableList').datagrid({
       width: '100%',
       height: getEasyuiHeight(),
       fitColumns: true,
       loadMsg: 'loading',
       url:"<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/getPageInfo?billType=1&flag=ls",
       //yqm 2017.1.10 增加筛选时间
       queryParams: {"startTime":"<%=startTime%>","endTime":"<%=endTime%>" },
       //奇偶行使用不同背景色
       striped: true,
       rownumbers:true,
       columns: [[
       {
           field:'billName',
           title: '任务名称',
           width: 100
       },
       {
           field:'createdTimeStr',
           title: '创建时间',
           width: 100
       },
	   {
           field:'memo',
           title: '备注',
           width: 100
       },
       {
	       field:'oid',
		   title: '操作',
		   width:120,
		   formatter:function(value,rowData,rowIndex)
		   {
		       var str  = "";
			   var taskStatus = rowData.taskStatus;
			  // var cTime = rowData.taskStartTime.substring(0,10);
			   //var startTime = new Date(cTime);
			  // var nowTime = new Date(getNowFormatDate());
			   if(taskStatus==1)
			   {
			   }
			   else
			   {
			     str += "<input type=\"button\" class=\"szqx_btn\" title=\"派工\" value=\"派工\" style=\"width:40px;\"onclick=\"doTask("+rowIndex+");\" />&nbsp;";
			     str += "<input type=\"button\" class=\"ckmx_btn\" title=\"待派工网点\" style=\"width:80px;\" value=\"待派工网点\"  onclick=\"doSearchNode("+rowIndex+");\" />&nbsp;";
			     str += "<input type=\"button\" class=\"szqx_btn\" title=\"自动组线\" value=\"自动组线\" onclick=\"doAutoLine("+rowIndex+");\" />&nbsp;";
			 
				}
		   	   return str;
		   }
       }
      ]],
      //分页组件
      pagination: true,
      onLoadSuccess:function(data)
      {
      	 $('#queryTableList').datagrid('resize');
		 if(data.rows.length==0)
		 {
			var dv2 = $(".datagrid-view2");
			var tab = dv2.children(".datagrid-header").children(".datagrid-header-inner").children();
			dv2.children(".datagrid-body").html("<div style=\'width:"+tab.width()+"px;"+nodataTips);
		 } 
	  }
   });
}

//派工
function doTask(rowIndex)
{
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	var width1 = getMaxWidth() - 400;
	var height1 = getMaxHeight() - 100;

	if (height1 <500)
	{
		height1 = 500;
	}
	var URL="<%=path%>/taskinfo/bvmtaskinfo/BvmTaskInfo/getTemporaryTaskList2?bo.taskTempOid=4&bo.dbType=1&bo.planOid="+dataRow.oid;
	window.parent.parent.openDialog(URL,"临时调拨派工任务新增",width1,height1,"icon-save","myDialog1","auto");
}
//查询待派工网点
function doSearchNode(rowIndex)
{
    var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
    var URL="<%=path%>/baseinfo/comutil/ComUtil/getPageInfo?bo.billId="+dataRow.oid+"&bo.billType=dp&bo.startQueryTime="+dataRow.taskStartTime;
	window.parent.parent.openDialog(URL,"待派工网点",dWidth,430); 		
}

//自动组线
function doAutoLine(rowIndex)
{
    var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	var width1 = getMaxWidth() - 400;
	var height1 = getMaxHeight() - 100;
	if (height1 <500)
	{
		height1 = 500;
	}
   	// var URL="/baseinfo/comutil/ComUtil/getPageInfo?bo.billId="+dataRow.oid+"&bo.billType=dp&bo.startQueryTime="+dataRow.taskStartTime;
    //var URL="/baseinfo/comutil/ComUtil/getPageInfo?bo.billId="+dataRow.oid+"&bo.billType=wdAutoLine&bo.startQueryTime="+dataRow.taskStartTime;
    
    var URL="<%=path%>/taskinfo/bvmtaskinfo/BvmTaskInfo/getTemporaryTaskList3?bo.taskTempOid=4&bo.dbType=1&bo.planOid="+dataRow.oid;
	window.parent.parent.openDialog(URL,"自动组线",width1,height1,"icon-save","myDialog1","auto");
}
function getNowFormatDate() 
{ 
	var day = new Date(); 
	var Year = 0; 
	var Month = 0; 
	var Day = 0; 
	var CurrentDate = ""; 
	//初始化时间 
	Year= day.getFullYear();//ie火狐下都可以 
	Month= day.getMonth()+1; 
	Day = day.getDate(); 
	CurrentDate += Year + "-"; 
	if (Month >= 10 ) 
	{ 
		CurrentDate += Month + "-"; 
	} 
	else 
	{ 
		CurrentDate += "0" + Month + "-"; 
	} 
	if (Day >= 10 ) 
	{ 
		CurrentDate += Day ; 
	} 
	else 
	{ 
		CurrentDate += "0" + Day ; 
	} 
		return CurrentDate; 
}
//查询
function doSearch()
{
    //给表格添加参数
    var queryParams1 = encodeQuery("queryForm");
    $("#queryTableList").data().datagrid.options.queryParams = queryParams1;
    // 查询
    $("#queryTableList").datagrid("load");
}
</script>
</head>
<body>	
<form  id="queryForm" name="queryForm" method="post" >
<div class="tab_wrapper">
   <!-- 查新条件开始 -->
   <div class="tab_table">
      <div class="tab_tit" style="border-top-width:0"><h2>查询条件</h2></div>
      <table width="100%" class="query_table">
           <tr>        
            <th width="10%">执行日期</th><td width="24%">
	         <input type="text"  id="startTime" name="startTime" class="tab_date"  etype="date" style="width:100px;" value="<%=startTime%>" />
	          	至 <input type="text"   id="endTime" name="endTime"  style="width:100px;"  class="tab_date"   etype="date"  value="<%=endTime%>" />
	               
	        </td>
	         <th width="10%">任务名称</th><td width="14%"><input type="text"  id="billName" name="billName" class="tab_text" style="width:120px;"/></td>
	        <td>
	       
	        	<input  type="button"  class="search_btn" value="查询" style="margin-left:5px;" onClick="doSearch()" />
	        	<input  type="button" value="重置" style="margin-left:5px;" class="reset_btn ml_12" />
	        </td>
	     </tr>
      </table>
  </div>
  <!-- 查新条件结束 -->
  
   <!-- 列表开始 -->
   <div class="tab_table" style="border-top-width:0">
     <!--<div class="tab_tit" style="border-bottom-width:0;border-top-width:0">
     	<a href="javascript:void(0)" class="batch_add_button ml_16" onClick="doAdd();"><i></i><em>新增</em></a>

     	
     </div> -->
     <div class="tab_tit" style="border-bottom-width:0;border-top-width:0">
       <h3 style="margin-left:16px;">任务信息列表</h3>
     </div>
  </div>
  <table id="queryTableList" ></table> 
  <!-- 列表开始 -->
</div>
</form>
</body>
</html>