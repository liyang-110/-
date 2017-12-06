<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.NewsModel" %>
<%@ page import="com.zhaopin.dao.factory.JobFairModel" %>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%
	String base_dir =request.getContextPath()+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta name="Keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="Description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<title><%=com.zhaopin.Config.getSiteTitle() %></title>

<link href="../assets2/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="../assets2/styles/global.css" />

<script src="../assets2/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets2/jquery/jquery.form.js" type="text/javascript"></script>
<script src="../assets2/js/jquery.validate.min.js" type="text/javascript"></script> 

<script src="../assets2/artDialog/artDialog.js?skin=green"></script>

<script type="text/javascript" src="../assets2/scripts/login.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="../assets2/slide/slide.css" />
<script type="text/javascript" src="../assets/slide/g.base.js"></script>

<script type="text/javascript">
	if (window!=top) // 判断当前的window对象是否是top对象
		top.location.href =window.location.href; 
</script>
<script type="text/javascript" src="../assets2/scripts/front.js"></script>
</head>
<body>
	<jsp:include  page="../include2/head.jsp" flush="true"/>
	<div style="background:url(weixin.jpg);height:1154px;width:1000px;margin:auto;">
	</div>
	<jsp:include  page="../include2/footer.jsp" flush="true"/>
</body>
</html>