<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ include file="../../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
<script type="text/javascript" src="MailTemplateAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">模板编码：</td>
		<td><input id="in_tpl_id" name="in_tpl_id" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td class="tabright">模板名称：</td>
		<td><input id="in_tpl_name" name="in_tpl_name" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">邮件主题：</td>
		<td><input id="in_tpl_subject" name="in_tpl_subject" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">邮件内容：</td>
		<td>
		<FCK:editor instanceName="in_tpl_content"  height="400px">
				<jsp:attribute name="value">    
                   
                </jsp:attribute>
		</FCK:editor>
		</td>
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
