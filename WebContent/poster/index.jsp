<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.dao.factory.PosterTempletModel" %>
<%@ page import ="com.zhaopin.dao.factory.PosterOrdersModel" %>

<%
String content="";
String id=request.getParameter("id"); 
String oid=request.getParameter("oid"); 
if(id!=null && !"".equals(id)){
	PosterTempletModel poster=new PosterTempletModel();
	content=poster.getContent(id);
}else if(oid!=null && !"".equals(oid)){
	PosterOrdersModel poster=new PosterOrdersModel();
	content=poster.getContent(oid);
}else{
	response.sendRedirect( request.getContextPath() );
}

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
