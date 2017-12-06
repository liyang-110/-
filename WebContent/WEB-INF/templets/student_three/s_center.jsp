<%@page import="com.sun.rowset.internal.Row"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<html>
	<head>
		<meta charset="UTF-8" />
		<title>学生会员中心</title>
		<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
		<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
		<link href="/static/css/s_center.css" rel="stylesheet" type="text/css" charset="utf-8" />
		<script src="/static/jquery/1.11.3/jquery.min.js"></script>
		<!-- <link rel="stylesheet" type="text/css" href="/static/css/vertical_course.css" />
		<script type="text/javascript" src="/static/jquery/jquery.focus.js" charset="utf-8"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			$("#j_Focus").Focus();
			});
		</script> //垂直滚动栏-->
</head>
	<body>
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>

	<div style="clear:both"></div>
	<!-- Nav tabs -->
	<div class="main">
		<!-- <div class="news">
			<ul class="info">
				<li>5分钟前，&nbsp;&nbsp;中国人寿保险股份有限公司西安分公司友谊西路营销服务部三部下载了韩智伟的简历</li>
				<li>5分钟前，&nbsp;&nbsp;西安乾华信息科技有限公司下载了范晓栋的简历</li>
				<li>5分钟前，&nbsp;&nbsp;中国人寿保险股份有限公司西安分公司友谊西路营销服务部三部下载了杜媛媛的简历</li>
			</ul>
			<div style="clear:both"></div>
		</div> -->
		<jsp:include page="../include_stu/main_latest_log.jsp" flush="true"></jsp:include> 
		<div class="content">
			<div class="summary">
				<!-- <div class="sum_left">
       				
					<div class="focusWrap">
					<div class="focusCon" id="j_Focus">
					<div class="focusL">
					<ul class="ulFocus" id="j_FocusNav">
					<li rel="0"><span>正在进行</span></li>
					<li rel="1"><span>正在进行</span></li>
					<li rel="2"><span>正在进行</span></li>
					<li rel="3"><span>正在进行</li>			
					</ul>
					<div class="back" id="j_FocusBack"></div>
					</div>
					<div class="focusM">
					<ul class="ulFCon" id="j_FocusCon">
					<li<a href="#"  "><img src="/static/css/images/1.jpg" alt="1" /></a></li>
					<li><a href="#"  "><img src="/static/css/images/2.jpg" alt="2" /></a></li>
					<li><a href="#"  "><img src="/static/css/images/3.jpg" alt="1" /></a></li>
					<li><a href="#"  "><img src="/static/css/images/4.jpg" alt="2" /></a></li>
					</ul>
					</div>
					</div>			
					</div>
  					</div> -->

				<div class="sum_right">
					<div class="sum_rt">
						<div class="sum_rtl">
							<div class="sum_rtl_img">
								<img alt="" class="headlogo"
									src="<%=head_logo!=null?"/upload/headpic/"+head_logo:"/static/images/personal_center/user.png"%>">
							</div>
							<p style="text-align: center;margin-top: 5px;">${student.name }
								<c:if test="${student.sex eq '男' }"><i style="color:#02c08e;" class="fa fa-mars" aria-hidden="true"></i></c:if>
								<c:if test="${student.sex eq '女' }"><i style="color:red;" class="fa fa-venus" aria-hidden="true"></i></c:if>
							</p>
						</div>
						<div class="sum_rtr">
							<div style="position: absolute;margin:15px 0 0 255px;">
							<a href="javascript:void(0);" onclick="window.location.reload();" style="float: right;margin:-1px 10px 0 0;">
								<i class="fa fa-refresh" style="color:#02c08e;" aria-hidden="true"></i>
							</a>
							<a href="/student/sResumet.do" style="float: right;margin: 0 10px 0 0;">
								<i class="fa fa-pencil-square-o" style="color:#02c08e;font-size:16px;"></i>
							</a>
							
							</div>
							<div style="clear:both"></div>
							<ul>
								<li style="width:240px;"><i class="fa fa-user"></i> : ${student.hope_positions }</li>
								<li><i class="fa fa-home" style="font-size: 17px;"></i> :
									${student.hope_areas }</li>
								<li><i class="fa fa-book"></i> : ${student.school_name }/${student.educations }/${student.profession }</li>
								<li><i class="fa fa-mobile" style="font-size:30px;"></i> :
									${student.contact_tel }</li>
								<li><i class="fa fa-envelope"></i> :
									${student.contact_email }</li>
							</ul>

						</div>
					</div>
					<div class="sum_rb">
						<ul>
							<li class="sum_rb_zw"><a href="/student/sCollection.do?type=zhiwei" target="_blank">收藏了${informCount.gw_count }个职位</a></li>
							<li class="sum_rb_jl"><a href="/student/sMessage.do?type=resumeYes" target="_blank">投递简历${informCount.gs_count }份</a></li>
							<li class="sum_rb_ms"><a href="/student/sMessage.do?type=interview" target="_blank">获得了${informCount.ms_count }个面试机会</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div style="clear:both"></div>
			<div class="lists">
				<div class="li_left">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="all-jobfair active"><a href="#all"
							aria-controls="all" role="tab" data-toggle="tab">全部招聘会</a></li>
						<li role="presentation" class="net-jobfair"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">推荐网络招聘会</a></li>
						<li role="presentation" class="mul-jobfair"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab">推荐校园招聘会</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="all">
							<c:forEach var="row" items="${alljobfairList }">
								<ul class="net-ul">
									<c:choose>
										<c:when test="${row.job_fair_type eq 'netcongress'}">
											<li class="${row.begin eq 1?'begin':'' }">
												<c:if test="${row.begin eq 1}">#正在进行#</c:if> 
												<c:if test="${row.begin eq 0}">${row.job_fair_date }</c:if></li>
											<li class="${row.begin eq 1?'begin':'' }"><a href="/jobfair/detail.do?id=${row.job_fair_id}"
												target="_blank">${row.job_fair_name } </a></li>
											<li class="${row.begin eq 1?'begin insert':'' }"><a href="/netcongress/start.do?id=${row.job_fair_id }"
												target="_blank">进入会场</a></li>
										</c:when>
										<c:otherwise>
											<li><c:if test="${row.begin eq 0}">${row.job_fair_date }</c:if></li>
											<li><a  style="color:#999;"  href="/jobfair/detail.do?id=${row.job_fair_id}"
												target="_blank">${row.job_fair_name } </a></li>
											<li><p style="margin:0;">校园招聘会</p></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</c:forEach>
						</div>
						<div role="tabpanel" class="tab-pane" id="home">
							<c:forEach var="row" items="${netjobfairList }">
								<ul class="net-ul">
									<li class="${row.begin eq 1?'begin':'' }"><c:if test="${row.begin eq 1}">#正在进行#</c:if> <c:if
											test="${row.begin eq 0}">${row.job_fair_date }</c:if></li>
									<li class="${row.begin eq 1?'begin':'' }"><a href="/jobfair/detail.do?id=${row.job_fair_id}"
										target="_blank">${row.job_fair_name } </a></li>
									<li class="${row.begin eq 1?'begin insert':'' }"><a href="/netcongress/start.do?id=${row.job_fair_id }"
										target="_blank">进入会场</a></li>
								</ul>
							</c:forEach>
						</div>
						<div role="tabpanel" class="tab-pane" id="profile">
							<c:forEach var="row" items="${muljobfairList }">
								<ul class="mul-ul">
									<li><c:if test="${row.begin eq 0}">${row.job_fair_date }</c:if>
									</li>
									<li><a  style="color:#999;"  href="/jobfair/detail.do?id=${row.job_fair_id}"
										target="_blank">${row.job_fair_name } </a></li>
									<li>
										<p>校园招聘会</p>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="li_right">
					<div style="clear:both"></div>
					<div class="job_recommend">
						<p></p>
						<p style="color:#333;margin-left:10px;font-weight:bold">推荐职位</p>
						<p style="float: right; margin-right: 20px;"><a style="color:#999;" href="/jobfair/search.do?type=search_recruit&in_hope_area=${student.hope_area }&in_hope_position=${student.hope_position }">查看更多</a></p>
					</div>
					<div style="clear:both"></div>
					<c:forEach var="row" items="${recruitList }">
						<ul>
							<li>
								<p>
									<a class="zhiwei-a" href="/jobfair/job.do?id=${row.job_id}"
										target="_blank">${row.job_name }</a> <span class="money">${empty row.money ? "面议" :row.money}</span><span class="addtime">${row.add_time }发布</span>
								</p>
								<p style="max-width:300px">
									<span><i class="fa fa-map-marker"></i> [${row.areas }]</span>
									<a class="qiye-a"
										href="/company/info.do?id=${row.company_id}" target="_blank">${row.company_name }</a>
								</p>
								<!-- <p style="color:#ffc0cb;">匹配度70%</p> -->
								<p style="float:right;margin:0px 20px 0 0;">
									<a
										style="padding: 4px;border: 1px solid #02c084;border-radius:2px;color:#02c084;"
										href="/jobfair/job.do?id=${row.job_id}"
										target="_blank">投递简历</a>
									<!-- <a
										style="padding: 4px;border: 1px solid #00F3FF;border-radius: 5px;color:#00F3FF;"
										href="javascript:;"> 与hr交谈</a> -->
								</p>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div style="clear:both"></div>
		</div>
		<!-- <div style="width:1024px;height:60px;background:red;"></div> -->
	</div>
	<div style="clear:both"></div>
	<jsp:include page="../include/s_footer.jsp" flush="true"></jsp:include>
	</body>
	
    <script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/js/flow.js" type="text/javascript" charset="utf-8"></script>
</html>
