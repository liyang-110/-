<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="./Points.js" charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("in_pagesize")%>;
	var gi_pagenum = <%=request.getParameter("in_pagenum")%>;
	var gi_currentnum = <%=request.getParameter("in_currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	var user_type = "<%=request.getParameter("user_type")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_user_type" value="<%=request.getParameter("user_type")%>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td colspan="2">
		<h3>
		<span id="company_name"></span>
		<span id="school_name"></span>
		</h3>
		</td>
	</tr>
	<tr>
		<td >用户账号：</td>
		<td  id="user_id"></td>
	</tr>
	<tr>
		<td >当前点数：</td>
		<td  id="points"></td>
	</tr>
	<tr>
		<td >充值点数：</td>
		<td >
		<input class="easyui-numberspinner" id="in_recharge" name="in_recharge"  precision="0" data-options="increment:100" value="0"  required="true"  />
		<input type="hidden" id="in_user_code" name="in_user_code" value="<%=request.getParameter("id")%>"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">充点</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
<% if(request.getParameter("zk_id")!=null && !"".equals(request.getParameter("zk_id"))){ %>
<style type="text/css">
	.reference {
		background-color:#D8F5BA;
		border:1px solid #FFFF99;
		padding:10px;
		display:block;
		width:200px;
	}
</style>
<label class="reference">该企业通过招客注册！</label>

<%} %>
</form>
</body>
</html>
