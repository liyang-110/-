<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String company_id="";
	String area_id="";
	String company_name="";
	boolean expire=false;
	String company_status="0";
	String member_type="";
	String member_type_name="";
	String cur_points="";
	String end_date="";
	String email_verify="";
	ComUserBean user=(ComUserBean)User.getUser("company",session);
	
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		company_id = user.getCompanyId();
		company_name = user.getCompanyName();
		area_id = user.getAreaId();
		expire=user.isExpire();
		company_status=user.getStatus();
		member_type=user.getMemberType();
		member_type_name=user.getMemberTypeName()==null?"体验会员":user.getMemberTypeName();
		cur_points=user.getPoints();
		end_date=user.getEndDate()==null?"0000-00-00":user.getEndDate();
		email_verify=user.getEmailVerify();
		/*
		if( session.getAttribute("skip_verify_email")==null 
				&& request.getParameter("skip_email_verify")==null 
				&&  !"success".equals( email_verify) ){
			response.sendRedirect("/verifyEmail.do?t=com");
			return;
		}
		*/
		{
			pageContext.setAttribute("company_status", company_status );
			pageContext.setAttribute("member_type", member_type );
		}
	}else{
		response.sendRedirect(request.getContextPath()+"/");
		return;
	}
 %>
