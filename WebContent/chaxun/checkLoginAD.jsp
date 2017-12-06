<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String role_id="";
	boolean isLogin=false;
	int acc_type=0;
	AdUserBean user=(AdUserBean)User.getUser("admin",session);
	if( user== null ){
		response.sendRedirect("/chaxun/index.jsp");
	}else if( "employ".equals( user.getRoleId() ) )
	{
		response.sendRedirect("/chaxun/index.jsp");
	}else{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		role_id = user.getRoleId();
		acc_type=user.getAccType();
	}
 %>
