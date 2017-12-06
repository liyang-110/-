<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ page import="com.zhaopin.dao.Model" %>
<%@ page import="com.zhaopin.dao.factory.BottomContentModel"%>
<%@ include file="../../include/checkLogin.jsp" %>
<%
String id=request.getParameter("id").toString();  
BottomContentModel model=new BottomContentModel(new Model());
String content=""; 
content=model.getContent( request.getParameter("id") );
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
<script type="text/javascript" src="BottomContentEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_add_person" id="in_add_person" value="<%=user_code %>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">地区：</td>
		<td><input id="in_type_id" name="in_type_id" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td class="tabright">标题：</td>
		<td><input id="in_title" name="in_title" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">内容：</td>
		<td>
		<FCK:editor instanceName="content"  height="400px">
				<jsp:attribute name="value">    
                   <%=content %>
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
 	<div id="w1" class="easyui-window" title="专业选择" data-options="modal:true,closed:true" style="width:550px;height:400px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="auto" src="" width="100%" height="300"></iframe>
	</div>
</body>
</html>
