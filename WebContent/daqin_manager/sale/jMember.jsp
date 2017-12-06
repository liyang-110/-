<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js" charset="utf-8"></script>
<script type="text/javascript" src="./Member.js" charset="utf-8"></script>
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
		<td>用户账号：</td>
		<td id="user_id"></td>
	</tr>
	<tr>
		<td>当前等级：</td>
		<td id="member_type"></td>
	</tr>
	<tr>
		<td>当前点数：</td>
		<td id="points"></td>
	</tr>
	<tr>
		<td>有效期：</td>
		<td><span id="begin_date"></span>至<span id="end_date"></span></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td  align="right">修改会员等级：</td>
		<td>
		<input id="in_member_type" name="in_member_type" class="easyui-validatebox"/>
		<input type="hidden" id="in_user_code" name="in_user_code" value="<%=request.getParameter("id")%>"/>
		</td>
	</tr>
	<tr>
		<td  align="right">开始日期：</td>
		<td><input id="in_begin_date" name="in_begin_date" class="easyui-datebox" /></td>
	</tr>
	<tr>
		<td  align="right">截止日期：</td>
		<td><input id="in_end_date" name="in_end_date" class="easyui-datebox"/></td>
	</tr>
	<tr>
	<td colspan="2" style="line-height:150%;padding:3px 20px;">
			修改会员级别，将重置用户点数为会员等级默认点数.
			请谨慎操作。

	</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
