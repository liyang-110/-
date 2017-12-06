<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>${recruitInfo.job_name }</title>
	<jsp:include page="../include/weixin_share.jsp" flush="true" />
	
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/share.css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">

</head>
<body >

<!--标题开始-->
<div class="container" style="padding:0px; padding:0px;">
  <div class="navwrapper">
    <div class="navbar navbar-inverse navbar-static-top">
      <div class="container" style="padding:0px; padding:0px;">
         <h4 class="text-center title" > 职位详情</h4>
      </div>
    </div> 
  </div>

</div>

<!--标题结束--> 
    
<!--职位基本信息开始--> 
<div class="container" style="border-bottom:1px solid #f2f3f4">
    
<div class="row">
<div  class="col-xs-6 text-left position_name" ><h5><strong>${recruitInfo.job_name }</strong></h5></div>
<div class="col-xs-6 text-right pay"  ><h5><strong>${recruitInfo.money }</strong></h5></div>
</div>

<ul class="list-inline" style="font-size:14px;color:#a5a5a5;">

<li><i class="fa fa-map-marker" style="margin-right:4px;"></i>${recruitInfo.areas }</li>
<li><i class="fa fa-clock-o" style="margin-right:4px;"></i>1-3年</li>
<li><i class="fa fa-graduation-cap" style="margin-right:4px;"></i>${recruitInfo.education }</li>
</ul>

</div> 
<!--职位基本信息结束-->

<!--发布职位公司名称开始-->  
<div class="container" style="border-bottom:1px solid #f2f3f4" >
<div class="row">
<h4 class="col-xs-10 text-left company_name" >
<i class="fa fa-building" style="color:#42b9e5;"></i>${recruitInfo.company_name }</h4>
<h4 class="col-xs-2 text-right a"  ><i class="fa fa-angle-right" style="font-size:22px;" ></i></h4>
</div>

</div>

<!--发布职位公司名称结束-->  

<!--发布相似职位的招聘会开始--> 
<div class="container" style="border-bottom:1px solid #f2f3f4;" >
<div class="row">

<h4  class="col-xs-10 text-left zph">
<i class="fa fa-hand-o-right" style="color:#f2994b;"></i>共有10场招聘会也发布了相似职位
</h4>
<h4 class="col-xs-2 text-right a"><i class="fa fa-angle-right" style="font-size:22px;" ></i></h4>

</div>

</div>
<!--发布相似职位的招聘会结束-->

<div class="container" style="margin-bottom:50px;">

<div class="biaoti">
<p style=""><i class="fa fa-file-text" style="margin-right:6px;"></i>职位描述</p>
</div>

<h4><i class="fa fa-star"></i>岗位职责</h4>
	<p class="content">
		${empty recruitInfo.introduction ?'暂无信息！':recruitInfo.introduction}
	</p>

<h4><i class="fa fa-star"></i>任职资格</h4>
	<p class="content">
		${empty recruitInfo.requirement ?'暂无信息！':recruitInfo.requirement}
	</p>

</div>

<div class="container " >
<div class="row bot-buttoms" >
<div class="col-xs-1"></div>
<a  href="http://a.app.qq.com/o/simple.jsp?pkgname=com.xinzhuonet.zph" class="col-xs-4 text-center btn btn-default a1"><i class="fa fa-phone"></i>给HR打电话</a>

<div class="col-xs-1"></div>
<a  href="http://a.app.qq.com/o/simple.jsp?pkgname=com.xinzhuonet.zph" class="col-xs-5 text-center btn btn-default a2" ><i class="fa fa-send"></i>投递简历</a>
<div class="col-xs-1"></div>
</div>

</div>





 
  <script src="static/js/jquery-1.11.1.min.js"></script>
   <script src="static/bootstrap/js/bootstrap.min.js"></script>
 
   <script src="static/js/stickUp.min.js"></script>
   
   <script type="text/javascript">
                //initializing jQuery
                jQuery(function($) {
                  $(document).ready( function() {
                    //enabling stickUp on the '.navbar-wrapper' class
                    $('.navbar-wrapper').stickUp({
                      //enabling marginTop with the 'auto' setting 
                      marginTop: 'auto'
                    });
                });
              });
              
              </script>          
   
</body>
</html>