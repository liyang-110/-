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
<script type="text/javascript" src="BaseCodeEdit.js"   charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="10%">类型编码：</td>
		<td width="90%"><input readonly id="in_base_type" name="in_base_type" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td width="10%">排序：</td>
		<td width="90%"><input id="in_base_no" name="in_base_no" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td width="10%">编码：</td>
		<td width="90%"><input readonly id="in_base_code" name="in_base_code" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td width="10%">名称：</td>
		<td width="90%"><input id="in_base_name" name="in_base_name" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td width="10%">会员初始点数：</td>
		<td width="90%"><input readonly id="in_memo" name="in_memo" class="easyui-numberbox" value="0" required="true"  /></td>
	</tr>
	<tr>
		<td width="10%">BASETYPE_NAME：</td>
		<td width="90%"><input readonly id="in_basetype_name" name="in_basetype_name" class="easyui-validatebox"   /></td>
	</tr>
	<tr>
		<td width="10%">BASECODE_TYPE：</td>
		<td width="90%"><input readonly id="in_basecode_type" name="in_basecode_type" class="easyui-numberbox" value="0" required="true"  /></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
