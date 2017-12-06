<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.bean.User"%>
<%@page import="com.zhaopin.bean.AdUserBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String user_name = request.getParameter("user_id");
String user_pass = request.getParameter("user_pass");

if("logout".equals( request.getParameter("exit") ) ){
	session.invalidate();
	response.sendRedirect( request.getContextPath()+"/chaxun" );
}else if( "zhaopinhui".equals( user_name ) && "88662468".equals( user_pass ) ){
	AdUserBean ad = new AdUserBean();
	ad.setRoleId("employ");
	ad.setUserId("211zph");
	ad.setUserCode("88662468");
	User.setLogin(ad,session);
	// session.setAttribute("public_key","www.211zph.com");
	session.setAttribute("chaxun","admin");
	response.getWriter().write("huiwu");
}else{
	response.getWriter().write("failure");
}
%>