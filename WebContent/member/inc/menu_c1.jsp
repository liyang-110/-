<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.ComUserBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ComUserBean user = (ComUserBean) User.getUser(
			"company", session);

	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new Date());

	String company_name="";
	String company_status="";
	String member_type_name="";
	String cur_points="";
	String end_date="";
	String email_verify="";
	if(user!=null){
		 company_name=user.getName();
		 company_status=user.getStatus();
		 member_type_name=user.getMemberTypeName()==null?"体验会员":user.getMemberTypeName();
		 cur_points=user.getPoints();
		 end_date=user.getEndDate()==null?"0000-00-00":user.getEndDate();
		 email_verify=user.getEmailVerify();
	}else{
		return;
	}
	/*
	if( session.getAttribute("skip_verify_email")==null 
			&& request.getParameter("skip_email_verify")==null 
			&& user!=null &&  !"success".equals( email_verify) ){
		response.sendRedirect("/verifyEmail.do?t=com");
	}
	String company_pic="";
	*/
%>
<div class="left">
	<div class="left_top">
		<h3 class="school_name"><%=company_name %></h3>
    	<style type="text/css">
    		#member_info_card {
    			margin:20px auto 0 auto;
    		}
    		#member_info_card table td {border-bottom:1px solid #6AAE89; padding-left:5px;}
    		#member_info_card table th {font-weight:normal;}
    	</style>
    	<div id="member_info_card">
    	<table>
    	<tr><th>会员类型:</th><td><%="".equals(member_type_name )?"体验会员":member_type_name %></td></tr>
    	<tr><th>剩余点数:</th><td><%=cur_points %></td></tr>
    	<tr><th>会员截止:</th><td><%=end_date %></td></tr>
    	</table>
    	</div>
		<div style="clear:both;"></div>
	</div>
	<div class="left_top" style="display:none;">
		<div class="ren">
			<div class="left_ren">
				<img src="img/ren.png" height="122" width="90" />
			</div>
			<div class="right_ren">
				<ul>
					<li><a href="#">用户名</a>
					</li>
					<li><a href="#">有效期至2016.10.12</a>
					</li>
					<li><a href="#">会员类型</a>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="weixin">
			<ul>
				<li><a href="#"><img src="img/shouji.png" /><br />
					<span class="yellow">未认证</span>
				</a>
				</li>
				<li><a href="#"><img src="img/xinfeng.png" /><br />
					<span class="yellow">未认证</span>
				</a>
				</li>
				<li><a href="#"><img src="img/qq_a.png" /><br />
					<span>已绑定</span>
				</a>
				</li>
				<li><a href="#"><img src="img/weixin.png" /><br />
					<span>已绑定</span>
				</a>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="left_midder">
		<h1>基本信息</h1>
		<ul>
			<li>
				<a target="_blank" href="/company/info.do?id=<%=user.getCompanyId() %>">公司主页</a>
			</li>
			<li>
				<a href="alter_firm.jsp" >企业信息</a>
			</li>
			<li>
				<a href="jUploadFile.jsp" >招聘简章</a>
			</li>
			<li>
				<a href="account_firm.jsp" >修改密码</a>
			</li>
		</ul>
		<h1>职位管理</h1>
		<ul>
			<li><a href="jobposted_firm.jsp" >职位管理</a>
			</li>
			<li><a href="jobpost_firm.jsp" >发布职位</a>
			</li>
			<li><a href="interview_firm.jsp" >面试通知</a>
			</li>
			<li><a href="hire_firm.jsp" >录用通知</a>
			</li>
		</ul>
		<h1>招聘会管理</h1>
		<ul>
			<li><a href="schedule_firm.jsp" >预定成功招聘会</a>
			</li>
			<li><a href="schoolyard_firm.jsp" >申请校园招聘会</a>
			</li>
			<li><a href="networkyard_firm.jsp" >申请网络招聘会</a>
			</li>
			<%-- 
			<li><a href="teachin_firm.jsp" >校园宣讲会</a>
			</li>
			<li><a href="release_firm.jsp" >发布专场会</a>
			</li>
			--%>
			<li><a href="audit_firm.jsp" >审核招聘会邀请</a>
			<li><a href="schoolrecord_firm.jsp" >查询招聘会申请</a>
			</li>
		</ul>
		<h1>简历管理</h1>
		<ul>
			<li><a href="resume_firm.jsp" >最新简历库</a>
			</li>
			<li><a href="download_firm.jsp" >已下载简历</a>
			</li>
			<li><a href="receive_firm.jsp" >收到的简历</a>
			</li>
		</ul>
		<h1>通知管理</h1>
		<ul>
			<li><a href="urgency_firm.jsp" >系统消息</a>
			</li>

		</ul>
	</div>
	<div class="left_bottom">
		<img src="img/images/wanshan_29.gif" />
		<p>211校招网官方微信</p>
	</div>
</div>
