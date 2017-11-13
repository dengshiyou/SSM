<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/includeUtil.jsp" %>
<title>查询</title>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
		 $.post("${webUrl}/searchUsers.do",{"loginName":"dsy","name":"邓世友","userType":"1","userId":"1"},function(data){
			console.table(data);
		},"json"); 
			/* $.ajax({
				type:"post",
				url:"${webUrl}/searchUsers.do",
				data:{"loginName":"丽"},
				//dataType:"json",
				//async:false,
				contentType:"application/x-www-form-urlencoded;charset=UTF-8",
				beforeSend:function () {
		           console.log("正在保存数据，请稍候！");
				},
				success:function(e){
					console.log(e);
					if(e == "-1"){
						alert(111);
					}else{
						console.table(e);
					}
				
				},
				error: function (returndata) {
					alert(222);
		       	}
			}); */
		});
	/* 	$("#jbox").click(function(){
			var info = 'jQuery jBox<br /><br />版本：v2.0<br />日期：2011-7-24<br />';  
			info += '官网：<a target="_blank" href="http://kudystudio.com/jbox">http://kudystudio.com/jbox</a>';  
			$.jBox.info(info); 
		}); */
		$("#jbox").on('click',function(){
			
		});
		
	});

</script>
</head>
<body>
	<div>
		<div id="results"> </div>
		<input type="button" id="submit" value="点击1">
		<input type="button" id="jbox" value="点击2">
		<input type="text" name="name" id="name">
	</div>
	<div>
		<button class="b">鼠标悬浮</button>    
	    <button class="a">点击打开</button>    
	    <button class="e">打开确认框</button>    
	    <button class="c">点击关闭</button>    
	    <button class="d">鼠标跟随</button>    
	    <button class="div3">这里是标题...</button>    
	    <button class="div4">这里是内容...</button>    
	    <button class="div5">通知...</button>    
	    <button class="div1">提示</button>    
	    <button class="div2">提示放在这里</button> 
	    <div id="myModal">Click me to open a modal window!</div>
	    
	    <span class="tooltip" title="My first tooltip">Hover me!</span>
		<span class="tooltip" title="My second tooltip">Hover me!</span>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		 //模态    
        var myModel = new jBox('Modal', {    
            attach: $('.b'),    
            trigger: 'mouseover',//click改成mouseover    
            title:  $('.div3'),//可以省略    
            content: $('.div4'),    
            animation: 'flip',    
            /*ajax: {    
                url: '/servlet/AQ?sysNum=14464304598886414&s=kl',    
                reload: true,    
                success: function(data) {    
    
                }    
            },    
            spinner: 'true',*/    
            onOpen: function(data) {    
                this.setContent('jBox is opening…');    
            },    
            onClose: function() {    
                this.setContent('jBox is closing…');    
            },    
        });    
    
        //打开    
        $('.a').on('click', function() {    
            myModel.open();    
        });    
    
        //提示    
        var myModel2 = new jBox('Tooltip', {    
            attach: $('.div2'),    
            trigger: 'click',    
            content: '123123123123<br>wqe<b class="aa">dsfsddsf</b>wqewqewq',    
            target: $('.c'),    
            position: {    
                x: 'left',//控制tip在target的相对位置    
                y: 'top',//也可以使用数字(最好不用，要不然会固定不动)    
            },    
            offset: {//控制相对位置    
                x: -40,    
                y: -20,    
            },    
            outside: 'x',//'y'/'xy'//控制箭头的指向(要和position配合才能生效)    
            pointer: 'center: 5',//控制箭头的位置    
            animation: 'flip',//弹出的动画效果    
            zIndex: 10001,    
            delayOpen: 1000,    
            delayClose: 1000,    
            draggable: $('.aa'),//可以是true/title    
        });    
    
        //提示    
        var myModel4 = new jBox('Tooltip', {    
            attach: $('.div2'),    
            content: 'wwwwwwwwwwwwwww',    
            target: $('.c'),    
            position: {    
                x: 'left',//控制tip在target的相对位置    
                y: 'top',//也可以使用数字(最好不用，要不然会固定不动)    
            },    
            outside: 'y',//'y'/'xy'//控制箭头的指向    
            pointer: 'center: 15',//控制箭头的位置    
            animation: 'flip',//弹出的动画效果    
        });    
    
        //鼠标跟随    
        var myModel3 = new jBox('Mouse', {    
            attach: $('.d'),    
            content: '12321421421421421',    
            addClass: 'add',    
        });    
    
        //确认框    
        var myModel5 = new jBox('Confirm', {    
            title: 'qwewq',    
            confirmButton: '12321',    
            confirm: function() {    
                //console.log(1);    
            }    
        });    
        $('.e').on('click', function() {    
            myModel5.open();    
            demoNoticeDefault();    
        });    
    
        //提示    
        var myModel6 = new jBox('Tooltip', {    
            attach: $('.div2'),    
            trigger: 'click',    
            content: '123123123123<br>wqe<b class="bb">dsfsddsf</b>wqewqewq',    
            target: $('.c'),    
            draggable: $('.bb'),//可以是true/title    
    
        });    
    
        function demoNoticeDefault() {    
            new jBox('Notice', {    
                content: 'here!'    
            });    
        } 
		
        $('.tooltip').jBox('Tooltip');
        new jBox('Modal', {
            width: 300,
            height: 200,
            attach: $('#myModal'),
            title: 'My Modal Window',
            content: '<i>Hello there!</i>'
        });
	});
	
	
</script>

</html>