<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"  %>
<%@include file="/member/inc/checkLogin_c.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'package.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/bootstrap.nav.css"  />
	<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
	<link type="text/css" rel="stylesheet" href="/member/img2/core.css" />

	<link type="text/css" rel="stylesheet" href="/member/style/first_firm.css" />
	<link type="text/css" rel="stylesheet" href="/member/style/alter_firm.css" />

	<script type="text/javascript" src="/member/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>

<jsp:include page="/member/inc/header_c2.jsp" flush="true" />
<div class="container">
	<div class="cont">
    	<jsp:include page="/member/inc/menu_c.jsp" flush="true"/>
        <!--left完成-->
        <div class="right">
        	您的企业帐号未通过审核， 请上传营业执照，组织机构代码证，联系招聘顾问进行审核。
        </div>
        <div class="clear"></div>	
    </div>
    <!--cont完成-->
</div>
 <jsp:include page="/member/inc/footer_c.jsp" flush="true"  />
 
 </body>
</html>
