<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>微信登录</title>
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/wechat_login.css">
     <link href="static/css/font-awesome.min.css" rel="stylesheet" media="screen">

</head>
<body >
<div class="top_bar">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-4 col-xs-8 logo">
<img src="static/image/211logo_wechat2.png" width="50%" alt="图片" class=" img-responsive center-block " style="float:left; margin-top:14px; ">
<span style="float:left;">微信登录</span>
<div style="clear:both;"></div>
</div>

<div class="col-lg-9 col-md-8 col-xs-4 logo text-right"><a href="#" class="btn-block" style="color:#fff;">返回首页<i class="fa fa-angle-double-right"></i></a>

</div>

</div>
</div>
</div>


<div class="content" style="margin-bottom:200px;">
   <div class="container options" style="background:#fff; padding:100px 0px 100px 0px; border:1px solid #d1d1d1;" >
   
  <div class=" col-lg-4 col-md-4 col-xs-1"></div> 
   
 <form class="form-horizontal col-lg-4 col-md-4 col-xs-10 ">

<div class="form-group">
<label class="col-sm-3 control-label">账号</label>
<div class="col-sm-9">
<input type="email" class="form-control" placeholder="请输入您的账号">
</div>
</div>

<div class="form-group">
<label class="col-sm-3 control-label">密码</label>
<div class="col-sm-9">
<input type="password" class="form-control" placeholder="请输入您的密码">
</div>
</div>

<div class="col-sm-9 btn btn-success btn-block" style="margin:20px 0px; font-size:15px">绑定账号</div>




<div class="col-sm-9 btn btn-default btn-block" style="margin:0px 0px; font-size:15px;">返回上一步</div>

</form>


  
</div>

</div>


<!--
 <div class="footer  banquan" style="position:fixed; bottom:0px; z-index:100; width:100%;">
<div class="container">

<div class="row">
<div class="col-lg-4 col-md-4 col-xs-1"></div>
<div class="col-lg-2 col-md-4 col-xs-5 logo text-left">
<img src="static/image/youcaiyoupin_ios_img.png" width="60%" alt="图片" class=" img-responsive center-block " style="margin-top:20px; ">
<p class="text-center">iPhone下载</p>
</div>

<div class="col-lg-2 col-md-4 col-xs-5 logo">
<img src="static/image/youcaiyoupin_android_img.png" width="60%" alt="图片" class=" img-responsive center-block " style="margin-top:20px; ">
<p class="text-center">Android下载</p>
</div>
<div class="col-lg-4 col-md-4 col-xs-1"></div>


</div>
<div class="row">
<h4 class="text-center" style="font-size:20px;">下载优才优聘APP，手机面试更轻松!</h4>
</div>






</div>

</div>
-->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script> 

</body>
</html>