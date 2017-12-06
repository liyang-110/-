<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>求职者登录</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/wechat_login.css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/service/login.js" charset="utf-8"></script>
<style type="text/css">
	.active{
		color:#02c084;
		border:none;
	}
</style>

</head>
<body >
	<div class="top_bar header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-xs-8 logo">
					<a href="/"><img src="/static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; "></a>
						<span style="float:left;">求职者登录</span>
						<div style="clear:both;"></div>
				</div>

				<jsp:include page="include_login/header.jsp" flush="true"></jsp:include>
			</div>
		</div>
	</div>


	<div class="content">
		<div class="contain">
			<div class="center">
				<div class="left">
					<div>
						<div class="switch_login_control">
							<a class="wxdl active" href="/member/accountLogin.do?users=student">求职者登录<img class="lvxain" style="margin-top:-70px;" src="/static/images/lvxian.png" ></a>
							<a class="yhdl" style="margin-left: 0px;" href="/member/accountLogin.do?users=company">单位登录</a>
						</div>
						<div style="clear:both;"></div>
						
						<form class="login_form">
         					<input class="yonghuming" type="text" name="user_id" placeholder="手机号码/用户名" errorcontent="请输入手机号码/用户名！"/>
         					<input class="mima" type="password" name="user_pass" placeholder="输入密码" errorcontent="请输入密码！"/>   
       						
       						<div class="jizhumima">
       							<label class="checkbox autologin" >
       							<input type="checkbox" name="rememberMe" value="on" value="记住密码">记住密码 
       							</label>
       							
       						</div>
       						
       						<a class="wangjimima" href="/forget.do" target="_blank">忘记密码？</a>
       						
       						<input class="denglu_button" type="submit" value="登录">
       						
       						<span style="color:#a0a0a0;padding: 40px 0 26px 0;display: block;">使用第三方账户登录：
       							<a class="qqdenglu" target="_blank" href="http://www.211zph.com/auth/index.do">
       							<img src="/static/images/qq_icon.png"></a>
       							<a style="margin-left: 10px;" target="_blank" href="http://www.211zph.com/auth/wxLogin.do">
	            				<img src="/auth/img/bt_white_wechat_76X24.png"></a>
       						</span>
       						
       						<div style="clear:both;"></div>
       					</form>
       					<script type="text/javascript">
			  				$(function(){
				  				Login.init();	
			 				 });
						</script>
					</div>
				</div>
				<!--rigth 结束  -->
				<div class="right">
					<p style="width:294px;text-align:center;">还没有211校招网账号?</p>
					
					<span><a class="lijizhuce" href="/member/accountRegister.do?users=student" target="_blank">立即注册 →</a></span>
       				<div style="clear:both;"></div>
       				<img style="margin:0 0 20px 77px;" src="/static/images/erweima.png" width="140px" height="140px">
					
					<p style="text-align: center;color: #7d7d7d;">使用微信二维码快速注册</p>
				</div>
				<div style="clear:both;"></div>
				
			</div>
			<jsp:include page="include_login/footer.jsp" flush="true"></jsp:include>
		</div>
   
	</div> 
</body>
</html>