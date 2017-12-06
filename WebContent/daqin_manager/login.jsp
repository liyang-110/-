<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- BEGIN HEAD -->
<head>
<title>211校招网管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="../media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
<link href="../media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="../media/css/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="../media/css/style.css" rel="stylesheet" type="text/css"/>
<link href="../media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="../assets/css/themes/blue.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="../media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL STYLES -->

<link href="css/login.css" rel="stylesheet" type="text/css"/>

<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="../media/image/favicon.ico" />
	<script type="text/javascript">
		if (window!=top) // 判断当前的window对象是否是top对象
			top.location.href =window.location.href; 
	</script>
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="login">

<!-- BEGIN LOGO -->

<div class="logo">  
</div>

<!-- END LOGO --> 

<!-- BEGIN LOGIN -->

<div class="content"> 
  
  <!-- BEGIN LOGIN FORM -->
  
  <form class="form-vertical login-form" action="index.jsp">

    <div class="control-group"> 
      
      <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
      
      <label class="control-label visible-ie8 visible-ie9">账号：</label>
      <div class="controls">
        <div class="input-icon left"> <i class="icon-user"></i>
          <input class="m-wrap placeholder-no-fix" type="text" placeholder="账号" id="username" name="username"/>
        </div>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">密码：</label>
      <div class="controls">
        <div class="input-icon left"> <i class="icon-lock"></i>
          <input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" id="password" name="password"/>
        </div>
      </div>
    </div>
    <div class="form-actions">
      <button type="submit" class="btn green pull-right"> 登陆 <i class="m-icon-swapright m-icon-white"></i> </button>
    </div>
  </form>
  
  <!-- END LOGIN FORM -->
  
</div>

<!-- END LOGIN --> 

<!-- BEGIN COPYRIGHT -->

<div class="copyright"> Copyright  &copy 2013-2014  西安大秦人力资源有限公司 </div>

<!-- END COPYRIGHT --> 

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) --> 

<!-- BEGIN CORE PLUGINS --> 

<script src="../media/js/jquery-1.10.1.min.js" type="text/javascript"></script> 
<script src="../media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script> 
<script src="../assets/artDialog/artDialog.js?skin=green"></script>

<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip --> 

<script src="../media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script> 
<script src="../media/js/bootstrap.min.js" type="text/javascript"></script> 

<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]--> 

<script src="../media/js/jquery.slimscroll.min.js" type="text/javascript"></script> 
<script src="../media/js/jquery.blockui.min.js" type="text/javascript"></script> 
<script src="../media/js/jquery.cookie.min.js" type="text/javascript"></script> 
<script src="../media/js/jquery.uniform.min.js" type="text/javascript" ></script> 

<!-- END CORE PLUGINS --> 

<!-- BEGIN PAGE LEVEL PLUGINS --> 

<script src="../media/js/jquery.validate.min.js" type="text/javascript"></script> 

<!-- END PAGE LEVEL PLUGINS --> 

<!-- BEGIN PAGE LEVEL SCRIPTS --> 

<script src="js/login.js" type="text/javascript" charset="gb2312"></script> 
<!-- END PAGE LEVEL SCRIPTS --> 
<script>
		jQuery(document).ready(function() {     
		  Login.init();

		});
</script> 

<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>