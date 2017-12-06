<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String zk_type="";
	ZkUserBean user=(ZkUserBean)User.getUser("zhaoke",session);
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		zk_type=user.getType();
	}else{
		response.sendRedirect(request.getContextPath()+"/zk/login.jsp");
	}
 %>
