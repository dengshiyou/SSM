<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fns" uri="/WEB-INF/fns.tld" %>
<%@taglib prefix="st" uri="/stisp-tags"%>
<%
String path = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<script type="text/javascript">
	var basePath = "<%=path%>";
</script>
<title>金库综合管理系统</title>
<link rel="shortcut icon" href="<%=path%>/resources/images/iframe_img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/index/css/index.css" /> 
<script type="text/javascript" src="<%=path%>/resources/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/commonUtil.js"></script>

<link type="text/css" href="<%=path%>/resources/plugins/indexdh/menu.css" rel="stylesheet" />


<link rel="stylesheet" type="text/css" href="<%=path%>/resources/easyui/themes/ui-cupertino/easyui.css"   />
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/easyui/themes/icon.css"   />
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/easyui/themes/color.css"  />

<script type="text/javascript" src="<%=path%>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/easyuiUtil.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/jquery.helper.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/index.css">
<script type="text/javascript" src="<%=path%>/resources/scripts/Windowtab.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/taskBar.js"></script>
<script type="text/javascript" src="<%=path%>/resources/scripts/windowGroup.js"></script>




<script type="text/javascript">
// 初始化
$(document).ready(function()
{
	 //红色导航
	 $(".jzfp-navbox-dlbox").css("display", "none");          
     $(".menu-jzfp-li-2").hover(function() 
      {
          var XL = $(this).children(".jzfp-navbox-dlbox");
          if (XL.css("display") == "none") 
          {
             XL.show();
          }
          else
          { 					
            XL.hide();
          }
      });
	  
			
	 $(".jzfp-navbox-a").next(".jzfp-navbox-dlbox").hover(function()
	  {
		 if($(this).is(":hidden"))
		 {
			$(this).prev().addClass("jzfp-navbox-hover");
			$(this).show();
		 }
		 else
		 {
			$(this).prev().removeClass("jzfp-navbox-hover"); 
			$(this).hide();
		 }	
	 });

	var $w=$(window).width();
	var $h=$(window).height();

	$(".tab_box").width($w-180-64).parents(".tab_wrapper").css("margin-left","0");
	$(".contentframe").width($w-64-2).css("width","100%");
 	$(".contentframe").height($h-162); 
	 
	//菜单
	winGroup = new $.WindowGroup($('.contentframe')[0], $('.tab_list')[0]);
	desktop = winGroup.createWindow({
		id : 'win_platform',
		title : '',
		close : false,
		min : false,
		fix : true,
		url : basePath+'/Login_mainframe'
	});			
});

$(function(){
//修改了下修改密码功能体验效果
	$(".jzfp-header-grzx").click(function(){
		$(".jzfp-grzxbox").fadeIn();
	});
	
	$(".jzfp-header-grzx").hover(function(){
	},function(){
			$(".jzfp-grzxbox").fadeOut();
	});
	
});
 
/**
* 退出
*/
function doCannel()
{
	$.messager.confirm('提示',"确定退出系统吗?",function(r)
	{ 
		if (r)
		{
			window.location.href = "<%=path%>/Login_cannelLogin"; 	
		}
	}); 
}

// 重写ALERT
$.extend($.messager.defaults, 
{
    ok: '退出',
    cancel: '取消'
});

/**
* 修改密码
*/
function changePassword()
{
	var userId = "${user.userId}";
	var sURL = "<%=path%>/baseinfo/sysuser/SysUser/loadUpdateBO1?bo.userId="+userId;
	openDialog(sURL,"修改密码", 750, 255);
}


function openMenu(id, name, url) 
{
	if(url == "<%=path%>/" )
	{
		url = "<%=path%>/nomenu.jsp";
	}
	
	winGroup.createWindow({
		id : 'win_'+id,
		title : name,
		url : url
  	 });
}

function rtnIndex()
{
	// window.location.href = "<%=path%>/index.jsp"; 	
	$(".tab_list").find(".home").click();
}


 

Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
}


</script>

<style>
.prdtime{color:#fff;margin-top:8px;}
.bank-peo{float:right;margin-right:2%;text-align:center;}
.jzfp-grzx-name i{background-position:-32px -256px;}
.jzfp-grzx-xgmm i{background-position:-80px -336px;}
.jzfp-grzx-tc i{background-position:-64px -352px;}
.jzfp-grzx-name:hover{background-color:#fff;color:#000;}
</style>
</head>
<body>
<!--头部-->
<div class="jzfp-header">
   <img src="<%=path%>/resources/css/index/images/logo-jzfp.png" class="jzfp-header-img"/>	
   <div class="jzfp-header-grzx">
    	<span>个人中心</span>
    	<div class="jzfp-grzxbox">
    		<div class="jzfp-grzx-info jzfp-grzx-name" ><i></i><h1>${user.userName}</h1></div>
    		<div class="jzfp-grzx-info jzfp-grzx-xgmm" onclick="changePassword()">
    			<i></i>
    			<h1>修改密码</h1>
    		</div>
    		<div class="jzfp-grzx-info jzfp-grzx-tc" onclick="doCannel();">
    			<i></i>
    			<h1>退出</h1>
    		</div>
    	</div>
    </div>
    
    <div class="bank-peo">
    	<div class="prdtime">柜员号：${user.loginName}&nbsp;&nbsp;&nbsp;所属机构：${user.deptName} </div>
    	<div class="prdtime bank-time">今天是<script type="text/javascript">var d1 = new Date();document.write(d1.format("yyyy年MM月dd日"));</script>
                    星期<script type="text/javascript">
                    var date = new Date(); 
                    var da = date.getDay();
                    var s="";
                    if(da == 1){s = "一";}else if(da == 2){s = "二";}else if(da == 3){s = "三";}else if(da == 4){s = "四";}
                    else if(da == 5){s = "五";}else if(da == 6){s = "六";}else if(da == 0){s = "日";}
                    document.write(s);
            </script> 
            </div>
    
    </div>
    
 
</div>



<!--导航2 -->
<div id="menu-jzfp-2">
    <ul class="menu-jzfp-2">
  	  <li class="menu-jzfp-li-2">
    		<a href="javascript:void(0)" class="parent-2" id="menu-jzfp-a-2" onclick="rtnIndex()"><span class="menu-icon1-2"><i class="menu-icon-span zxfp-icon1" style="margin-top:7px;background: url(<%=path%>/resources/css/index/images/sy.png) no-repeat;"></i><h1>首页</h1></span></a>
      </li>	
       ${user.menuShowView}
    </ul>
</div>


<!--中间Main-->
<div id="midframe">
	 <div class="tab_wrapper">
	    <div class="tab_box">
	        <ul class="tab_list">
	        </ul>
	    </div> 
	    <div class="mininav">
	        <a href="javascript:void(0)" class="refresh"><i></i><em>刷新</em></a>
	   	    <a href="javascript:void(0)" class="close_all"><i></i><em>关闭全部</em></a>
	    </div>    
	 </div>
	 <div class="contentframe"></div>
</div>
             
<!--底部-->
<div class="jzfp-footer">
	<div class="jzfpbox-footer">
		<a href="http://www.jiciot.com" target="_blank"></a>
		<span> Corpright &copy; 2016  建投物联(江西)股份有限公司 v2.0.986  全国免费服务热线：400-089-1180.  建议您使用兼容浏览器、1600×900以上分辨率浏览。</span>
	</div>
</div>

<!--提示-->
<div style="top:280px;" id="q_Msgbox" class="zeng_msgbox_layer_wrap">
  <span id="mode_tips_v2" style="z-index:10000" class="zeng_msgbox_layer"><span class="gtl_ico_clear"></span>
  <span class="gtl_ico_loading"></span><span id="alert_mag">数据加载中，请稍后...</span><span class="gtl_end"></span></span>
</div>
<div class="zzc"></div>

</body>
</html>
