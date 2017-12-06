<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。">
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。">
<meta name="author" content="">
<title>个人中心</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/stu_center(commen).css" rel="stylesheet" type="text/css">
    <link href="/static/css/stu_center(06canhuijilu).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
</head>
<body>
<jsp:include page="../include_stu/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
	<jsp:include page="../include_stu/main_latest_log.jsp"></jsp:include>
      
	<div class="main_l">
		<jsp:include page="../include_stu/menu.jsp" flush="true"></jsp:include>
	</div>
 
 	<div class="main_r"> 
  
 <div class="content">
  <div class="zph_daohang">
     <ul class="nav nav-tabs" role="tablist">
	      <li role="presentation" class="active">
	      		<a class="xiaoyuanzph xyzph" href="/student/stuCanhui.do?type=xiaoyuan" aria-controls="profile" role="tab" data-toggle="tab">
	      			校园招聘会
	      		</a>
	      </li>
	      <li role="presentation" >
	      		<a class="wangluozph" href="/student/stuCanhui.do?type=wangluo"  aria-controls="profile" role="tab">
	      			网络招聘会
	      		</a>
	      </li>
           <div style="clear:both"></div>
     </ul>
    </div>
		<div class="tab-content">
          <!--近期招聘会开始  -->
			<div role="tabpanel" class="tab-pane active" id="xiaoyuanzph">
  		  
            <div class="zph_nav">
				        <ul class="zph_nav_zph1">
			 		
			 		<li class="zphmingchen">招聘会名称</li>
			 		<li class="time">时间</li>
			 		<li class="address">地址</li>
			 	</ul>
			 	
			 	<%
					List xyzphList = (List)request.getAttribute("xyzphList") ;
					boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>				
				<%
    				if(!isLogin){
				%>
			 	<ul class="zph_nav_zph1" style="cursor:default;text-align:center;">只有登陆用户才可以查看参会企业列表！&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></ul>
				<%
	  				}else if(xyzphList!=null &&xyzphList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=xyzphList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            %>
                	<ul class="zph_nav_zph1" style="cursor:default;">
	            		<li class="zphmingchen"><a href="/jobfair/detail.do?id=<%=row.get("job_fair_id") %>" target="_blank"><%=row.get("job_fair_name") %></a>	</li>
	            		<li class="time"><%=row.get("add_time") %></li>
	            		<li class="address"><%=row.get("job_fair_addr")==null?"暂无信息":row.get("job_fair_addr") %></li>
					</ul>
				<%
	             	}
	    			}else{
	    		%>
	             	<ul class="zph_nav_zph1" style="cursor:default;text-align:center;">还没有参会记录！</ul>
	             <% 

					}
	    		%>				
				 <div style="clear:both"></div>		
			</div>
			<div style="text-align:center;">
				<ul class="zph_nav_zph1" style="cursor:default;">
	    			<li>${xypagenation}</li>
        		</ul>
			</div>
		<% if(  request.getParameter("page")!=null ) {%>
			<script type="text/javascript">
				$(function(){
					$(".xyzph").trigger("click");
				});
			</script>
		<% } %>
		
			</div>
		  
		  <div style="clear:both"></div> 
		</div>

</div>  
<!--end content  -->
</div>
 <!--end main_r  -->
 
  
<div style="clear:both"></div> 
</div>   
 
<!--main区架构结束-->

<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>

<!--footer区架构结束-->
</body></html>