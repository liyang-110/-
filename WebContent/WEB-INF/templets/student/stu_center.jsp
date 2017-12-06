<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.StudentSessionBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/static/inc/checkLogin.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
StudentSessionBean userInfo = (StudentSessionBean)User.getUser("student", session);
String head_logo = userInfo!=null?userInfo.getLogo():null;
%>
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
	<link href="/static/css/stu_center.css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/csshub-loading.css" rel="stylesheet" type="text/css">
    
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var student_id="${student.student_id}";
	</script>
	<script src="/static/js/center.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<!--头部架构开始-->
<jsp:include page="../include_stu/header.jsp" flush="true"></jsp:include>
<!--头部架构结束-->

<!--main区架构开始-->
<div class="main">
	<jsp:include page="../include_stu/main_latest_log.jsp" flush="true"></jsp:include>
	
 	<div class="main_l">
		<jsp:include page="../include_stu/menu.jsp" flush="true"></jsp:include>
	</div>
<!--main_r  -->  
	<div class="main_r"> 
	<div class="info_card">
		<div class="user_pic"><img id="userpic" src="<%=head_logo!=null?"/upload/headpic/"+head_logo:"/static/images/personal_center/user.png"%>" alt="默认头像" class="mr_headimg"></div>
		<div class="info_card_r">
			<div style="width:696px;height:50px; margin-top:-10px; border-bottom:1px solid #cacaca">
				<p style="line-height:50px; color:#333; font-size:22px; font-weight:500; float:left; margin:0;">${student.name }</p>
				<ul>
					<li><i class="fa fa-map-marker"></i> ${student.hope_areas }</li>
					<li><i class="fa fa-graduation-cap"></i> ${student.educations }</li>
					<li style="width: 220px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
						<i class="fa fa-suitcase"></i>
						 ${student.hope_positions }
					</li>
					
					<li style="float:right;padding-right:20px;"><a href="javascript:void(0);" onclick="window.location.reload();" style="color:#e03919;"><i class="fa fa-refresh"></i>刷新</a></li>
					<li style="float:right;"><a id="open_switch_btn" href="javascript:;" style="color:#e03919;"></a></li>
					
				</ul>
				<div style="clear:both"></div>
			</div>

			<ul>
				<li style="padding:5px 0px; margin-left:12px;">
					<a href="/student/stuCanhui.do?type=xiaoyuan" style="display:block; line-height:40px;  padding-right:12px; color:#333; border-right:1px solid #cacaca;">浏览过<strong style="color:#E03919">${informCount.zph_count }</strong>场招聘会</a>
				</li>

				<li style="padding:5px 0px;  margin-left:12px;">
					<a href="/student/stuToudi.do" style="display:block; line-height:40px;  padding-right:12px; color:#333; border-right:1px solid #cacaca;">浏览过<strong style="color:#E03919">${informCount.gw_count }</strong>个岗位</a>
				</li>

				<li style="padding:5px 0px;  margin-left:12px;">
					<a href="/student/stuToudi.do" style="display:block; line-height:40px;  padding-right:12px; color:#333; border-right:1px solid #cacaca;">投递过<strong style="color:#E03919">${informCount.gs_count }</strong>家公司</a>
				</li>

				<li style="padding:5px 0px;  margin-left:12px;">
					<a href="/student/stuResume.do" style="display:block; line-height:40px;  padding-right:12px;color:#333; border-right:1px solid #cacaca;">简历完整度<strong style="color:#E03919">${percent}%</strong></a>
				</li>

				<li style="padding:5px 0px;  margin-left:12px;">
					<a href="javascript:;" onclick="upload_resume()"; style="display:block; line-height:40px;  padding-right:12px; color:#e03919; padding-left:20px"><i class="fa fa-upload"></i>  上传本地简历</a>
				</li>

</ul>
</div>

	<div style="clear:both"></div>
	</div> 
	<!--搜索  -->  
	<div class="search">
		<form id="fm" method="post" name="fm" action="/jobfair/search.do">
     		<input type="hidden" name="in_pagenum" value="20">
     		<ul>
				<li>
     				<div class="zph_b">
               			<div style="height:12px;"> </div>  
     		  			<div class="arrow"></div>
                	</div>       
     				<select class="zph" name="type">
      					<option value="search_recruit">
      						职位
      					</option>
     					<option value="search_jobfair">
     						招聘会
     					</option>
     				</select>            
              
  				</li>
				<li>
     				<input class="xjzph" type="text" style="" value="" name="in_key" placeholder="请输入职位关键词：如人事专员等">
     			</li>
				<li>
     				<input class="ss" type="submit" value="&nbsp;&nbsp;&nbsp;">
     			</li>
     			<li>
     				<a href="/jobfair/search.do?type=search_recruit" class="gaojiss">高级搜索</a>
     			</li>  
			</ul>
		</form>     
     	<div style="clear:both"></div>
	</div> 
	<!--end 搜索  -->    
	
	<!--热门招聘会  -->    
	<div class="hot_gw">
 		<span>热门招聘会</span>  <span style="margin-left:600px;"><a href="/jobfair/search.do?type=search_jobfair" style="color:#7885a0;">查看更多  <i class="fa fa-angle-double-right"></i></a></span>
 		<c:forEach var="row" items="${jobfairList }">
		<ul>
			<li style="width:180px;border-left:1px solid #f0f0f9;color:#7885a0;" class="${row.begin eq 1?'begin':'' }">
				<c:if test="${row.begin eq 1}">#正在进行#</c:if>
				<c:if test="${row.begin eq 0}">${row.job_fair_date }</c:if>
			</li>
 			<li style="width:390px;" class="${row.begin eq 1?'begin':'' }">
 				<c:if test="${row.begin eq 1}">
 					<div style="width: 0px;height: 0px;">
  						<div class="csshub-loading">
    					<div></div><div></div><div></div><div></div><div></div>
  						</div>
  					</div>
  				</c:if>
 				<a style="color:#a5a5a5;margin-left:30px;" href="/jobfair/detail.do?id=${row.job_fair_id}" target="_blank">${row.job_fair_name } </a>
 			</li>
   			<li style="width:238px;color:#7885a0;" class="${row.begin eq 1?'begin':'' }">
   				<c:if test="${row.job_fair_type eq '网络招聘会' and row.begin eq 1 }">
					<a style="color:#fff !important;" class="jrhc" href="/netcongress/start.do?id=${row.job_fair_id }"
					target="_blank">进入会场</a>
				</c:if>
				<c:if test="${row.begin ne 1 }">
					${row.job_fair_type}
				</c:if>
			</li>
 		</ul>
 		</c:forEach>
			
  		<div style="clear:both"></div>   
	</div>   
	<!--end 热门招聘会  -->
	
	<!--热门岗位  -->   
	<div class="hot_gw">
 		<span>精品职位推荐</span>  <span style="margin-left:600px;"><a href="/jobfair/search.do?type=search_recruit&in_hope_area=${student.hope_area }&in_hope_position=${student.hope_position }" style="color:#7885a0;">查看更多  <i class="fa fa-angle-double-right"></i></a></span>
			<c:forEach var="row" items="${recruitList }">
	      	<ul>
 			<li style="width:140px; border-left:1px solid #f0f0f9;">
 				<a style="color:#a5a5a5;" href="/jobfair/job.do?id=${row.job_id}" target="_blank">${row.job_name }</a>
 			</li>
  			<li style="width:130px;color:#7885a0;">${empty row.money ? "面议" :row.money}</li>
 			<li style="width:298px;"><a style="color:#a5a5a5;" href="/jobfair/company.do?id=${row.company_id}&jobs=1" target="_blank">${row.company_name}</a></li>
   			<li style="width:100px;color:#7885a0;">${row.areas }</li>
    		<li style="width:140px;"><a href="javascript:;" onclick="openOrderJob('${row.company_id}','${row.job_id}','${row.company_name }','${row.job_name }','${row.contact_tel }');"  style="" class="send">投递简历</a></li>
 			</ul>
	        </c:forEach>    	
  	<div style="clear:both"></div>   
	</div>    
	<!--end 热门岗位  -->    
	<div style="clear:both"></div>    
	</div>
<!--end main_r  -->  

<div style="clear:both"></div> 
</div>   
<!--main区架构结束-->

<!--footer区架构开始-->
<jsp:include page="../include_stu/footer.jsp" flush="true"></jsp:include>
<!--footer区架构结束-->

</body>
</html>