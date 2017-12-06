<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="SchoolAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
<script type="text/javascript" src="../js/common.js"></script>
<style type="text/css">
.uploadify-button {
    margin:0;
}
table td {padding:3px 0;}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
	<fieldset>
	<legend>登录账号设置</legend> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="25%" align="right">登录账号：</td>
		<td><input id="in_user_id" name="in_user_id" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td align="right">密码：</td>
		<td><input type="password" id="in_user_pass" name="in_user_pass" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td align="right">确认密码：</td>
		<td><input type="password" id="eq_user_pass" name="eq_user_pass" class="easyui-validatebox"  validType="equalTo['#in_user_pass']" required="true"/></td>
	</tr>
	<tr>
		<td align="right">联系人：</td>
		<td><input id="in_contact_person" name="in_contact_person" class="easyui-validatebox"  required="true"/></td>
	</tr>
	<tr>
		<td align="right">手机：</td>
		<td><input id="in_contact_tel" name="in_contact_tel" class="easyui-numberbox"  required="true"/></td>
	</tr>
	<tr>
		<td align="right">联系邮箱：</td>
		<td><input id="in_user_email" name="in_user_email" class="easyui-validatebox" data-options="validType:'email'" required="true"/></td>
	</tr>
	</table>
	</fieldset>
	<fieldset>
	<legend>学校基本信息</legend> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="25%" align="right">学校名称：</td>
		<td><input id="in_school_name" name="in_school_name" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td align="right">所在地区：</td>
		<td><input id="in_area_id" name="in_area_id" class="easyui-validatebox"  /></td>
	</tr>
	<tr>
		<td align="right">学校简介：</td>
		<td><input id="in_school_info" name="in_school_info" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td align="right">联系信息：</td>
		<td><input id="in_school_contact" name="in_school_contact" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td align="right">学校官网：</td>
		<td><input id="in_school_website" name="in_school_website" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td align="right">学校地址：</td>
		<td><input id="in_school_addr" name="in_school_addr" class="easyui-validatebox" required="true" /></td>
	</tr>
	</table>
	</fieldset>
	
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="25%" align="right">
		</td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
