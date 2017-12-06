<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/messager.css" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script type="text/javascript" src="login.js" charset="utf-8"></script>
<style>
.panel.combo-p { height:120px;}
#person-order-form {
	width:300px;font-size:14px;padding:10px 0 10px 20px;height:260px; overflow:hidden;
	background-color:#F7F7F7;
}
#person-order-form .control-label {display: inline;}
#person-order-form .controls{width:260px;display: inline;}
#person-order-form .form-error {border-color: #b94a48;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);background-color:#EAFDBE;}
.control-group {margin-bottom:0;}
</style>
</head>
<body style="background-color:#F7F7F7;padding:0">
		<style type="text/css">
		.f_login {width: 316px; height:auto;text-align: center;}
		</style>
    	<div class="f_login pull-left">
    	    <div id="loginTab2" style="height:30px;">
				<div class="alert" style="line-height:25px;width:220px;height:25px;padding:0;margin:5px auto;">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
					请输入您的联系信息！
				</div>
            </div>
            <div class="tab-content">            
              <div class="tab-pane active form" id="login1">
              	<form class="company_login" id="dosubmit" novalidate="novalidate" action="<%=request.getContextPath()%>/custom/customSignUp.do" method="post" >
                  <input type="hidden" name="user_type" value="company" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right"> 
                        <input type="text" name="user_id" placeholder="姓名" errorcontent="请输入姓名！"/><i class="icon-user"></i>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right">
                        <input type="text" name="user_phone" placeholder="手机" errorcontent="请输入联系手机！"/><i class="icon-lock"></i>
                        </div>
                    </div>
                  </div>
                    <div class="control-group">
                    <div class="controls">
                        <div class="input-icon right">
                        <input type="text" name="user_school" placeholder="所在院校" errorcontent="请输入所在院校！"/><i class="icon-lock"></i>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <a href="javascript:;" onclick="dosubmit();" class="btn btn-primary register">报&nbsp;&nbsp;&nbsp;名</a>
                    </div>
                  </div>
                  </form>
              </div><!-- form -->
       </div><!--  tabcontent -->
 </div><!-- login -->
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	//数据提交后处理
	 $('#dosubmit').ajaxForm({dataType:'json',success:function(data){
		 if(data.code==1){
			 art.dialog.close();
		 }else{
			 msg_alert('提示信息',data.msg,'warning');
		 }
		
  	}});
	
});
//提交报名
 function dosubmit(){
	 msg_alert('提示信息','姓名不能为空！','warning', function(){alert(0)});
	return false;
	 var username=$('input[name="user_id"]').val();
	 var userphone=$('input[name="user_phone"]').val();
	 var user_school=$('input[name="user_school"]').val();
	 //校验用户名
	 if(!username||$.trim(username).length==0){
		 msg_alert('提示信息','姓名不能为空！','warning');
		 return false;
	 }
	 //校验手机号
	 if(!userphone||$.trim(userphone).length==0){
		 msg_alert('提示信息','手机号不能为空！','warning');
		 return false;
	 }
	 var reg=/^1[3|4|5|8][0-9]\d{4,8}$/i;//验证手机正则(输入前7位至11位)
	 if(userphone.length<11||userphone.length>11)
	    {   
		 msg_alert('提示信息','手机号长度不正确！','warning');
		 return false;
	    }
	   if(!reg.test(userphone))
	    {   
		   msg_alert('提示信息','手机号不正确！','warning');
			 return false;
	    }
	 
	 //校验院校
	 if(!user_school||$.trim(user_school).length==0){
		 msg_alert('提示信息','所在院校不能为空！','warning');
		 return false;
	 }
	 if($.trim(user_school).length>50){
		 msg_alert('提示信息','所在院校太长了吧！','warning');
		 return false;
	 }
	 $('#dosubmit').submit();
 }
</script> 
</body>
</html>
