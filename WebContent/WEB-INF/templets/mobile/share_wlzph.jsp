<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>${jobfairInfo.job_fair_name }</title>
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
         <h4 class="text-center title" > 网络招聘会</h4>
      </div>
    </div> 
  </div>

</div>

<!--标题结束--> 
    
<!--网络招聘会基本信息开始--> 
<div class="container">
	<div class="row">
		<h5 class="text-center" style="font-weight:600;">${jobfairInfo.job_fair_name }</h5>
	</div>
</div>

<div class="container" style="border-bottom:1px solid #f2f3f4; color:#a5a5a5;">

<div class="row" >
	<p class="col-xs-12 text-left wlzph_date" >
	<i class="fa fa-clock-o" style="color:#f2994b;"></i>${jobfairInfo.job_fair_time }至 ${jobfairInfo.job_fair_endtime }</p>
</div>

<div class="row">
	<p class="col-xs-12 text-left wlzph_level" >
	<i class="fa fa-reorder" style="color:#f2994b;"></i>${jobfairInfo.job_fair_level }</p>
</div>

<div class="row">
	<p class="col-xs-12 text-left wlzph_style" >
	<i class="fa fa-tags" style="color:#f2994b;"></i>${jobfairInfo.job_fair_feature }</p>
</div>

<div class="row">
	<div class="col-xs-1 text-left wlzph_level" >
		<i class="fa fa-dot-circle-o" style="color:#f2994b;"></i>
	</div>
	
	<div class="col-xs-11 text-left wlzph_level" style="overflow:hidden; text-overflow:ellipsis; margin-left:-12px;" >
		<p class="text-nowrap">举办：${jobfairInfo.school_name }</p>
		<p class="text-nowrap">主办：${jobfairInfo.job_fair_sponsor }</p>
		<p class="text-nowrap">承办：${empty jobfairInfo.job_fair_organizer ?'暂无信息！':jobfairInfo.job_fair_organizer}</p>
	</div>
</div>
</div> 
<!--网络招聘会基本信息结束-->

<div class="container" style="margin-bottom:50px;" >

	<div class="biaoti">
		<p><i class="fa fa-file-text" style="margin-right:6px;"></i>邀请函</p>
	</div>
	<p class="content">
		<%
 			HashMap jobfairInfo = (HashMap)request.getAttribute("jobfairInfo");
 			if(jobfairInfo==null){
 				response.sendRedirect( request.getContentType()+"/");
 				return;
 			}
 			String job_fair_id=(String)jobfairInfo.get("job_fair_id");
			String content=new com.zhaopin.dao.factory.JobFairModel().getRecommend(job_fair_id);
			if( !"".equals(content)){
				out.println( content );
			}else{
				out.println("暂未发布邀请函！");	
			}
		%>
	</p>

<div class="biaoti">
<p><i class="fa fa-file-text" style="margin-right:6px;"></i>基本信息</p>
</div>

<div class="container" style="margin:0px 8px;">
<div class="row">

 <div class="col-xs-4 text-center" style="background:#ff2d55; color:#fff; padding:6px 0px;">${statistics.company_num }家<br/>参会企业</div>
 <div class="col-xs-4 text-center" style="background:#ffcc00; color:#fff; padding:6px 0px;">${statistics.position_num }个<br/>在招职位</div>
 <div class="col-xs-4 text-center" style="background:#5ac8fa; color:#fff; padding:6px 0px;">${statistics.job_person_num }位<br/>求职者</div>

</div>

</div>
</div>
<div class="container " >
	<div class="row bot-buttoms" >
		<div class="col-xs-1" ></div>
		<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.xinzhuonet.zph" class="col-xs-10 text-center btn btn-default a2" >进入会场</a>
		<div class="col-xs-1" ></div>
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