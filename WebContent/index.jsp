<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="com.zhaopin.StationSwitch"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String site_id = request.getParameter("a");
	if( site_id == null ){
		StationSwitch s= new StationSwitch(request,response);
		site_id = s.getSiteId();
	}
	if( StringUtils.isBlank(site_id)  ){
		response.sendRedirect("/site.do?a=28" );
	}else{
		response.sendRedirect("/site.do?a="+site_id );
	}
%>