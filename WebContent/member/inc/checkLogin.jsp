<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.bean.*" %>
<%
	String user_id="";
	String user_code="";
	String student_id="";
	String area_id="";
	String name="";
	StudentSessionBean user=(StudentSessionBean)User.getUser("student",session);
	if( user !=null )
	{
		user_id = user.getUserId();
		user_code = user.getUserCode();
		student_id = user.getStudentId();
		area_id = user.getAreaId();
		name=user.getUserName();
	}else{
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
 %>
