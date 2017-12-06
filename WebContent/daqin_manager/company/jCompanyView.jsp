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
<script type="text/javascript" src="./CompanyView.js" charset="utf-8"></script>
<script type="text/javascript">
	var id = "<%=request.getParameter("id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="10%">企业编码：</td>
		<td width="90%" id="in_company_id"></td>
	</tr>
	<tr>
		<td width="10%">地区编码：</td>
		<td width="90%" id="in_area_idn"></td>
	</tr>
	<tr>
		<td width="10%">企业名称：</td>
		<td width="90%" id="in_company_name"></td>
	</tr>
	<tr>
		<td width="10%">企业简介：</td>
		<td width="90%" id="in_company_info"></td>
	</tr>
	<tr>
		<td width="10%">联系信息'：</td>
		<td width="90%" id="in_company_tel"></td>
	</tr>
	<tr>
		<td width="10%">添加时间：</td>
		<td width="90%" id="in_add_time"></td>
	</tr>
	<tr>
		<td width="10%">企业性质：</td>
		<td width="90%" id="in_company_naturen"></td>
	</tr>
	<tr>
		<td width="10%">单位人数：</td>
		<td width="90%" id="in_company_person_numn"></td>
	</tr>
	<tr>
		<td width="10%">注册资金：</td>
		<td width="90%" id="in_company_registered_capitaln"></td>
	</tr>
	<tr>
		<td width="10%">用户编码：</td>
		<td width="90%" id="in_user_code"></td>
	</tr>
	<tr>
		<td width="10%">所属行业：</td>
		<td width="90%" id="in_industry"></td>
	</tr>
	<tr>
		<td width="10%">公司地址：</td>
		<td width="90%" id="in_company_addr"></td>
	</tr>
	<tr>
		<td width="10%">联系人：</td>
		<td width="90%"  id="in_contact_person"></td>
	</tr>
		<tr>
		<td width="10%">联系电话：</td>
		<td width="90%"  id="in_contact_tel"></td>
	</tr>
		<tr>
		<td width="10%">电子邮件：</td>
		<td width="90%"  id="in_email"></td>
	</tr>
			<tr>
		<td width="10%">公司成立日期：</td>
		<td width="90%"  id="in_establish_date"></td>
	</tr>
</table>
</form>
</body>
</html>
