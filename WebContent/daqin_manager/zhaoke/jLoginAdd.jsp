<%@ page language="java" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="LoginAdd.js"  charset="utf-8"></script>
<script type="text/javascript" src="../js/common.js" charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
<style type="text/css">
	.reference {
		background-color:#D8F5BA;
		border:1px solid #FFFF99;
		padding:10px;
		display:block;
		width:300px;
		margin:15px;
	}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" id="in_action" name="in_action" value="add_zk" />
<input type="hidden" id="in_add_person" name="in_add_person" value="<%=user_code %>" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<%-- 
	<tr>
		<td width="25%"  align="right">招客类型：</td>
		<td>
		<select id="in_zk_type" name="in_zk_type" class="easyui-combobox" panelHeight="auto">
			<option value="first">初级用户</option>
			<option value="second">高级用户</option>
		</select>
		</td>
	</tr>
	--%>
	<tr>
		<td width="25%"  align="right">账号：</td>
		<td><input id="in_user_id" name="in_user_id" class="easyui-validatebox" required="true"/></td>
	</tr>
	<tr>
		<td  align="right">密码：</td>
		<td><input type="password" id="in_user_pass" name="in_user_pass" class="easyui-validatebox" validType="equalTo['#eq_user_pass']" required="true" />
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
		<td  align="right">联系电话：</td>
		<td><input type="text" id="in_user_tel" name="in_user_tel" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td  align="right">电子邮件：</td>
		<td><input type="text" id="in_user_email" name="in_user_email" class="easyui-validatebox" validType="email" required="true" /></td>
	</tr>
	<!-- 
	<tr>
		<td  align="right">支付宝帐号：</td>
		<td><input type="text" id="in_alipay_account" name="in_alipay_account" class="easyui-validatebox"  /></td>
	</tr>
	 -->
	<tr>
		<td  align="right">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td  align="right">开户行：</td>
		<td><input type="text" id="in_credit_bank" name="in_credit_bank" class="easyui-validatebox"  /></td>
	</tr>
	<tr>
		<td  align="right">姓名：</td>
		<td><input type="text" id="in_user_name" name="in_user_name" class="easyui-validatebox" required="true" /></td>
	</tr>
	<tr>
		<td  align="right">帐号：</td>
		<td><input type="text" id="in_credit_card" name="in_credit_card" class="easyui-validatebox"  /></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
			<label class="reference">招客系统登录地址：<a href="http://www.211zph.com/zk/" target="_blank">http://www.211zph.com/zk/ </a></label>

</form>
</body>
</html>
