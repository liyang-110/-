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
<script type="text/javascript" src="<%=request.getContextPath()%>/school/NewsView.js"></script>
<script type="text/javascript">
	var id = "<%=request.getParameter("id")%>";
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="25%">新闻标题：</td>
		<td id="in_news_title"></td>
	</tr>
	<tr>
		<td>类别：</td>
		<td id="in_news_typename"></td>
	</tr>
	<tr>
		<td>显示位置：</td>
		<td id="in_news_displayname"></td>
	</tr>
	<tr>
		<td>新闻内容：</td>
		<td id="in_news_content"></td>
	</tr>
	<tr>
		<td>作者：</td>
		<td id="in_news_author"></td>
	</tr>
	<tr>
		<td>来源：</td>
		<td id="in_news_source"></td>
	</tr>
	<tr>
		<td>发布时间：</td>
		<td id="in_add_time" ></td>
	</tr>
</table>
</form>
</body>
</html>
