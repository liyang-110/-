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
	<script type="text/javascript">
		$(function(){
	
			$("#more-btn").bind("click",function(e){
				e.preventDefault();
				var pid="";
				try{
					pid=$("#resumeList li:last").attr("data-ref-id");
				}catch(e){
				}
				var $this = $(this);
				
				var page = $this.attr("data-page");
				var data = $("#search").serialize()+"&ajax=1&page="+page;
				
				var url="/netcongress/moreResume.do?pageSize=30&pid="+pid+"&<%=request.getQueryString()%>";
				$this.text("正在加载");
				$.post(url,
					data,
					function( d ){
						if( d.trim()=='' ){
							$this.text("没有了");
						}else{
							$this.attr("data-page",parseInt(page)+1 );
							$("#resumeList").append( d );
							$this.text("更多");
						}
						
					}
				);
			});
			$("#search_btn").bind("click",function(e){
				e.preventDefault();
				var $this = $(this);
				var page = 1; // $this.attr("data-page");
				var data = $("#search").serialize()+"&ajax=1&page="+page;
				var url="/netcongress/moreResume.do?<%=request.getQueryString()%>";
				// $this.text("正在加载");
				$.post(url,
					data,
					function( d ){
						if( d.trim()=='' ){
							$this.text("没有了");
						}else{
							$this.attr("data-page",parseInt(page)+1 );
							$("#resumeList").html( d );
							// $this.text("更多");
						}
						
					}
				);
			});
		});
		//查看简历，一键面试
		function IM_interview(api, hx_user,headpic,name ){
			api.close();
			IM_contact(hx_user,headpic,name );
		}
	</script>
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
		<p class="title">${jobfair.job_fair_name }</p>
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
				<a href="/netcongress/start.do?id=${param.id }&m=company">招聘大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=student">求职大厅</a>
				<span class="divider">|</span>
				<a href="/netcongress/start.do?id=${param.id }&m=result">面试结果</a>
			</c:when>
			<c:when test="${currentUser.userType eq 'admin' }">
				<a href="/netcongress/start.do?id=${param.id }&m=company">招聘大厅</a>
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
					<c:if test="${not empty jobfair.job_fair_organizer }">
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
	       <li class="active"><a href="/netcongress/start.do?id=${param.id }&m=student" >求职大厅</a></li>
	       <li><a href="/netcongress/start.do?id=${param.id }&m=company" class="on" >招聘大厅</a></li>
	 	</ul>
	 </div>
	 <div class="search">
	 
    <form id="search" class="form-inline" role="form" action="?<%=request.getQueryString() %>#searchlist" method="post">
       <div class="form-group">
       	  <input type="hidden" value="search" name="action" />
          <input type="text" class="form-control control" 
          	id="keyword" name="keyword"  value="${requestScope.keyword }"
          	placeholder="请输入专业或求职岗位关键字搜索">
       </div>
       <c:choose>
       <c:when test="${empty currentUser }">
       <button type="button"  onclick="open_login_layer();" class="btn btn-default search_btn">
  		<img src="/static/netcongress/image/search_icon.png" />
  	   </button>
       </c:when>
       <c:otherwise>
       <button type="submit" id="search_btn" class="btn btn-default search_btn">
       		<img src="/static/netcongress/image/search_icon.png" />
       </button>
       </c:otherwise>
	   </c:choose>
       <%
       	 pageContext.setAttribute("level", request.getParameter("level"));
       %>
       <c:set var="level" value="${pageScope.level }"/>
       <div class="form-group quick_search ">
       	   &nbsp;&nbsp;<a class="${level=='level_03'?'on':'' }" href="?id=${param.id }&m=${empty param.m?'':param.m }&level=level_03">高职</a>
       	   &nbsp;&nbsp;<a class="${level=='level_07'?'on':'' }" href="?id=${param.id }&m=${empty param.m?'':param.m }&level=level_07">大专</a>
       	   &nbsp;&nbsp;<a class="${level=='level_02'?'on':'' }" href="?id=${param.id }&m=${empty param.m?'':param.m }&level=level_02">本科</a>
       	   &nbsp;&nbsp;<a class="${level=='level_01'?'on':'' }" href="?id=${param.id }&m=${empty param.m?'':param.m }&level=level_01">研究生</a>
        <c:if test="${not empty requestScope.where }">
       	   &nbsp;&nbsp;<a href="?id=${param.id }&m=${empty param.m?'':param.m }">不限</a>
       </c:if>
       </div>
    </form>
	 
	 </div>
</div>
<div class="container">
	<div class="main">
		<ul class="list" id="resumeList">
			<c:forEach var="row" items="${studentList }">
			<li class="item" data-ref-id="${row.student_id }">
				<div class="student">
					<div class="photo">
					<c:choose>
						<c:when test="${not empty row.head_pic}">
						<img class="img-circle" src="//cdn.211zph.com/upload/headpic/${row.head_pic }?x-oss-process=style/62x62" />
						</c:when>
						<c:when test="${row.sex eq '男' }">
						<img src="/static/netcongress/image/default_boy.png"/>
						</c:when>
						<c:when test="${row.sex eq '女' }">
						<img src="/static/netcongress/image/default_girl.png"/>
						</c:when>
						<c:otherwise>
						<img src="/static/netcongress/image/default_boy.png"/>
						</c:otherwise>
					</c:choose>
					</div>
					<div class="score">
						${row.resume_score }<br/><span class="percent">%</span>
					</div>
					<div  class="name">
						<c:choose>
						<c:when test="${currentUser.userType eq 'admin'}">
						<a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')" 
			            	href="javascript:;">
			            	${row.name}
			            </a>
			            </c:when>
						<c:when test="${currentUser.userType eq 'company'}">
						<a onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')" 
			            	href="javascript:;">
			            	${row.name}
			            </a>
			            </c:when>
			            <c:otherwise>
			            <a href="javascript:;" onclick="open_login_layer();">${row.name}</a>
			            </c:otherwise>
			            </c:choose>
					</div>
					<div >
						<p class="position">
						<c:choose>
						<c:when test="${currentUser.userType eq 'admin'}">
						<a  onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')" 
			            	href="javascript:;">
			            	${empty row.hope_positions?'不限':row.hope_positions}
			            </a>
			            </c:when>
						<c:when test="${currentUser.userType eq 'company'}">
						<a  onclick="open_resume_layer('/company/resumeDetail.do?netcongress=true&id=${row.student_id}')" 
			            	href="javascript:;">
			            	${empty row.hope_positions?'不限':row.hope_positions}
			            </a>
			            </c:when>
			            <c:otherwise>
			            <a href="javascript:;" onclick="open_login_layer();">${empty row.hope_positions?'不限':row.hope_positions}</a>
			            </c:otherwise>
			            </c:choose>
						</p>
					</div>
					<div class="action">
						<button class="btn btn-success" onclick="$('#wellcomeModalDiialog').modal({});">手机视频</button>
						<c:choose>
							<c:when test="${empty requestScope.currentUser }">
								<button type="button" class="btn btn-info" onclick="open_login_layer();">电脑面试</button>	  
							</c:when>
							<c:when test="${requestScope.onlineView }">
								<c:choose>
									<c:when test="${currentUser.userType eq 'admin' }">
										<button class="btn btn-info" 
											onclick="IM_contact('${row.hx_user }','${row.head_pic }','${row.name }');">一键面试</button>
									</c:when>
									<c:when test="${requestScope.published }">
										<button class="btn btn-info" 
											onclick="IM_contact('${row.hx_user }','${row.head_pic }','${row.name }');">一键面试</button>
									</c:when>
									<c:when test="${requestScope.reserved}">
										<button class="btn btn-info" 
											onclick="IM_contact('${row.hx_user }','${row.head_pic }','${row.name }');">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'student' }">
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您不可以这么做呦','face-sad')">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'school' }">
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您不是主办单位，不能发起视频交流','face-sad')">一键面试</button>
									</c:when>
									<c:when test="${currentUser.userType eq 'company' }">
				        				<button type="button" class="btn btn-info" style="width:72px;padding-left:7px;" onclick="msg_alert('提示信息','您没有预定本场招聘会，不能发起在线面试！','face-sad')">一键面试</button>
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
		<div style="border:#fff 1px solid;margin:auto;width:300px;">
			<c:choose>
			<c:when test="${empty currentUser }">
				<div href="javascript:;" style="line-height:36px;color:#FFF;display:block;text-align:center;">
					查看更多，请<a href="javascript:;" onclick="open_login_layer();">登录</a>
				</div>
			</c:when>
			<c:otherwise>
				<a id="more-btn" href="javascript:;" style="line-height:36px;color:#FFF;display:block;text-align:center;">更多</a>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<jsp:include page="inc_easemobim.jsp" flush="true"/>
<jsp:include page="inc_footer.jsp" flush="true" />
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>