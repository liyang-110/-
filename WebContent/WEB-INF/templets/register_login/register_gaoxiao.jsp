<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>高校注册</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/wechat_login.css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/statics/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
	
<!-- 	<script type="text/javascript" src="/statics/js/yonghu_register.js" charset="utf-8"></script>
 -->	
<style type="text/css">
	.active{
		color:#02c084;
		border:none;
	}
</style>
<script type="text/javascript">

function msg_alert(title,msg,icon)
{
	var content='<div style="max-width:260px;">'+msg+'</div>';

		art.dialog({
			title: title , // '提示信息',
			content: content,
			icon: icon, // 'face-smile',
			fixed: true,
			lock:false,
			id:'alert',
			time: 10,
			ok: function(){
					this.close();
				}
		});
}
function sendVerifyCode(){
	var mobile=$("#user_contact").val();
	
	if(mobile==''){
		msg_alert('提示信息','请输入手机号！','warning');
		return null;
	}else{
		if(!(/^1[0-9]{10}$/.test(mobile))){ 
			msg_alert('提示信息','请输入正确的手机号！','warning');
		    return null; 
		} 
	}
		$.ajax({
	        url: "/member/getVerifyCode.do",
	        data:{mobile:mobile},
	        type: "post",
	        dataType: "text",
	        success: function(data) {
	            if (!data) return;
	            if(data=='no'){
	            	msg_alert('提示信息','请输入正确的手机号！','warning');
	            	return null;
	            }
	            return;
	        },
		contentType:"application/x-www-form-urlencoded; charset=utf-8"
	    });
	}

$(function(){
$(".denglu_button").click(function(){
	$.ajax({
        url: "/member/accountRegister.do",
        data:$(".register-form").serialize(),
        type: "post",
        dataType: "text",
        success: function(data) {
            if (!data) return;
            
            if( data =='-1'){
            	msg_alert('提示信息','手机号格式错误!','error');
            }else if(data =='-2'){
            	msg_alert('提示信息','用户存在!','error');
            }else if(data =='-3'){
            	msg_alert('提示信息','验证码错误!','error');
            }else if(data =='-4'){
            	msg_alert('提示信息','注册失败!','error');
            }else if(data =='11'){
            	//msg_alert('提示信息','学生注册成功!','succeed');
            	window.location.href="/student/stuResume.do";
            }else if(data =='22'){
            	//msg_alert('提示信息','企业注册成功!','succeed');
            	window.location.href="/member/home.do";
            }else if(data =='33'){
            	//msg_alert('提示信息','学校注册成功!','succeed');
            	window.location.href="/member/home.do";
            }else if(data =='-0'){
            	msg_alert('提示信息','系统错误!','error');
            }
            return;
        },
	contentType:"application/x-www-form-urlencoded; charset=utf-8"
    });
	});
});
</script>
</head>
<body >
	<div class="top_bar header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-4 col-xs-8 logo">
					<a href="/"><img src="/static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; "></a>
						<span style="float:left;">高校注册</span>
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
							<a class="yhdl" href="/member/accountRegister.do?users=student">求职者号注册</a>
							<a class="wxdl" href="/member/accountRegister.do?users=company">企业注册</a>
							<a class="wxdl active" href="/member/accountRegister.do?users=school">高校注册<img class="lvxain" style="margin-top:-70px;" src="/static/images/lvxian.png" ></a>
						</div>
						<div style="clear:both;"></div>
						<div class="g_main">
							<p>211校招网（http:/www.211zph.com），</p>
							<p>专注服务大学生就业，</p>
							<p>院校/机构注册，</p>
							<p class="g_dh">请拨打电话<span>029-88662468</span>与我们联系。</p>
						</div>
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