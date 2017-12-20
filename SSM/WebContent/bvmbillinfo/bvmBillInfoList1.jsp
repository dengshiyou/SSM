<%@page import="com.fr.web.core.A.s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
   	  //c.add(Calendar.DATE, 1);
   	  String endTime = sdf.format(c.getTime());
   %>
<script type="text/javascript">
var dHeight = 550;
var dWidth = 900;

// 初始化
$(document).ready(function()
{
	openProgress();
	
	
	
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
           width: 80
       },
       {
           field:'createdTimeStr',
           title: '创建时间',
           width: 60
       },
	   {
           field:'memo',
           title: '备注',
           width: 50
       },
       {
	       field:'oid',
		   title: '操作',
		   width:120,
		   formatter:function(value,rowData,rowIndex)
		   {   
               var row = $("#queryTableList").datagrid("getRows");
               var dataRow = row[rowIndex];
		       //var url = "<%=basePath%>jasperReport/jasperReport.jsp?taskId="+dataRow.oid+"&deptId="+"${user.deptId}"+"&file="; 
			   //url += "lsdb_pc/pc_detail_table.jasper";
		       var url = "<%=basePath%>jasperReport/jasperReport.jsp?taskId="+dataRow.oid+"&deptId="+"${user.deptId}"+"&startQueryTime="+dataRow.createdTimeStr+"&file=";
			   var url1 = url+ "mrzjck_pc/pc_detail_table.jasper";
			   
			   var url2 = url +"mrzjck_pc_wb/pc_detail_table.jasper";
		       var str  = "";
			   var taskStatus = rowData.taskStatus;
			   //var startTime = rowData.createdTime.substring(0,10);
			   
			   /*var startTime = new Date(cTime);
			   var nowTime = new Date(getNowFormatDate());
			     */
			   var nowTime = "<%=startTime%>";
			   
			   if(taskStatus==1){
				  str += "<input type=\"button\" class=\"szqx_btn\" title=\"已选机构\" value=\"已选机构\" onclick=\"doSearchNodes("+rowIndex+");\" />&nbsp;";
			    }else{
					 str += "<input type=\"button\" class=\"edit_btn\" title=\"编辑\" value=\"编辑\" onclick=\"doEdit("+rowIndex+");\" />&nbsp;";
					 str += "<input type=\"button\" class=\"szqx_btn\" title=\"设置机构\" value=\"设置机构\" onclick=\"doAddNodes("+rowIndex+");\" />&nbsp;";
					 str += "<input type=\"button\" class=\"delete_btn\" title=\"删除\" value=\"删除\"  onclick=\"doDelete("+rowIndex+");\" />&nbsp;";
					 
				}
				if(dataRow.createdTimeStr==nowTime){
				str += "<input type=\"button\" class=\"px_btn\" style=\"width:65px;\" title=\"下拨配箱\" value=\"下拨配箱\" onclick=\"doPx("+rowIndex+");\" />&nbsp;";
				}
				
				str += "<input type=\"button\" class=\"dyrkd_btn\" style=\"width:120px;\" title=\"配箱明细\" value=\"配箱明细(人民币)\" onclick=\"doPrint('" + url1 + "');\" />&nbsp;&nbsp;";
		   	    str += "<input type=\"button\" class=\"dyrkd_btn\" style=\"width:120px;\" title=\"配箱明细\" value=\"配箱明细(外币)\" onclick=\"doPrint('" + url2 + "');\" />&nbsp;&nbsp;";
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

//查看已选的机构
function doSearchNodes(rowIndex)
{
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
    var URL = "<%=path%>/baseinfo/comutil/ComUtil/getPageInfo?bo.billId="+dataRow.oid+"&bo.billType=wdSelectedLs&bo.startQueryTime="+dataRow.startQueryTime+"&bo.flag=yx";
    window.parent.parent.openDialog(URL,"选择机构",dWidth,490); 	

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

// 新增
function doAdd()
{
	var URL="<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/loadAddBO?bo.billType=1&bo.flag=ls";
	window.parent.parent.openDialog(URL,"新增调拨单申请",600,300,"icon-save","myDialog","auto"); 				 	
}

// 修改
function doEdit(rowIndex)
{
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	var URL="<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/loadUpdateBO?bo.billType=1&bo.oid="+dataRow.oid;
 	window.parent.parent.openDialog(URL,"编辑调拨单申请",600,300,"icon-save","myDialog","auto"); 			
}

// 删除(判断是否有任务，是否有配箱)
function doDelete(rowIndex)
{
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	obj.messageTips = "任务";
	obj.messageTips2 = "删除失败，任务还有配箱数据或已生成任务!";
	obj.url = "<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/deleteBO?bo.oid="+dataRow.oid;
	utilTabDel(obj);
}

// 查看
function doView(rowIndex)
{
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	var URL="<%=path%>/taskinfo/bvmbillinfo/BvmBillInfo/getViewBO?bo.oid="+dataRow.oid;
 	window.parent.parent.openDialog(URL,"调拨单申请详情",dWidth,dHeight,"icon-save","myDialog","auto"); 			
}

function doBatchAdd()
{
	var width1 = getMaxWidth() - 400;
	var height1 = getMaxHeight() - 100;

	if (height1 <500)
	{
		height1 = 500;
	}
	var URL="/bankvault/taskinfo/bvmtaskinfo/BvmTaskInfo/getTemporaryTaskList?bo.taskTempOid=4&bo.dbType=1";
	window.parent.parent.openDialog(URL,"系统内现金调拨新增",width1,height1,"icon-save","myDialog1","auto");

}

//设置机构
function doAddNodes(rowIndex){
	var row = $("#queryTableList").datagrid("getRows");
    var dataRow = row[rowIndex];
	var URL="<%=path%>/baseinfo/comutil/ComUtil/getPageInfo?bo.billId="+dataRow.oid+"&bo.billType=wdTabsLs&bo.startQueryTime="+dataRow.taskStartTime;
	//var URL="<%=path%>/taskinfo/bvmtasknodedetailinfo/BvmTasknodeDetailinfo/getListBO?bo.billId="+dataRow.oid+"&bo.billType=NoSelectedAndSelected";
	window.parent.parent.openDialog(URL,"选择机构",dWidth,460); 		
}

function doPx(rowIndex){
	var row = $("#queryTableList").datagrid("getRows");
	var dataRow = row[rowIndex];
	var URL="<%=path%>/taskinfo/bvmtasknodedetailinfo/BvmTasknodeDetailinfo/loadBillNodes?bo.billCode="+dataRow.oid;
	//var URL="<%=path%>/taskinfo/bvmtasknodedetailinfo/BvmTasknodeDetailinfo/loadDivide?bo.billCode="+dataRow.oid+"&bo.flag=lsdb";
	window.parent.parent.openDialog(URL,"金库配箱",1280,610,"icon-save","myDialogAll","auto");
}

// 金库
//var URL="<%=path%>/taskinfo/bvmtasknodedetailinfo/BvmTasknodeDetailinfo/loadDivide?bo.taskOid="+dataRow.oid + "&bo.taskTempOid=" + dataRow.taskTempOid;
//window.parent.parent.openDialog(URL,"金库配箱",1320,610,"icon-save","myDialogAll","auto");
	
function doViewPx(rowIndex){
	var row = $("#queryTableList").datagrid("getRows");
	var dataRow = row[rowIndex];
	var URL="<%=path%>/taskinfo/bvmtasknodedetailinfo/BvmTasknodeDetailinfo/loadBillNodes2?bo.taskOid="+dataRow.oid;
	window.parent.parent.openDialog(URL,"金库配箱",1280,610,"icon-save","myDialogAll","auto");
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
            <th width="10%">创建日期</th><td width="24%">
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
     <div class="tab_tit" style="border-bottom-width:0;border-top-width:0">
     	<a href="javascript:void(0)" class="batch_add_button ml_16" onClick="doAdd();"><i></i><em>新增</em></a>

     	
     </div>
  </div>
  <table id="queryTableList" ></table> 
  <!-- 列表开始 -->
</div>
</form>
</body>
</html>