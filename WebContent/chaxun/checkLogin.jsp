<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String role_id="";
	boolean isLogin=false;
	int acc_type=0;
	AdUserBean user=(AdUserBean)User.getUser("admin",session);
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		role_id = user.getRoleId();
		acc_type=user.getAccType();
		
		session.setAttribute("public_key","www.211zph.com");
		isLogin=true;
		if( !"employ".equals( role_id ) ){
			response.sendRedirect("/chaxun/jJobFairSearchAD.jsp");
		}
	}
 %>
