<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js" charset="utf-8"></script>
<script type="text/javascript" src="./ZhaokePay.js" charset="utf-8"></script>
<script type="text/javascript">
	var user_code = "<%=request.getParameter("id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="30%">招客账号：</td>
		<td width="70%" id="in_user_id"></td>
	</tr>
	<tr>
		<td>招客姓名：</td>
		<td id="in_user_name"></td>
	</tr>
	<tr>
		<td>电话：</td>
		<td id="in_user_tel"></td>
	</tr>
	<tr>
		<td>银行帐号：</td>
		<td id="in_credit_card"></td>
	</tr>
	<tr>
		<td>开户行：</td>
		<td id="in_credit_bank"></td>
	</tr>
	<tr>
		<td>点数账户余额：</td>
		<td id="shift_points"></td>
	</tr>
	<tr>
		<td>兑换点数：</td>
		<td><input type="text" class="easyui-numberbox" id="in_shift_points" name="in_shift_points" value="0" data-options="min:0,precision:2" /></td>
	</tr>
	<tr>
		<td>计算公式：</td>
		<td>
		<input type="hidden" name="in_zk_id" id="in_zk_id" value="0" />
		<input type="hidden" name="in_pay_fee" id="in_pay_fee" value="0" />
		<input type="hidden" name="in_pay_price" id="in_pay_price" value="0" />
		<input type="text" class="easyui-validatebox" id="expression" name="expression" value="" readonly />
		</td>
	</tr>
	<tr>
		<td>应付金额：</td>
		<td><input type="text" class="easyui-numberbox" id="in_pay_amount" name="in_pay_amount" onfocus="$(this).blur();" style="cursor:default;" value="0" data-options="min:0,precision:2" />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
