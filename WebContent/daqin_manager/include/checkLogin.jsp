<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String role_id="";
	int acc_type=0;
	AdUserBean user=(AdUserBean)User.getUser("admin",session);
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		role_id = user.getRoleId();
		acc_type=user.getAccType();
		if("employ".equals( role_id ) ){
			response.sendRedirect(request.getContextPath()+"/chaxun/");
			return;
		}else if( user_id.startsWith("kefu") ){
			response.sendRedirect(request.getContextPath()+"/kefu/");
			return;
		}
	}else{
		response.sendRedirect(request.getContextPath()+"/daqin_manager/login.jsp");
		return;
	}
 %>
