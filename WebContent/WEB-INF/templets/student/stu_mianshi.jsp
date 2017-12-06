<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN"><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="211校招网,网络视频招聘会，网络招聘会，宣讲会，校园招聘会，应届生招聘会，高校招聘会，毕业生招聘会。">
<meta name="description" content=" 211校招网是一个为高校和企业开展校园招聘，提供校园招聘会，宣讲会，网络视频招聘会服务的网站。在全国30个省市设立了分站，服务用人单位和大学生。">
<meta name="author" content="">
<title>面试通知</title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/stu_center(commen).css" rel="stylesheet" type="text/css">
    <link href="/static/css/stu_center(03inform_mianshi).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/statics/artDialog/artDialog.js?skin=green" charset="utf-8"></script>
	<script src="/statics/artDialog/plugins/iframeTools.js"></script>
    
     <script type="text/javascript" >
	$(function(){
		$(".chakanxiangqing").bind("click",function(e){
			e.preventDefault();
			if($(this).attr("status")=='show'){
				$(this).parents(".invitation").find(".neirong").hide();
				$(this).attr("status","hidden");
			}else{
				$(this).parents(".invitation").find(".neirong").show();
				$(this).attr("status","show");
			}
		});
		
    });
	</script>
</head>
<body>
<!--头部架构开始-->
<jsp:include page="../include_stu/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
	<jsp:include page="../include_stu/main_latest_log.jsp"></jsp:include>
    <div class="main_l">
<jsp:include page="../include_stu/menu.jsp"></jsp:include>

</div>
 
 <div class="main_r">  
 
	<%
					List mianshiList = (List)request.getAttribute("mianshiList") ;
     				boolean isLogin= true;// session.getAttribute("userInfo") instanceof HashMap;
				%>				
				<%
    				if(!isLogin){
				%>
 	             	<div class="invitation">只有登陆用户才可以查看参会企业列表！&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/register.jsp" target="_top">注册</a>&nbsp;|&nbsp;<a href="<%=request.getContextPath() %>/" target="_top">登录</a></div>
				<%
	  				}else if(mianshiList!=null &&mianshiList.size()>0){
	          	    int i=0;
	            	for(Iterator iter=mianshiList.iterator();iter.hasNext();){
	            		HashMap row=(HashMap)iter.next();
	            %>
		 
     			<div class="invitation"> 
                	<div class="biaoti">               
                	<div class="time" style="font-size:14px;"> <i class="fa fa-calendar" style="color:#e03919"></i>    2016年9月23日</div>
                	<dl>          
                		<dt class="company_name"><a href="/jobfair/company.do?id=<%=row.get("company_id") %>"><%=row.get("company_name") %></a></dt>
                			<dd>应聘职位：<%=row.get("jjob_name") %></dd>
                			<dd>HR向你发送了面试邀请&nbsp;&nbsp;&nbsp;&nbsp;<a class="chakanxiangqing"  href="javascript:;"><i class="fa fa-volume-up"></i>   查看详情</a></dd>                
                			
                		</dl>
                		<div style="clear:both"></div>
                	</div>
					<div class="neirong">
                 		<p style="font-size:16px; color:#376EB3; line-height:30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;感谢你对我公司的关注，我们诚挚邀请你来参加面试。请务必准时到达指定地点，如有变动请及时与我们取得联系!</p>
                 			<ul>
                 				<li><%=row.get("remark") %></li>
                 			</ul>
                 	</div>  
                 
            	</div>
           		<%
	             	}
	     }else{ %>
	     	    <div class="invitation">还没有面试通知！</div>
	            <% 
			}
	   			 %>	   	
	   			 	     	    
	   			 		 
     			<div style="text-align:center;">
        			<div>${mianshipagenation}</div>
				</div> 
   
 </div>
	<div style="clear:both"></div> 
</div>   
 
<!--main区架构结束-->

<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->
</body>
</html>