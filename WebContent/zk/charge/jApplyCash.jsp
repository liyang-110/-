<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="../js/in_common.js" charset="utf-8"></script>
<script type="text/javascript" src="ApplyCash.js" charset="utf-8"></script>
<script type="text/javascript">
	var user_code = "<%=user_code%>";
</script>
<style type="text/css">
	tr td {margin:3px 0;line-height:35px;}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_user_code" value="<%=user_code%>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td >当前点数：</td>
		<td  id="in_shift_points"></td>
	</tr>
	<tr>
		<td >兑换点数：</td>
		<td >
		<input class="easyui-numberspinner" id="in_recharge" name="in_recharge"  precision="0" data-options="increment:100,min:1000,max:100000" value="1000"  required="true"  />
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
		</td>
	</tr>
</table>
<div>
	 说明：每次提现申请，最低兑换点数为1000，当前兑换价格为<font color="red">0.1元/点</font>;
</div>
</form>
</body>
</html>
