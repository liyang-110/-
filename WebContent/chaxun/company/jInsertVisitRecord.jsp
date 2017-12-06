<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.RoleModel" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var company_id ="<%= request.getParameter("company_id")%>";
	var user_id ='${ param.user_id }';
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="/js/js_common.js" charset="utf-8"></script>
<script type="text/javascript" src="InsertVisitRecord.js"  charset="utf-8"></script>
</head>

<body>
<form id="fm" method="post"  name="fm">
	<input id="company_id" type="hidden" name="company_id" value="${ param.company_id }"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<!-- <tr>
				<td align="right">招聘顾问：</td>
				<td><input id="user_name" name="user_name"
					class="easyui-validatebox" required="true"/>
					
				</td>
			</tr> -->
			<tr>
				<td align="right">企业联系人：</td>
				<td><input id="person" name="person" class="easyui-validatebox" required="true"/></td>
			</tr>
			<%-- <tr>
				<td align="right">企业名称：</td>
				<td><input id="company_name" name="company_name"
					class="easyui-validatebox" required="true"/></td>
					<input id="company_id" type="hidden" name="company_id" value="${ param.company_id }"/>
			</tr> --%>
			<tr>
				<td align="right">企业电话：</td>
				<td><input id="company_tel" name="company_tel"
					class="easyui-validatebox" required="true"/></td>
			</tr>
			<tr>
				<td align="right">企业邮箱：</td>
				<td><input id="company_email" name="company_email"
					class="easyui-validatebox" validType="email" required="true"/></td>
			</tr>
			<tr>
				<td align="right">回访内容：</td>
				<td><!-- <input id="content" name="content"
					class="easyui-validatebox" style="width:62%;height:60px" data-options="multiline:true"/> -->
					<textarea name="content" id="content" cols="18" rows="8"></textarea>
					</td>
			</tr>
			<tr>
				<td align="right">下次回访日期：</td>
				<td><input id="next_time" name="next_time"
					class="easyui-datebox"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					name="btn_save" id="btn_save">确定</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
			</tr>
		</table>
</form>
</body>
</html>
