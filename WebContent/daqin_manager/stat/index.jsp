<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <a href="daqin_manager/stat/jCompanyAttendJobfair.jsp">1</a><br>
    <a href="daqin_manager/stat/jCompanyOrdersDown.jsp">2</a><br>
    <a href="daqin_manager/stat/jCompanyOrdersReceive.jsp">3</a><br>
    <a href="daqin_manager/stat/jJobfairCompany.jsp">4</a><br>
    <a href="daqin_manager/stat/jSchoolCompany.jsp">5</a><br>
    <a href="daqin_manager/stat/jSchoolJobfair.jsp">6</a><br>
  </body>
</html>
