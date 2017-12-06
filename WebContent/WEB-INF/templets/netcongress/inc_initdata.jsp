<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.HashMapFactory" %>
<%@ page import="com.zhaopin.bean.*" %>
<%
UserInterface user = (UserInterface)request.getAttribute("currentUser");
if( user==null ){
//	response.sendRedirect("/");
}
HashMap jobfairMap = (HashMap)request.getAttribute("jobfair");
String job_fair_id=jobfairMap.get("job_fair_id").toString();
String school_id=jobfairMap.get("school_id").toString();

if("201703080011704".equals( request.getParameter("id"))){
	request.setAttribute("onlineView",true);
}

String user_id = "";
String m_hxUser="";
String m_hxPass="";
String m_hxPic="";
String m_hxName="";

if(user!=null && "admin".equals( user.getUserType() )  ){
	user_id = user.getUserId();
	if(  "manager".equals( user_id ) ){
		m_hxUser = "hx_828644189df907a82ab82ef50be5241b";
		m_hxPass = "Zjt5pbxyGJ6I";
		m_hxPic = "";
		m_hxName = "211校招网管理员";
		user.setIMUser(m_hxUser, m_hxPass);
		user.setUserName(m_hxName);
		request.setAttribute("currentUser", user);
	}else if(  "kefu211".equals( user_id ) ){
		m_hxUser = "hx_ef10c694600f27536970c2c9246cf051";
		m_hxPass = "a5aNNJribX1D";
		m_hxPic = "";
		m_hxName = "211校招网客服";
		user.setIMUser(m_hxUser, m_hxPass);
		user.setUserName(m_hxName);
		request.setAttribute("currentUser", user);
	}

}
%>