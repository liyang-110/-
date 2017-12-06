<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc_initdata.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>${jobfair.job_fair_name }</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">

	<link href="/static/netcongress/style/hall.css" rel="stylesheet">

	<script src="/static/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
	<script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/jquery/jquery.cookie.js" type="text/javascript"></script>    
    <script src="/static/jquery/jquery.form.js" type="text/javascript" charset="utf-8"></script>   
    <script src="/static/jquery/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script> 

	<script type="text/javascript" src="/member/js/front.js" charset="utf-8"></script>
	
	<script src="/static/artDialog/artDialog.js?skin=green"></script>
	<script src="/static/artDialog/plugins/iframeTools.js"></script>

	<script type="text/javascript" src="/static/netcongress/js/jquery-scrollable.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/netcongress/js/jquery.textSearch-1.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/netcongress/js/flow.js" charset="utf-8"></script>
	
	<jsp:include page="inc_weixin.jsp" flush="true" />
</head>
<body>
<div class="header">
	<div class="left">
		<a href="//www.211zph.com/" target="_blank">
		<img class="logo" src="/static/netcongress/image/logo_white.png" />
		</a>
	</div>
	<div class="right">
		<div class="title">${jobfair.job_fair_name }</div>
	</div>
</div>
<div class="right_panel">
	<div class="panel_conn">
		<div class="panel">
			<h5 class="title">
				<c:choose>
					<c:when test="${empty currentUser }">
						<a href="javascript:;" onclick="open_login_layer();">
							<span class="name">登录</span>
						</a>
					</c:when>
					<c:otherwise>
					<c:if test="${currentUser.userType eq 'company' }">
						<span class="name">${currentUser.companyName }</span>
					</c:if>
					<c:if test="${currentUser.userType eq 'school' }">
						<span class="name">${currentUser.name }</span>
					</c:if>
					<c:if test="${currentUser.userType eq 'student' }">
						<span class="name">${currentUser.userName }</span>
						<a href="/member/home.do" target="_blank">个人中心</a>
					</c:if>
					<c:if test="${currentUser.userType eq 'admin' }">
						<span class="name">${currentUser.userName }</span>
					</c:if>
					<a class="exit" href="/loginOut.do?method=exitData">【退出】</a>
					</c:otherwise>
				</c:choose>
			</h5>
			<p class="control">
			<c:choose>
			<c:when test="${currentUser.userType eq 'student' }">
				<a href="/netcongress/start.do?id=${param.id }&m=resume">已投简历</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=interview">面试机会</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=result">面试结果</a>
			</c:when>
			<c:when test="${currentUser.userType eq 'company' }">
				<a href="/member/home.do" target="_blank">会员中心</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=resume">收到简历</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=result">面试结果</a>
			</c:when>
			<c:when test="${currentUser.userType eq 'school' }">
				<a href="/netcongress/start.do?id=${param.id }">招聘大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=student">求职大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=result">面试结果</a>
			</c:when>
			<c:when test="${currentUser.userType eq 'admin' }">
				<a href="/netcongress/start.do?id=${param.id }">招聘大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=student">求职大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=result">面试结果</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:;" onclick="open_login_layer();">已投简历</a>
				<span class="divider">|</span>
				<a href="javascript:;" onclick="open_login_layer();">面试机会</a>
				<span class="divider">|</span>
				<a href="javascript:;" onclick="open_login_layer();">面试结果</a>
			</c:otherwise>
			</c:choose>	
			</p>
		</div>

		<div class="panel">
			<h5>会场动态

				<p style="color:#FFF;line-height:20px;">
				单位<span style="color:#93fbff;">${statistics.company_num}</span>家，
	        	<!--  职位<span>${statistics.position_num}</span>个，-->
	        	岗位<span style="color:#93fbff;">${statistics.job_person_num}</span>个，
	        	入场<span style="color:#93fbff;">${statistics.resume_size}</span>人
        		</p>
        		
			</h5>
			<div>
                <ul class=" scroll-ul-a">
                	<c:forEach var="row" items="${lastestLog }">
                		<li><a title="${row.diff }&nbsp;&nbsp;${row.content}">
	            			${row.diff }&nbsp;&nbsp;${row.content}
	            			</a></li>
                	</c:forEach>
                </ul>
                <script type="text/javascript">
              	$(".scroll-ul-a").scrollable({
					direction: "top",
					height: 156,
					scrollCount: 1,
					delay : 1000 
				});
              	</script>
			</div>
			<h5>招聘会基本信息</h5>
			<div>
				<dl>
					<dt>主办：</dt>
					<dd>
					<a href="/jobfair/school.do?id=${jobfair.school_id}" target="_blank">
						${jobfair.job_fair_sponsor }
					</a>
					</dd>
					<c:if test="${not empty jobfair.job_fair_organizer}">
					<dt>承办：</dt>
					<dd>${jobfair.job_fair_organizer }</dd>
					</c:if>
					<c:if test="${not empty jobfair.cooperate_organizer }">
					<dt>协办：</dt>
					<dd>${jobfair.cooperate_organizer }</dd>
					</c:if>
					<dt>时间：</dt>
					<dd>${jobfair.jobfair_time_string }</dd>
					<!--
					<dt>特色：</dt>
					<dd>${jobfair.job_fair_feature }</dd>
					-->
					<dt>层次：</dt>
					<dd>${jobfair.job_fair_level }</dd>
				</dl>
			</div>
			<h5 class="bdsharebuttonbox">
				<a style="float:left;padding-left:0;font-size:14px;background: none;color:#fff998;text-decoration:none;cursor: default;">分享到：</span>
				<a href="javascript:;" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
				<a href="javascript:;" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
				<a href="javascript:;" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
				<a href="javascript:;" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
			</h5>
			<h5>注意事项：</h5>
			<div class="zhuyisy">
				<p>1、如果出现“与服务器断开”提示，请关闭其余会场页面，并刷新当前会场页面或者重新登录；
				</p>
				<p>2、为保证视频面试通话流畅，请使用360极速浏览器。
				</p>
				<p>
					<a class="a1" target="_blank" href="http://chrome.360.cn/">
						<img src="/static/netcongress/image/360.png" />
					</a>
					<a class="a2" target="_blank" href="http://chrome.360.cn/">点击下载</a>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="section1">
	<div class="menu">
		<ul class="nav nav-pills">
	       <li><a href="/netcongress/start.do?id=${param.id }&m=student" >求职大厅</a></li>
	       <li class="active"><a href="/netcongress/start.do?id=${param.id }&m=company" class="on" >招聘大厅</a></li>
	 	</ul>
	 </div>
	 <div class="search">
    <form id="search" name="head_search" action="?id=${param.id }" method="post" onsubmit="return ajaxFindInPage(this.string.value);" class="form-inline" role="form">
       <div class="form-group">
          <input type="text" class="form-control control" id="name" name="string" placeholder="请输入企业名称或应聘职位"/>
       </div>
       <button type="submit" id="search_btn" class="btn btn-default search_btn">
       		<img src="/static/netcongress/image/search_icon.png" />
       </button>
       <span id="head_search_result"></span>
    </form>
	 </div>
</div>
<div class="container">
	<div class="main">
		<ul class="list" id="job_fair_company_list_result">
		</ul>
		<ul class="list" id="job_fair_company_list">
			<c:forEach var="row" items="${companyList }">
			<li class="item cont_pull">
				<div class="company">
					<div>
					<table style="width:195px;">
						<tr>
						<td>
						<img src="/static/netcongress/image/job_hunter.png"/>
						</td>
						<td>
						<img class="computer" src="/static/netcongress/image/computer.png"/>
						</td>
						<td>
						<img src="/static/netcongress/image/hr.png"/>
						</td>
						</tr>
					</table>	
					</div>
					<div class="table_no">
						${row.rn }
					</div>
					<div class="caption">
						<a title="${row.company_name }" href="/company/info.do?id=${row.company_id }" target="_blank">
		        			${row.company_name }
		        		</a>
					</div>
					<div class="position">
						<c:forEach var="job" items="${row.jobs }">
	                    <p>
	                    <a title="${job.job_name }" href="/company/jobDetail.do?id=${job.job_id }" target="_blank">
	                    ${job.job_name }</a>
	                    <span class="num">（简历${job.resumecount }份）</span>
	                    </p>
						</c:forEach>
					</div>
					<div class="action">
						<p class="more">共发布<span class="num">${empty row.recruit_count?0:row.recruit_count }</span>个职位</p>

				        <button type="button" class="btn btn-success" onclick="$('#wellcomeModalDiialog').modal({});">手机面试</button>
						<c:choose>
							<c:when test="${empty requestScope.currentUser }">
								<button type="button" class="btn btn-info" onclick="open_login_layer();">电脑面试</button>	  
							</c:when>
							<c:when test="${requestScope.onlineView }">
								<c:choose>
									<c:when test="${currentUser.userType eq 'student' }">
					       				<button type="button" class="btn btn-info" onclick="IM_contact('${row.hx_user }','','${row.company_name }');">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'admin' }">
					       				<button type="button" class="btn btn-info" onclick="IM_contact('${row.hx_user }','','${row.company_name }');">一键面试</button>
									</c:when>
									<c:when test="${requestScope.published }">
					       				<button type="button" class="btn btn-info" onclick="IM_contact('${row.hx_user }','','${row.company_name }');">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'school' }">
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您不是主办单位，不能发起视频交流','face-sad')">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'company' }">
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您不可以这么做呦','face-sad')">一键面试</button>
									</c:when>
									<c:otherwise>
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','没有权限，请与管理员联系','face-sad')">一键面试</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
				 		       	<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','网络招聘会举办期间，才能进行视频面试！','face-sad');">一键面试</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		<div style="clear:both;"></div>
	</div>
</div>
<jsp:include page="inc_easemobim.jsp" flush="true"/>
<jsp:include page="inc_footer.jsp" flush="true" />
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

</body>
</html>