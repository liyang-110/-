<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.dao.factory.PosterTempletModel" %>
<%
String id=request.getParameter("id"); 
if(id==null || "".equals(id)){
	response.sendRedirect( request.getContextPath() );
}
PosterTempletModel poster=new PosterTempletModel();
String content=poster.getContent(id);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  <%=content %>
  </body>
</html>
