<%@page import="cn.com.zhaopin.base.pub.cCharControl"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="include/checkLogin.jsp" %>
<%
	String company_id=request.getParameter("id");
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
		var company_id="<%=company_id%>";
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
	<script type="text/javascript" src="CompanySearchQuick.js" charset="utf-8"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/panel.css" type="text/css"></link>
 	<script type="text/javascript">
	 $(function(){

	 });
	</script>
  </head>
  <body>      
  <div class="easyui-layout" style="width: 100%; height: 350px;" data-options="fit:true">
		<div data-options="region:'north',border : false" style="background:#F4F4F4;">
				<div style="padding:5px 0 5px 20px;height:30px;">
		   		<form name="fm" id="fm" method="post">
		   		   <table>
						<tr>
						<%
						String company_name = cCharControl.ISOtoUTF8(
								request.getParameter("in_company_name")==null?"":request.getParameter("in_company_name")
						);
						
						%>
						<td>企业名称:<input class="easyui-validatebox" style="width:250px;" name="in_company_name" value="<%=company_name%>"/>
						</td>
						<td><input type="button" onclick="searchCompany();" class="easyui-linkbutton" value="搜索"/>
						</td>
						</tr>
					</table>
				  </form>
				 </div>
		</div>
				<div data-options="region:'center',split:true,border:false">
					<table id="datagrid" name='datagrid'>
					</table>
				</div>
  </div>
  </body>
</html>
