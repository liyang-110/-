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
<script type="text/javascript" src="./LoginEdit.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("in_pagesize")%>;
	var gi_pagenum = <%=request.getParameter("in_pagenum")%>;
	var gi_currentnum = <%=request.getParameter("in_currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
</script>
<script type="text/javascript" src="../js/common.js"></script>
<style type="text/css">
	#fm table td {
		padding-top:3px;
		padding-bottom:3px;
	}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="25%">用户账号：</td>
		<td><input id="in_user_id" name="in_user_id" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td>用户密码：</td>
		<td><input type="password" id="in_user_pass" name="in_user_pass" class="easyui-validatebox" validType="equalTo['#eq_user_pass']"/>
		不修改密码请留空
		</td>
	</tr>
	<tr>
		<td>确认密码：</td>
		<td><input type="password" id="eq_user_pass" name="eq_user_pass" class="easyui-validatebox" validType="equalTo['#in_user_pass']"/></td>
	</tr>
	<tr>
		<td>用户邮箱：</td>
		<td><input id="in_user_email" name="in_user_email" class="easyui-validatebox" data-options="validType:'email'"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		<label>
		<input id="in_email_verify" name="in_email_verify" 
		type="checkbox" value="success"
		class="easyui-validatebox"/>邮箱已验证
		</label>
		</td>
	</tr>
	<!--  
	<tr>
		<td>会员类型：</td>
		<td>
		<input id="in_member_type" name="in_member_type" class="easyui-validatebox"/>
		</td>
	</tr>
	<tr>
		<td>开始日期：</td>
		<td><input id="in_begin_date" name="in_begin_date" class="easyui-datebox" /></td>
	</tr>
	<tr>
		<td>截止日期：</td>
		<td><input id="in_end_date" name="in_end_date" class="easyui-datebox"/></td>
	</tr>
	-->
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
