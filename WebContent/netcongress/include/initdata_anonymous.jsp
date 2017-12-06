<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ page import="com.zhaopin.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

UserInterface userI = (UserInterface)request.getAttribute("currentUser");
/*
if( user==null ){
	//	response.sendRedirect("/");
}
*/
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
String job_fair_id=jobfairMap.get("job_fair_id").toString();
String school_id=jobfairMap.get("school_id").toString();
%>