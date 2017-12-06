<%@page import="com.zhaopin.StationSwitch"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	StationSwitch s= new StationSwitch(request,response);
	String site_id = s.getSiteId();
	if( site_id!=null && !site_id.equals("") ){
		response.sendRedirect("/site.do?a="+site_id );
		return;
	}else{
		response.sendRedirect("/shaanxi" );
		return;
	}
%>