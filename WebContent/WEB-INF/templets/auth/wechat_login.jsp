<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>微信登录</title>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/wechat_login.css">
     <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">

</head>
<body >
<div class="top_bar">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-4 col-xs-8 logo">
<img src="/static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; ">
<span style="float:left;">微信登录</span>
<div style="clear:both;"></div>
</div>

<div class="col-lg-9 col-md-8 col-xs-4 logo text-right"><a href="http://www.211zph.com/" class="btn-block" style="color:#fff;">返回首页<i class="fa fa-angle-double-right"></i></a>

</div>

</div>
</div>
</div>


<div class="content">
   <div class="container options" style="background:#fff; padding:30px 0px 40px 0px; border:1px solid #d1d1d1;" >
        <div class="row" >
            <img src="${wxUser.headimgurl }" width="120" alt="图片" class="img-responsive img-circle wechat_img center-block" style="border:2px solid #eeeeee;">
        </div>
        <div class="row text-center wechat_name"><h4>${wxUser.nickname }</h4></div>
       	 <!-- 
        <div class="row text-center" style="color:#a5a5a5; font-size:15px;"><p>为了更好地为您服务，请关联一个211校招网账号。</p></div>
        
        <div class="row">
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
            <div class="col-lg-4 col-md-4 col-xs-10 text-left"><h5 style="font-size:15px;margin:20px 0px 20px 0px;">已有211校招网账号？</h5></div>
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
         </div>
         --> 
<form class="login_form">
		<div class="row">
			<div class=" col-lg-4 col-md-4 col-xs-1"></div>
					<div class="form-horizontal col-lg-4 col-md-4 col-xs-10 ">
						<div class="form-group">
							<label class="col-sm-3 control-label">账号</label>
							<div class="col-sm-9">
								<input type="text"  name="username" class="form-control" placeholder="请输入登录手机号或用户名">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">密码</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control"
									placeholder="请输入您的密码">
							</div>
						</div>

					</div>
		</div>
        <div class="row">
           <div class="col-lg-4 col-md-4 col-xs-1"></div>
            <div class="col-lg-4 col-md-4 col-xs-10"><button class="btn btn-success btn-block btn-lg" style="font-size:15px;">关联已有账号</button></div>
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
        </div> 
</form>

     	<div class="row">
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
            <div class="col-lg-4 col-md-4 col-xs-10 text-left"><h5 style="font-size:16px;margin:40px 0px 20px 0px;">还没有211校招网帐号？</h5></div>
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
         </div>
        <div class="row">
           <div class="col-lg-4 col-md-4 col-xs-1"></div>
            <div class="col-lg-4 col-md-4 col-xs-10"><a href="http://www.211zph.com/register.jsp" class="btn btn-default btn-block btn-lg" style="font-size:16px;" >注册新帐号</a></div>
            <div class="col-lg-4 col-md-4 col-xs-1"></div>
        </div> 
      
</div>
</div> 

<!--<div class="footer">
<div class="container">

<div class="row">

<div class="col-lg-4 logo "  style="padding:0px;">

<div style="float:left;">
<img src="/static/image/211xzw_img.png" width="80" alt="图片" class=" img-responsive center-block " style="margin-top:20px; ">
<p class="text-center">211校招网</p>
</div>

<div style="float:left; margin:0px 16px;" >
<img src="/static/image/youcaiyoupin_ios_img.png" width="80" alt="图片" class=" img-responsive center-block " style="margin-top:20px;">
<p class="text-center">iPhone下载</p>
</div>

<div style="float:left;">
<img src="/static/image/youcaiyoupin_android_img.png" width="80" alt="图片" class=" img-responsive center-block " style="margin-top:20px; ">
<p class="text-center">Android下载</p>
</div>
</div>


<div class="col-lg-4  text-left text-left" style="color:#a5a5a5; padding:0px;">
<div class="btn btn-default btn-xs" style="color:#a5a5a5; margin-top:20px;" >关于我们</div>
<p style="color:#a5a5a5; margin-top:20px;">地址：陕西西安高新区科技二路清华科技园A座410</p>

<p style="color:#a5a5a5; margin-top:20px;">电话：<strong>029-88662469</strong></p>
</div>


<div class="col-lg-4  text-left text-right" style="color:#a5a5a5; padding:0px;">
<p style="margin-top:20px;" >西安市人力资源服务许可证编号：610100120105</p>
<p style="margin-top:10px;">工信部备案号：陕ICP备13006318号-3</p>
<p style="margin-top:10px;">版本号：V2.0.1.25</p>
<p style="margin-top:10px;">&copy;陕西新才网络技术有限公司，西安大秦人力资源有限公司版权所有</p>
</div>


</div>

<div>
<div class="col-lg-2 col-md-4 col-xs-5 logo">
<img src="/static/image/youcaiyoupin_android_img.png" width="60%" alt="图片" class=" img-responsive center-block " style="margin-top:20px; ">
<p class="text-center">Android下载</p>
</div>
</div>
<div class="col-lg-4 col-md-4 col-xs-1"></div>


<div class="row">
<p class="text-center" style="color:#a5a5a5; margin-top:20px;">&copy;陕西新才网络技术有限公司，西安大秦人力资源有限公司版权所有</p>
</div>




</div>
</div>
-->
<script src="/static/js/jquery-1.11.1.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/static/jquery/jquery.form.js" charset="utf-8"></script>
<script src="/static/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>

<script type="text/javascript">
var Login = function () {
    return {
        init: function () {
        		var options ={
				       errorElement: 'label', //default input error message container
				       errorClass: 'help-inline', // default input error message class
				       focusInvalid: true, // do not focus the last invalid input
				       ignore: "",
				       rules :{
			                username: {
			                    required: true
			                },
			                password: {
			                    required: true
			                }
				       },
			            messages: { // custom messages for radio buttons and checkboxes
			                username: {
			                    required: "请输入用户名！"
			                },
			                password: {
			                    required: "请输入密码！"
			                }
			             },
				        invalidHandler: function (event, validator) { //display error alert on form submit   
								showErrDialog(validator.errorList[0].message);
				        },
			            highlight: function (element) { // hightlight error inputs
			                /*
			                $(element)
			                    .closest('.control-group').addClass('error'); // set error class to the control group
			                 */
			            },
			            success: function (label) {
			                label.closest('.control-group').removeClass('error');
			            },
			            errorPlacement: function (error, element) {
			                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
			                   // error.addClass('help-small no-left-padding').insertAfter($('#register_tnc_error'));
			                } else {
			                    //error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
			                }
			            },
			            submitHandler: function(form) {
			            	var url="/auth/wxAjaxBind.do";
							$.post(url, $(form).serialize(), function(data){
								if(data.code=="4004"){
									showErrDialog("账号不存在");
									form.password.value='';
									$(form.username).focus();
								}else if(data.code=="4005"){
									showErrDialog("密码错误");
									form.password.value='';
									$(form.password).focus();
								}else if(data.code=="0"){
									window.location.href="/member/home.do";
								}else if(data.data){
									showErrDialog( data.data );
								}else{
									showErrDialog("未知错误，请与管理员联系！");	
								}
							});
			            }
			     };
			    
				$('.login_form').validate( options );
			}
		};
}();
Login.init();
function showErrDialog(str){
		art.dialog({
			title: '错误信息',
			content: str,
			icon: 'warning',
			lock:false,
			id:'login',
			time: 5
		});
}
	
function fieldCheck($field){
		if($field.val()==''){
			art.dialog({
				title: '错误信息',
				content: $field.attr("errorcontent"),
				icon: 'warning',
				lock:false,
				id:'login',
				time: 5,
				ok: function(){
					$field[0].focus();
				}
			});
			return false;	
		}
		return true;
}
</script>

</body>
</html>