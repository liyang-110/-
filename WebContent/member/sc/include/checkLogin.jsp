<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String school_id="";
	String area_id="";
	SchUserBean user=(SchUserBean)User.getUser("school",session);
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		school_id = user.getId();
		area_id = user.getAreaId();
	}else{
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
 %>
