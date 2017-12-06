<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@page import="com.zhaopin.database.cDataControlA"%>
<%@ include file="../../include/checkLogin.jsp" %>
<%
String id=request.getParameter("id").toString();  
 
cDataControlA cdata = new cDataControlA();
String content=""; 
content=cdata.GetFirfield("select to_char(content) from tbl_zp_fuwu where fuwu_id='"+id+"'");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="MailTemplateEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	
</script>
<style type="text/css">
.readonly {
	background:#F4F4F4;
	cursor:crosshair;
}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">编码：</td>
		<td><input id="in_fuwu_id" name="in_fuwu_id" class="easyui-validatebox readonly" readonly /></td>
	</tr>
	<tr>
		<td class="tabright">名称：</td>
		<td><input id="in_title" name="in_title" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">邮件内容：</td>
		<td>
		<FCK:editor instanceName="in_content"  height="200px">
				<jsp:attribute name="value">    
                   <%=content %>
                </jsp:attribute>
		</FCK:editor>
		</td>
	</tr>
	<tr>
		<td class="tabright">点数：</td>
		<td><input id="in_points" name="in_points" class="easyui-validatebox " value="0" data-options="min:0,precision:0,required:true" /></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
 	<div id="w1" class="easyui-window" title="专业选择" data-options="modal:true,closed:true" style="width:550px;height:400px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="auto" src="" width="100%" height="300"></iframe>
	</div>
</body>
</html>
