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
<script type="text/javascript" src="./Setting.js"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
</script>
<style type="text/css">
	fieldset {
		border :1px ridge #000;
		margin-bottom:6px;
	}
</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<fieldset style="width:800px;">
		<legend>招客系统设置</legend>
		会员充点招客返点比率：
		<input id="in_bill_percent" name="in_bill_percent" class="easyui-numberbox"  value="0" data-options="min:0,precision:2"/>
<br/>
		招客提现点数兑换价格：
		<input id="in_pay_price" name="in_pay_price" class="easyui-numberbox" value="0" data-options="min:0,precision:2" />
<br/>
		招客提现手续费率：
		<input id="in_pay_fee" name="in_pay_fee" class="easyui-numberbox" value="0" data-options="min:0,precision:2" />
<br/>
	<!-- 
		会员充点自动支付招客返点：
		<input type="checkbox" id="in_auto_check" name="in_auto_check" checked="true"  value="1" disabled="true" />
		<br/>
	 -->
</fieldset>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>

</form>
</body>
</html>
