<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%
	Member user=null;
	if( (user=(Member)User.getUser("company",session) )==null)
			user=(Member)User.getUser("school",session);
	if(user==null){
		response.sendRedirect( request.getContextPath()+"/" );
	}
	String user_id=null;
	String user_type=null;
	String dep_name=null;
	if (user!=null){
		user_id=user.getUserId();
		user_type=user.getUserType();
		dep_name=user.getName();
	}
	String in_r="";
	if("school".equals(user_type) ){
		in_r="&in_r=sc";
	}else if("company".equals(user_type) ){
		in_r="&in_r=co";
	}
 %>