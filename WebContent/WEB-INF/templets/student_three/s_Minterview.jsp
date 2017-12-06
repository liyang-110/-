<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>我的消息-面试</title>
		<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    	<link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
    	<link href="/static/css/s_message.css" rel="stylesheet" type="text/css" />
		
		<script src="/static/jquery/1.11.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    	<script src="/static/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
		<script src="/static/artDialog/plugins/iframeTools.js"></script>
</head>
<body>
	<jsp:include page="../include/s_header.jsp" flush="true"></jsp:include>

	<div style="clear:both"></div>
	<!-- Nav tabs -->
	<div class="main">
		<div style="margin:10px 0;">
			<div style="width:100px;float:left;">我的消息</div>
			<div
				style="width:924px;height:2px;background:#fff;float:left;margin-top: 10px;"></div>
			<div style="clear:both"></div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 c_left">
					<div class="l_header">
						<ul>
							<li><a href="/student/sMessage.do?type=resumeYes">投递简历成功</a><span class="l_span">|</span></li>
							<li><a href="/student/sMessage.do?type=resumeRead">简历被查看</a><span class="l_span">|</span></li>
							<li class="active"><a href="/student/sMessage.do?type=interview">面试通知</a><span class="l_span">|</span></li>
							<li><a href="/student/sMessage.do?type=resumeNo">不合格</a><span class="l_span">|</span></li>
							<!--<li><a href="/student/sMessage.do?type=resumeSys">系统消息</a></li>-->
						</ul>
					</div>
					<div class="l_bottom">
						<c:forEach var="row" items="${interviewList }">
							<div>
							<ul class="l_b_ul">
								<li><i class="fa fa-envelope-o" style="color:#ffc107;" aria-hidden="true"></i>  <a class="comnamea" style="color:#FF9800;font-weight:bold;" href="/jobfair/company.do?id=${row.company_id }">${row.company_name }</a> 给你发来面试通知：<span class="l_b_time">${row.add_time }</span></li>
								<li>
          							<div style="text-indent:2em;width:650px">
          								${row.remark }
          							</div>
								<li>面试岗位：${empty row.jjob_name?"未选择职位":row.jjob_name }</li>
								<li>联系人：${row.contact_person }</li>
							</ul>
						</div>
						</c:forEach>
						<c:if test="${ empty interviewList}">
							<div style="padding-left:20px;">
								暂无信息！
							</div>
						</c:if>
						<div style="text-align:center;">
							${interviewpagenation }
						</div>
					</div>
				</div>

				<div class="col-md-4 c_right">
					<div class="r_bottom">
						<div class="r_b_favorite">
							<img src="/static/images/message1.png" alt="..." class="img-rounded">
						</div>
						<div class="r_b_favorite">
							<img src="/static/images/message2.png" alt="..." class="img-rounded">
						</div>
						<div class="r_b_favorite">
							<img src="/static/images/message3.png" alt="..." class="img-rounded">
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div style="clear:both"></div>
	<jsp:include page="../include/s_footer.jsp" flush="true"></jsp:include>
</body>
</html>
