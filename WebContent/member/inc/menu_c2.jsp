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
       <dl class="left_menu">
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="img2/one.png" height="18" width="18" /></span>基本信息<span class="jiantou"><img src="img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li class="one"><a href="#" class="one">企业信息</a></li>
                        <li><a href="#">招聘简章</a></li>
                        <li><a href="#">修改密码</a></li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="img2/two.png" height="18" width="18"/></span>职位管理<span class="jiantou"><img src="img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li><a href="#">发布职位</a><i></i></li>
                        <li><a href="#">面试通知</a></li>
                        <li><a href="#">录用通知</a></li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="img2/three.png" height="18" width="18" /></span>招聘会管理<span class="jiantou"><img src="img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li><a href="#">预订成功招聘会</a></li>
                        <li><a href="#">申请校园招聘会</a></li>
                        <li><a href="#">申请网络招聘会</a></li>
                        <li><a href="#">审核招聘会邀请</a></li>
                        <li><a href="#">查询招聘会申请</a></li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="img2/four.png" height="18" width="18" /></span>简历管理<span class="jiantou"><img src="img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li><a href="#">最新简历库</a></li>
                        <li><a href="#">已下载简历</a></li>
                        <li><a href="#">收到的简历</a></li>
                    </ul>     
                </dd>
                <dd>
                    <div class="title">
                    	<span class="anniu"><img src="img2/five.png" height="18" width="18" /></span>通知管理<span class="jiantou"><img src="img2/jiantou.png"></span>
                    </div>
                    <ul class="menuson">
                        <li><a href="#">系统消息</a></li>
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
