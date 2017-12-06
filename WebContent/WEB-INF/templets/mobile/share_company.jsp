<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>${companyInfo.company_name }- <%=com.zhaopin.Config.getSiteTitle()%></title>
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
         <h4 class="text-center title" > 企业详情</h4>
      </div>
    </div> 
  </div>
</div>
<!--标题结束--> 

<!--公司基本信息开始--> 
<div class="container" style="border-bottom:1px solid #f2f3f4">
    
<div class="row" style="margin:10px 0px;;">
<div  class="col-xs-4 text-left " ></div>
<div  class="col-xs-4 text-left" ><img src="/static/image/211logo.png" alt="图片" class="img-circle img-responsive" width="60" style="margin:0 auto;" ></div>
<div class="col-xs-4 text-right " ></div>
</div>

<div class="row">
<h5 class="text-center">${companyInfo.company_name }</h5>
</div>

<div class="row">
	<ul class="list-inline" style="font-size:14px;color:#a5a5a5; text-align:center;">
	<li>${companyInfo.company_nature }</li>/
	<li>${companyInfo.company_person_num }</li>/
	<li>${companyInfo.industry_name }</li>
	</ul>
</div>

</div> 
<!--公司基本信息结束-->

<!--公司地址开始-->  
<div class="container" style="border-bottom:1px solid #f2f3f4" >
<div class="row">

<h4 class="col-xs-10 text-left company_name" >
<i class="fa fa-map-marker" style="color:#ff5a67;"></i>${companyInfo.company_addr }</h4>
<h4 class="col-xs-2 text-right a"><i class="fa fa-angle-right" style="font-size:22px; margin-top:-2px" ></i></h4>

</div>

</div>

<!--公司地址结束-->  

<!--公司介绍开始--> 
<div class="container" style="margin-bottom:10px;" >

<div class="biaoti">
<p><i class="fa fa-file-text" style="margin-right:6px;"></i>公司简介</p>
</div>
<p class="content">
	${companyInfo.company_info }
</p>

<div class="biaoti">
	<p><i class="fa fa-suitcase" style="margin-right:6px;"></i>招聘职位</p>
</div>

<div class="container" >
<%-- 
<div class="row"  style="border-bottom:1px solid #f2f3f4">
<h4 class="col-xs-6 text-left position_name" style="padding:0px;">Android工程师</h4>
<h4 class="col-xs-2 text-right pay"  style="padding:0px;">6k-8k</h4>
<h4 class="col-xs-3 text-right time"  style="padding:0px;">2017-04-12</h4>
<h4 class="col-xs-1 text-right" style="padding:0px;"><i class="fa fa-angle-right" style="font-size:20px;margin-top:-2px;" ></i></h4>
</div>
--%>
<%
	List recruitList=(List)request.getAttribute("recruitList");
	if(recruitList!=null && recruitList.size()>0){
		 int i=0;
	for(Iterator iter=recruitList.iterator();iter.hasNext();){
		HashMap row=(HashMap)iter.next();
%>
	<div class="row"  style="border-bottom:1px solid #f2f3f4">
	<h4 class="col-xs-6 text-left position_name" style="padding:0px;"> 
		<%=row.get("job_name")%>
	</h4>
	<h4 class="col-xs-2 text-right pay"  style="padding:0px;"><%=row.get("money")==null?"面议":row.get("money") %></h4>
	<h4 class="col-xs-3 text-right time"  style="padding:0px;"><%=row.get("add_time") %></h4>
	<h4 class="col-xs-1 text-right" style="padding:0px;"><i class="fa fa-angle-right" style="font-size:20px;margin-top:-2px;" ></i></h4>
	</div>
<%}}else{ %>
	<div class="row"  style="border-bottom:1px solid #f2f3f4">
		<h4 class="col-xs-6 text-left position_name" style="padding:0px;">暂未发布职位！</h4>
	</div>

<%}%>
	<div class="row"  style="border-bottom:1px solid #f2f3f4">
		<h4 class="col-xs-6 text-left position_name" style="padding:0px;width:100%;text-align: center;">
			<%=request.getAttribute("pagenation") %>
		</h4>
	</div>
</div>

</div>
<!--公司介绍结束-->

<div class="container " >
<div class="row bot-buttoms" >
<div  class="col-xs-1" ></div>
<a  href="http://a.app.qq.com/o/simple.jsp?pkgname=com.xinzhuonet.zph" class="col-xs-10 text-center btn btn-default a2" ><i class="fa fa-phone"></i>给HR打电话</a>
<div  class="col-xs-1" ></div>
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