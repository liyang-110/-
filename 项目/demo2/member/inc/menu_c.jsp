<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.ComUserBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
       <dl class="left_menu">
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="/member/img2/one.png" height="18" width="18" /></span>基本信息<span class="jiantou"> <img src="/member/img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
						<li>
							<a href="/member/alter_firm.jsp" >企业信息</a>
						</li>
						
						<li>
							<a href="/company/rechargeable.do" >在线支付</a>
						</li>
						
						<li>
							<a href="/member/jUploadFile.jsp" >招聘简章</a>
						</li>
						<li>
							<a href="/member/account_firm.jsp" >修改密码</a>
						</li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="/member/img2/two.png" height="18" width="18"/></span>职位管理<span class="jiantou"><img src="/member/img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
			<li><a href="/member/jobposted_firm.jsp" >职位管理</a>
			</li>
			<!-- <li><a href="/member/jobpost_firm.jsp" >发布职位</a>
			</li> -->
			<li><a href="/member/interview_firm.jsp" >面试通知</a>
			</li>
			<li><a href="/member/hire_firm.jsp" >录用通知</a>
			</li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="/member/img2/three.png" height="18" width="18" /></span>招聘会管理<span class="jiantou"><img src="/member/img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
			<li><a href="/member/schedule_firm.jsp" >预定成功招聘会</a>
			</li>
			<li><a href="/member/schoolyard_firm.jsp" >申请校园招聘会</a>
			</li>
			<li><a href="/member/networkyard_firm.jsp" >申请网络招聘会</a>
			</li>
			<%-- 
			<li><a href="/member/teachin_firm.jsp" >校园宣讲会</a>
			</li>
			<li><a href="/member/release_firm.jsp" >发布专场会</a>
			</li>
			--%>
			<li><a href="/member/audit_firm.jsp" >查看招聘会邀请</a>
			<li><a href="/member/schoolrecord_firm.jsp" >查询招聘会申请</a>
			</li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="/member/img2/four.png" height="18" width="18" /></span>简历管理<span class="jiantou"><img src="/member/img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
			<li><a href="/member/resume_firm.jsp" >最新简历库</a>
			<li><a href="/company/unemployed.do" >离校未就业人才库</a>
			</li>
			<li><a href="/company/rencai.do" >精英人才库
				<img src="/member/img2/free_down2.png" />
				</a>
			</li>
			<li><a href="/member/download_firm.jsp" >已下载简历</a>
			</li>
			<li><a href="/member/receive_firm.jsp" >收到的简历
			<c:if test="${not empty count.untreated }">
			<span title="最近一月未处理简历" style="background:#e03919;color:#fff;border-radius:6px;margin-left:5px;letter-spacing:2px;padding-left:2px;">
			${count.untreated }
			</span>
			</c:if>
			</a>
			</li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="/member/img2/five.png" height="18" width="18" /></span>通知管理<span class="jiantou"><img src="/member/img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li><a href="/member/urgency_firm.jsp" >系统消息</a></li>
						<%-- <li><a href="/member/points_log_firm.jsp">
						点数使用记录</a></li>
			<% if( user!=null && "3".equals( user.getChargeType() ) ){ %>
                 		<li><a href="/member/jobfair_log_firm.jsp">
                 		套餐使用记录</a></li>
      		<%}%> --%>
      			
                        
                    </ul>     
                </dd>  
            </dl>
            <!--折叠-->
            <script type="text/javascript">
			$(function(){	
				//导航切换
				$(".menuson .header").click(function(){
					var $parent = $(this).parent();
					$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
					
					$parent.addClass("active");
					if(!!$(this).next('.sub-menus').size()){
						if($parent.hasClass("open")){
							$parent.removeClass("open").find('.sub-menus').hide();
						}else{
							$parent.addClass("open").find('.sub-menus').show();	
						}
						
						
					}
				});
				
				// 三级菜单点击
				$('.sub-menus li').click(function(e) {
					$(".sub-menus li.active").removeClass("active")
					$(this).addClass("active");
				});
				
				$('.title').click(function(){
					var $ul = $(this).next('ul');
					$('dd').find('.menuson').slideUp();
					if($ul.is(':visible')){
						$(this).next('.menuson').slideUp();
					}else{
						$(this).next('.menuson').slideDown();
					}
				});
			})	
			</script>
</div>
