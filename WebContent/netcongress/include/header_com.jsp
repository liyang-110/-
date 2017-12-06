<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ page import="com.zhaopin.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
HashMapFactory jobfair =new HashMapFactory(jobfairMap,"");
String job_fair_id = (String)jobfair.get("job_fair_id");
UserInterface userI = (UserInterface)request.getAttribute("currentUser");

if( !( userI instanceof ComUserBean ) ){
	response.sendRedirect("/");
}
ComUserBean user = (ComUserBean)userI;
%>
<div class="clearfix">
	<div class="clearfix_top">
    	<div class="pull-left">
          <a href="http://www.211zph.com/" target="_blank"><img class="logo" src="img/logo.png" height="35" width="125"></a>
       </div>
       <div class="pull-right">
          <p class="huiyuan">欢迎会员<span><%=user!=null? user.getUserId():"" %></span>
          <a href="/loginOut.do?method=exitData">退出</a> | <a href="/member/home.do" target="_blank">会员中心</a></p>
       </div>
    </div>   
</div>
<!--logo-->
<div class="menu">
	<ul class="nav nav-pills">
       <li class=""><a href="/netcongress/start.do?id=<%=job_fair_id %>" class="on" >招聘大厅</a></li>
       <% if(request.getAttribute("reserved")!=null){ %>
       <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume" >收到简历</a></li>
       <li><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=result" >面试结果</a></li>
	  <% }else{ %>
       <li><a href="javascript:;" onclick="msg_alert('提示信息','您没有预定本场招聘会','face-sad')" >收到简历</a></li>
       <li><a href="javascript:;" onclick="msg_alert('提示信息','您没有预定本场招聘会','face-sad')" >面试结果</a></li>
	  <% } %>
	   <li><a href="http://www.211zph.com/" target="_blank">返回主页</a></li>
    </ul>
</div>
<!--menu-->
<!--悬浮代码-->
<%--
<div id="rightArrow"><a href="javascript:;" title="快捷操作"></a></div>
<div id="floatDivBoxs">
	<div class="floatDtt">快捷操作</div>
    <div class="floatShadow">
        <ul class="floatDqq">
        	<li style="padding-left:0px;"><a href="/member/home.do" target="_blank"><img src="img/huiyuan.png" align="absmiddle">会员中心</a></li>
            <li style="padding-left:0px;"><a href="/member/jobposted_firm.jsp" target="_blank"><img src="img/jianli.png" align="absmiddle">职位管理</a></li>
            <li style="padding-left:0px;"><a href="javascript:;"  onclick="open_agree_layer();"><img src="img/xuzhi.png" align="absmiddle">参会须知</a></li>
           
            <li style="padding-left:0px;"><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=resume"><img src="img/yitou.png" align="absmiddle">收到简历</a></li>
            <li style="padding-left:0px;"><a href="/netcongress/start.do?id=<%=job_fair_id %>&m=result" ><img src="img/jieguo.png" align="absmiddle">面试结果</a></li>
            <li style="padding-left:0px;">
            	<a href="javascript:;" onclick="IM_kefu('hx_ef10c694600f27536970c2c9246cf051','','211校招网');">
            	<img src="img/qq.png" align="absmiddle">在线客服
            	</a>
            </li>

        </ul>
        <div style="text-align:center;padding:10PX 0 5px 0;background:#EBEBEB;"><img src="img/wap_ico.jpg"><br>微信公众账号</div>

    </div>
    <div class="floatDbg"></div>
</div>
<script type="text/javascript">
var flag=1;
$('#rightArrow').click(function(){
	if(flag==1){
		$("#floatDivBoxs").animate({right: '-115px'},300);
		$(this).animate({right: '-5px'},300);
		$(this).css('background-position','-35px 0');
		flag=0;
	}else{
		$("#floatDivBoxs").animate({right: '0'},300);
		$(this).animate({right: '110px'},300);
		$(this).css('background-position','0px 0');
		flag=1;
	}
});
</script>
--%>
<!--悬浮代码结束-->
<div class="main">
	<p class="text"><%=jobfair.get("job_fair_name") %></p>
</div>
<!-- 在线客服浮动 -->
<div id="codefans_net" style="z-index:1000;position:fixed;bottom:5px;right:5px;/* position:absolute */"> 
	<div style="width:240px;height:100px;position:relative;">
<!--链接地址-->
	<a href="javascript:;" onclick="IM_kefu('hx_ef10c694600f27536970c2c9246cf051','','211校招网');"> 
<!--图片地址-->
		<img src="/static/img/netkefu1.png" border="0"> 
	</a>
	<a class="close" onclick="KeFu.close2();" style="position:absolute;top:0;right:0;">&times;</a>
	</div>
</div>
<script type="text/javascript"> 
var KeFu = {
	x:50,
	y:60,
	xin:true,
	yin:true,
	step:1,
	delay:30,
	obj:null,
	itl:null,
	winHeight:0,
	winWidth:0,
	init:function(){
		this.obj = document.getElementById("codefans_net") ;
		this.itl = setInterval("KeFu.floatdiv()", this.delay);
		
		this.obj.onmouseover=function(){
			clearInterval(KeFu.itl);
		};
		this.obj.onmouseout=function(){
			KeFu.itl=setInterval("KeFu.floatdiv()", KeFu.delay);
		};
	},
	floatdiv:function(){
		var L=T=0 ;
		var R= this.winWidth-this.obj.offsetWidth ;
		var B = this.winHeight-this.obj.offsetHeight ;
		this.obj.style.left = this.x + document.body.scrollLeft ;
		$(this.obj).css({"left":  this.x + document.body.scrollLeft });
		this.obj.style.top = this.y + document.body.scrollTop ;
		$(this.obj).css({"top":  this.y + document.body.scrollTop });
		this.x = this.x + this.step*(this.xin?1:-1) ;
		if (this.x < L) { 
			this.xin = true;
			this.x = L;
		} 
		if (this.x > R){ 
			this.xin = false; 
			this.x = R;
		} 
		this.y = this.y + this.step*(this.yin?1:-1) 
		if (this.y < T) { 
			this.yin = true; 
			this.y = T ;
		} 
		if (this.y > B) { 
			this.yin = false;
			this.y = B ;
		}
	},
	findDimensions:function() //函数：获取尺寸 
	{ 
		//获取窗口宽度 
		if (window.innerWidth) 
			this.winWidth = window.innerWidth; 
		else if ((document.body) && (document.body.clientWidth)) 
			this.winWidth = document.body.clientWidth; 
		//获取窗口高度 
		if (window.innerHeight) 
			this.winHeight = window.innerHeight; 
		else if ((document.body) && (document.body.clientHeight)) 
			this.winHeight = document.body.clientHeight; 
		//通过深入Document内部对body进行检测，获取窗口大小 
		if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) 
		{ 
			this.winHeight = document.documentElement.clientHeight; 
			this.winWidth = document.documentElement.clientWidth; 
		} 
	},
	close:function(){
		clearInterval(KeFu.itl);
		$(this.obj).hide();
	},
	close2:function(){
		$("#codefans_net").hide();
	}
};

// $(function(){
// 	KeFu.findDimensions(); 
// 	KeFu.init();
// 	window.onresize=KeFu.findDimensions; 
// });
</script>