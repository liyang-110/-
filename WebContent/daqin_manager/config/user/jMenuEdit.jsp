<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="./MenuEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	<%
		String id = request.getParameter("id");
	%>
</script>
<style>
	input[type=text] {
		width:200px;
	}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>编码：</td>
		<td><input type="text" id="in_menu_id" name="in_menu_id" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td>操作名称：</td>
		<td><input type="text" id="in_menu_name" name="in_menu_name" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td>操作路径：</td>
		<td><input type="text" id="in_menu_url" name="in_menu_url" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td>父节点：</td>
		<td><input type="text" id="in_parent_id" name="in_parent_id" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td><br /><br /></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
