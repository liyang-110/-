<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="BaseCodeView.js"></script>
<script type="text/javascript">
	var id = "<%=request.getParameter("id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="10%">类型：</td>
		<td width="90%" id="in_base_type"></td>
	</tr>
	<tr>
		<td width="10%">排序：</td>
		<td width="90%" id="in_base_no"></td>
	</tr>
	<tr>
		<td width="10%">编码：</td>
		<td width="90%" id="in_base_code"></td>
	</tr>
	<tr>
		<td width="10%">名称：</td>
		<td width="90%" id="in_base_name"></td>
	</tr>
	<tr>
		<td width="10%">类型：</td>
		<td width="90%" id="in_basetype_name"></td>
	</tr>
	<tr>
		<td width="10%">类型：</td>
		<td width="90%" id="in_basecode_type"></td>
	</tr>
	<tr>
		<td width="10%">时间：</td>
		<td width="90%" id="in_oper_date"></td>
	</tr>
</table>
</form>
</body>
</html>
