<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var gi_pagesize = "<%=request.getParameter("pagesize")%>";
	var gi_pagenum = "<%=request.getParameter("pagenum")%>";
	var gi_currentnum = "<%=request.getParameter("currentnum")%>";
	var operuser="<%=user_code%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="./ZhaokeView.js" charset="utf-8"></script>
<script type="text/javascript">
	var user_code = "<%=request.getParameter("id")%>";
	var area_id= "<%=request.getParameter("area_id")%>";
	var company_id= "<%=request.getParameter("company_id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="30%">招客账号：</td>
		<td width="70%" id="in_user_id"></td>
	</tr>
	<tr>
		<td>招客姓名：</td>
		<td id="in_user_name"></td>
	</tr>
	<tr>
		<td>电话：</td>
		<td id="in_user_tel"></td>
	</tr>
	<tr>
		<td>用户邮箱：</td>
		<td id="in_user_email"></td>
	</tr>
	<tr>
		<td>发消息：</td>
		<td><textarea name="in_message" id="in_message" cols="30" row="7"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">发送</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">关闭</a>

		</td>
	</tr>
</table>
</form>
</body>
</html>
