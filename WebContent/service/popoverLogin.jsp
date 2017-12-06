<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="screen"/>
	
	<link href="/statics/css/popoverLogin.css"  type="text/css" rel="stylesheet"/>
	
	<script src="/statics/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
	<script src="/statics/jquery/jquery.form.js" type="text/javascript"></script>
	<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript"></script> 
	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

	<script type="text/javascript">
		var cur_path = "";
	</script>

	<script src="/statics/artDialog/artDialog.js?skin=green" type="text/javascript"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>

	<script src="/statics/js/front.js" type="text/javascript"></script>
	<script src="login.js"  type="text/javascript"></script>
</head>
<body style="background-color:transparent;padding:0;margin:0;">
		<div style="padding:5px;background-color:#2F3440;">
			 <img style="float: left;"src="/statics/img/white_logo.png" />
			<div style="color:#fff;font-size:14px;float: left;padding-top:10px;">使用211校招网帐号登录</div>
			<a href="javascript:;"  class="pull-right aui_close_btn" style="">&times;</a>
			<div style="clear:both;"></div>
		</div>
    	<div class="f_login login4">
            <div class="left">            
              <div class="tab-pane active form" id="login4">
              	<form class="company_login" novalidate="novalidate" action="/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" name="user_type" value="company" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend"> 
                        <input type="text" name="user_id" placeholder="手机号/用户名" errorcontent="请输入用户名！"/>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                        <input type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                    	<p style="float:left;">
                    		<label><input type="checkbox"/>记住密码</label>
                    	</p>
                    	<p style="float:right;">
                        	<a style="color:#333;" target="_blank" href="/forget.do">忘记密码&gt;&gt;</a>
                    	</p>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input class="btn btn-success" style="width:290px;height:50px;background:#02c084;" type="submit" value="登&nbsp;&nbsp;&nbsp;录"  />
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">

          <div style="color:#02c084;text-align: center;">
 			<div style="width:100px;height: 2px;background:#efefef;float: left;margin-top: 10px;"></div>
 			<a style="float: left;color: #999;" target="_blank" href="//www.211zph.com/auth/index.do">
 			<i class="fa fa-qq" aria-hidden="true" style="font-size:18px;margin:0 10px;"></i></a>
 			<a style="float: left;color: #999;"  target="_blank" class="qqdenglu" href="//www.211zph.com/auth/wxLogin.do">
 			<i class="fa fa-weixin" aria-hidden="true" style="font-size:18px;margin:0 10px;"></i></a>
 			<div style="width:100px;height: 2px;background:#efefef;float: left;margin-top: 10px;"></div>
 			<div style="clear:both;"></div>
 		</div>
                    </div>
                  </div>
                  </form>
              </div><!-- form -->
       </div><!-- left -->
	<div class="right">

 		<div>
 			<img src="/statics/img/login_qr.png"/>
 		</div>
		<div>
           	<p>
             	还没有账号？<a style="color:#02c084;" target="_blank" href="/member/accountRegister.do?users=student" >点击注册>></a>
         	</p>
		</div>
 	</div><!-- right -->
 </div><!-- login -->
<script type="text/javascript">
  $(function(){
		var parent = art.dialog.parent				// 父页面window对象
		api = art.dialog.open.api ;// 			art.dialog.open扩展方法
		
		$(".aui_main",parent.document ).css({"padding-top":0});  
		$(".aui_inner",parent.document ).css({"border":"none"});  
		
		$(".aui_close_btn").click(function(){
			api.close();
		});
		Login.init(function(){
			parent.location.reload();
			api.close();
		});
  });
</script>

</body>
</html>
