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
    <link href="/static/css/stu_center(07toudijilu).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
    
</head>
<body>
<!--头部架构开始-->
<jsp:include page="../include_stu/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
     <jsp:include page="../include_stu/main_latest_log.jsp" flush="true"></jsp:include>
      
 <div class="main_l">
<jsp:include page="../include_stu/menu.jsp"></jsp:include>
</div>
 
 <div class="main_r"> 
 
	<%
					List toudiList = (List)request.getAttribute("toudiList") ;
     				boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>				
				<%
    				if(!isLogin){
				%>
  	             	<div class="position_yitou" style="text-align:center;padding-top:0px;">只有登陆用户才可以查看参会企业列表！&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></div>
				<%
	  				}else if(toudiList!=null &&toudiList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=toudiList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            %>
          			
     				<div class="position_yitou">
     					<dl>
        				<dt><a style="color:#333;text-decoration:none;" href="/jobfair/job.do?id=<%=row.get("job_id")%>" target="_blank"><%=row.get("job_name")%></a><span>&nbsp;&nbsp;[<%=row.get("money")==null?"面议":row.get("money") %>]</span></dt>
        				<dd><a href="/jobfair/company.do?id=<%=row.get("company_id") %>"><%=row.get("company_name") %></a>&nbsp;&nbsp;<strong>[<%=row.get("area_name") %>]</strong></dd>
        				<p style="font-size:14px;"><%=row.get("add_time") %></p>
     </dl>
</div>
     			<%
	             	}
	     }else{ %>
	   			 	<div class="position_yitou" style="text-align:center;padding-top:0px;">还没有投递记录！</div>
	            <% 
			}
	   			 %>
	   			 
     				<div style="text-align:center;">
        				<div>${toudipagenation}</div>
					</div>
     
 <div style="clear:both"></div>    
 </div>
 
  
   <div style="clear:both"></div> 
    
 </div>   
    
    
 
<!--main区架构结束-->



<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->



</body></html>