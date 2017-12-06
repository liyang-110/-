<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../js/in_common.js" charset="utf-8"></script>
<script type="text/javascript" src="./LoginEdit.js"   charset="utf-8"></script>
<script type="text/javascript">
	var user_code ="<%=user_code%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="25%"  align="right">账号：</td>
		<td><input id="in_user_id" name="in_user_id" class="easyui-validatebox" required="true" readonly disabled="true"/></td>
	</tr>
	<tr>
		<td  align="right">密码：</td>
		<td><input type="password" id="in_user_pass" name="in_user_pass" class="easyui-validatebox" validType="equalTo['#eq_user_pass']"/>
		不修改密码请留空
		</td>
	</tr>
	<tr>
		<td  align="right">确认密码：</td>
		<td><input type="password" id="eq_user_pass" name="eq_user_pass" class="easyui-validatebox" validType="equalTo['#in_user_pass']"/></td>
	</tr>
	<tr>
		<td  align="right">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td  align="right">姓名：</td>
		<td><input type="text" id="in_user_name" name="in_user_name" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td  align="right">手机：</td>
		<td><input type="text" id="in_user_tel" name="in_user_tel" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td  align="right">电子邮件：</td>
		<td><input type="text" id="in_user_email" name="in_user_email" class="easyui-validatebox" validType="email" required="true" /></td>
	</tr>
	<tr>
		<td  align="right">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<!-- 
	<tr>
		<td  align="right">支付宝帐号：</td>
		<td><input type="text" id="in_alipay_account" name="in_alipay_account" class="easyui-validatebox" required="true" /></td>
	</tr> 
	-->
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">重置</a></td>
	</tr>
</table>
</form>
</body>
</html>
