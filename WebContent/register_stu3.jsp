<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<% com.zhaopin.zk.ZkTools.newRegister(request); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title>用户注册-- <%=com.zhaopin.Config.getSiteTitle() %></title>

<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/statics/bootstrap/2.3.2/css/bootstrap-theme.min.css">
<link href="<%=request.getContextPath()%>/statics/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/statics/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
<link href="js/layer/skins/default.css" rel="stylesheet" />
<link rel="stylesheet" href="/statics/css/register_stu1.css" type="text/css"></link>

<script src="/assets/jquery/jquery.min.js"></script>
<style>
.return_btn{
	display:block;
	background:#e03919;
    color: #FFFFFD;
    height: 35px;
    border: none;
    border-radius: 5px;
    width: 176px;
    margin: 0 auto;
    margin-bottom:40px;
    line-height: 35px;
    text-align: center;
    font-family: "微软雅黑";
}
.return_btn:hover{
	color:#fff;
	text-decoration:none;
	background:#c83316;
	cursor:pointer;
}
</style>
</head>
	<body>
	<jsp:include  page="/static/include/header.jsp" flush="true"/>
	<script type="text/javascript">
	   	$("#site_select_btn").hide();
	</script>
    <div class="container">
    <div style="width:1024px; margin:auto;height:40px;">
		<ul class="select_next">
		<li class="next1"><a  href="javascript:;" style="color:#333;">第一步：个人信息</a><div class="next1_div"></div></li>
		<li class="next2"><a  href="javascript:;" >第二步：创建简历</a><div class="next2_div"></div></li>
		<li class="next3"><a  href="javascript:;" style="color:#e03919;">第三步：创建完成</a><div class="next3_div active"></div></li>
		</ul>
    </div>             
    <div style="clear:both;"></div>
    <div style="text-align:center;margin-top:136px;margin-bottom:40px;font-family:'微软雅黑';">
    	<img src="/static/img/text.png" width="36" height="36" style="margin-top:-7px;"></img>
    	<span style="font-size:20px;color: #e03919;">简历创建完成</span></br>
    </div>
    <div style="clear:both;"></div>
    <a href="/student/sCenter.do" class="return_btn" id="show1">返回个人中心</a>
	</div>
    <script type="text/javascript"> 
		var t=3;//设定跳转的时间 
		setInterval("refer()",1000); //启动1秒定时 
		function refer(){  
    	if(t==0){ 
        	location="/student/sCenter.do"; //#设定跳转的链接地址 
    		} 
    	document.getElementById('show1').innerHTML=""+t+"秒后跳转个人中心"; // 显示倒计时 
    	t--; // 计数器递减 
	} 
	</script>  
<jsp:include page="/static/include/footer.jsp" flush="true" />

	<script type="text/javascript" src="statics/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="statics/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	</body>
</html>