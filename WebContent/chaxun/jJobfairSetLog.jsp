<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="checkLogin.jsp" %>
<%
	String id=request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var cur_path = "<%=request.getContextPath()%>";
		var user_code="<%=id%>";
	  	
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="JobfairSetLog.js" charset="utf-8"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
 	<script type="text/javascript">
	 $(function(){

	 });
	</script>
  </head>
  
  <body>      
  <div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
				<div data-options="region:'center',split:true,border:false">
					<table id="notice" name='notice'>
					</table>
				</div>
			</div>
	</body>
</html>
