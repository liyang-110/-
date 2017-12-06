<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel"%>
<%@ page import="com.zhaopin.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/statics/css/main4.css" />
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=aero"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/messager.css" type="text/css"/>
<script type="text/javascript">
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=in_file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script type="text/javascript" src="index_Login.js" charset="utf-8"></script>

<style>

.f_login {background-color:#FFF; width: 450px; height:auto;margin:auto;text-align: center;}
.login4 #login4 .input-prepend {margin:auto;width:auto;}
.login4 #login4 .input-prepend input {
  width:220px;
  }
.f_login .controls {width:290px;margin-left:auto;margin-right:auto;}
a.aui_close_btn {
	font-size:39px;color:#e03919;
}
a.aui_close_btn:hover {text-decoration:none;color:#EF4B4B;}
body {
	font-family: 'Microsoft YaHei', 微软雅黑, SimSun, 宋体;
}
.f_login .control-group {
	width: auto;
}
.login4 #login4 {
  width: auto;
  height: auto;
  background-color:transparent;
  border-radius: none;
  padding:0;
  box-shadow:none;
}
</style>
</head>
<body style="background-color:#edeeee;padding:0;margin:0;width:450px;">
		<div style="padding:8px 10px 11px 10px;">
		<a href="javascript:;"  class="pull-right aui_close_btn" style="">&times;</a>
			<div style="clear:both;"></div>
		</div>
    	<div class="f_login login4">
            <div id="loginTab2" style="margin:0 auto;padding:10px;">
				<div>
				  <img src="/logo.png" />
				</div>
				<div style="color:#262626;font-size:14px;">使用211校招网帐号登录</div>
            </div>
            <div class="tab-content">            
              <div class="tab-pane active form" id="login4">
              	<form class="company_login" novalidate="novalidate" action="<%=request.getContextPath()%>/login.do" method="post" onsubmit="return false;">
                  <input type="hidden" name="user_type" value="company" />
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend"> 
                        <i class="add-on user"> </i>
                        <input type="text" name="user_id" placeholder="账号" errorcontent="请输入用户名！"/>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                        <i class="add-on pass"> </i>
                        <input type="password" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/>
                        </div>
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                        <input style="width:290px;background:#e03919;" class="btn btn-warning" type="submit" value="登&nbsp;&nbsp;&nbsp;录" class="btn-primary" />
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                    	<p style="float:left;">
                    	<a style="color:#e03919;" target="_blank" href="<%=request.getContextPath() %>/forget.do">忘记密码&gt;&gt;</a>
                    	</p>
                    	<p style="flaot:rright;">
                    	还没有211校招网帐号？
                        <a style="color:#e03919;" target="_blank" href="<%=request.getContextPath()%>/register.jsp" >点击注册</a>
                    	</p>
                    </div>
                  </div>
                  </form>
              </div><!-- form -->
       </div><!--  tabcontent -->
<div style="width:290px;margin:auto;padding:15px 0 30px 0; text-align:left;">
 <p>使用其他帐号登录：
 <a target="_blank" href="//www.211zph.com/auth/index.do">
 		<img src="/auth/img/logo_1.png"/>QQ登录</a>
 <a class="qqdenglu" href="//www.211zph.com/auth/wxLogin.do">
 		<img src="/static/images/weichat.png"/>微信登录
 </a>
 </p>
 </div>
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
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
</body>
</html>
