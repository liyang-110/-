<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>登录页面</title>
 	<script src="/statics/jquery/1.11.3/jquery.min.js"></script>
 	<script src="/statics/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/static/css/login-style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/static/service/login.js" charset="utf-8"></script>
</head>

<body>
<!--  
<div id="header"></div>
-->
<div class="container-fluid"> 
<div class="row-fluid main">
<div class="logo">
    <img  src="/static/images/LOGO.png" width="234" height="56" >
</div>

<div class="row-fluid section">
    <div class="section_left">
		
            <div class="span6">
            	<img src="/static/images/ad/lhxian.jpg" />
            </div>
            <div class="span6">
            	<img src="/static/images/ad/qjxjh.jpg" />
            </div>
        
            <div class="span6">
            	<img src="/static/images/ad/smzph.jpg" />
            </div>
            <div class="span6">
            	<img src="/static/images/ad/wlspzph.jpg" />
            </div>

            <div class="span6">
            	<img src="/static/images/ad/yrtz.jpg" />
            </div>
            <div class="span6">
            	<img src="/static/images/ad/slm.jpg" />
            </div>
            
            <div class="span6">
            	<img src="/static/images/ad/gtcw.jpg" />
            </div>
            <div class="span6">
            	<img src="/static/images/ad/plcc.jpg" />
            </div>
      
    </div>	
    
    <div class="section_right">
    	<img  class="top" src="/static/images/tx_w_03.png" width="22" height="310">
   		<div class="section_right_bg">
   			<form class="login_form">
   				<input class="yhm" type="text" name="user_id" placeholder="账号" errorcontent="请输入用户名！"/>
   				<input class="smm" type="text" name="user_pass" placeholder="密码" errorcontent="请输入密码！"/>
    			<a target="_blank" href="<%=request.getContextPath() %>/forget.do"><p>忘记密码？</p></a>
   				<input class="dl" type="submit" value=" 登      录"/>  
    			<input class="zc" type="submit" onclick="window.open('/register.jsp')" value="新用户免费注册"/><!--location.href=""  -->  
   			</form>
   			 <script type="text/javascript">
			  $(function(){
			  	Login.init();			  	
			  });
			</script>
   			<div class="social_icon">
  				<a href="#"><img class="qq" src="/static/images/01/socia_icon_01.png" width="28px" height="28px"></a>
  				<a href="#"><img class="wx" src="/static/images/01/socia_icon_02.png" width="28px" height="28px"></a>
  				<a href="#"><img class="wb" src="/static/images/01/socia_icon_03.png" width="28px" height="28px"></a>
  			</div>     
  		</div>
		<img class="dowm" src="/static/images/tx_w_07.png" width="22" height="310">		
   </div>
</div>
</div>
</div>
</body>
</html>
