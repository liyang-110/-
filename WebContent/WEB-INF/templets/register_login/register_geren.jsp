<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>求职者注册</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/wechat_login.css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script type="text/javascript">
		var cur_path ="<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript" src="/statics/js/reg_register.js" charset="utf-8"></script>

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
						<span style="float:left;">求职者注册</span>
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
					<div id="register_form">
						<div class="switch_login_control">
							<a class="yhdl active" href="/member/accountRegister.do?users=student">求职者号注册<img class="lvxain" style="margin-top:-70px;" src="/static/images/lvxian.png" ></a>
							<a class="wxdl" href="/member/accountRegister.do?users=company">企业注册</a>
							<a class="wxdl" href="/member/accountRegister.do?users=school">高校注册</a>
						</div>
						<div style="clear:both;"></div>
						
						<form class="register-form" name="addform" id="addform" method="post" onsubmit="return false;">
							<input type="hidden" value="reg" name="method" />
						    <input type="hidden" value="student" name="users" />
         					<div class="control-group">
         						<input class="yonghuming" type="text" id="user_contact" name="user_contact" placeholder="输入手机号码" errorcontent="请输入手机号码！"/>
         					</div>
         					<div class="control-group">
         						<input class="yanzhengma" type="text" id="verify_code" name="verify_code" placeholder="输入验证码" errorcontent="请输入验证码！"/>   
       							<a class="verification_code" id="show" href="javascript:void(0);" onclick="sendVerifyCode();">获取验证码</a>
       						</div>
       						<div class="control-group">
       							<input class="yonghuming" type="password" id="user_pass" name="user_pass" placeholder="输入密码" errorcontent="请输入密码！"/>
       						</div>
       						<div class="control-group">
       							<input class="yonghuming" type="password" id="ruser_pass" name="ruser_pass" placeholder="再次输入密码"/>   
       						</div>
       						
       						<div class="control-group">
       							<input  type="checkbox" class="checkbox" checked="checked" id="flag" name="flag" style="position: absolute;"/>
       							<p style="float:left;margin:0 0 2px 20px;">注册即代表同意《211校招网注册协议》</p>
       							<div style="clear:both;"></div>
       							<div><a href="<%=request.getContextPath()%>/file/download.jsp?filename=register.docx"
										target="_blank">下载：211校招网用户协议</a>
								</div>
       							<div style="clear:both;"></div>
       						</div>
       						<div style="clear:both;"></div>
       						<input class="denglu_button" id="register_btn" type="submit" value="同意以上条款并注册">
       						
       						<div style="clear:both;"></div>
       					</form>
       					
					</div>
				</div>
				<!--rigth 结束  -->
				<div class="right">
					<p style="width:294px;text-align:center;margin-top: 20px;">已有211校招网账号?</p>
					
					<span><a class="lijizhuce" href="/member/accountLogin.do?users=${users }" target="_blank">直接登录 →</a></span>
       				<div style="clear:both;"></div>
       				<img style="margin:0 0 20px 77px;" src="/static/images/erweima.png" width="140px" height="140px">
					
					<p style="text-align: center;color: #7d7d7d;">211校招网公众号</p>
				</div>
				<div style="clear:both;"></div>
				
			</div>
			<jsp:include page="include_login/footer.jsp" flush="true"></jsp:include>
		</div>  
	</div> 
</body>
</html>