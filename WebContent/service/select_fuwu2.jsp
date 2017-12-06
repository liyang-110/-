<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select_fuwu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="<%=request.getContextPath() %>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/styles/global.css" />

<script src="<%=request.getContextPath() %>/assets/jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/company/css/main.css"/>
<style>
table.price td {
	text-align: left !important;
	vertical-align: middle;
}

table.price thead th {
	padding-left: 0;
	padding-right: 0;
	text-align: center;
}

table.price tbody th {
	width: 50px !important;
}
</style>

  </head>
  
  <body>

<div style="width:705px;margin:0 auto;"  class="main_body">
<table class="table table-striped table-bordered price" width="705">
	<colgroup>
		<col width="60" />
		<col width="325" />
		<col width="60" />
		<col width="95" />
	</colgroup>
	<thead>
		<tr>
			<th>
				服务套餐
			</th>
			<th>
				服务内容
			</th>
			<th>&nbsp;
			</th>
			<th>
				服务价格
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>
				套餐一
			</th>
			<td valign="top">
				1、招聘海报设计,制作(尺寸80*100);
				<br />
				2、招聘海报 现场悬挂
			</td>
			<td valign="top">
				1份
				<br />
				1次
			</td>
			<td>
				40元/家
			</td>
		</tr>
		<tr>
			<th>
				套餐二
			</th>
			<td valign="top">
				1、文件袋
				<br />
				2、简历表
				<br />
				3、签字笔
				<br />
				4、胶带
				<br />
				5、标准面试通知单
				<br />
				6、回形针
				<br />
				7、裁纸刀
				<br />
				8、白板笔
				<br />
				9、空白海报纸（尺寸50*70）
				<br />
			</td>
			<td valign="top">
				1个
				<br />
				50份
				<br />
				2支
				<br />
				1卷
				<br />
				1本
				<br />
				1盒
				<br />
				1个
				<br />
				1支
				<br />
				2张
				<br />
			</td>
			<td>
				50元/家
			</td>
		</tr>
		<tr>
			<th>
				套餐三
			</th>
			<td valign="top">
				1、套餐二全部服务；
				<br />
				2、招聘海报设计、制作;
				<br />
				3、招聘海报 现场悬挂
				<br />
			</td>
			<td valign="top">
				<br />
				1份
				<br />
				1次
			</td>
			<td>
				100元/家
			</td>
		</tr>
		<tr>
			<th>
				套餐四
			</th>
			<td valign="top">
				1、套餐三全部服务；
				<br />
				2、招聘会横幅制作、悬挂；
				<br />
				3、教室桌椅摆放、卫生清理；
				<br />
				4、宣讲教室投影，话筒调试；
				<br />
				4、纯净水
				<br />
				5、空白海报2张
				<br />
			</td>
			<td valign="top">
				<br />
				5米
				<br />
				<br />
				<br />
				2瓶
				<br />
				2张
			</td>
			<td>
				400元/家
			</td>
		</tr>
		<tr>
			<th>
				套餐五
			</th>
			<td valign="top">
				1、套餐四全部服务
				<br />
				2、专人全程跟踪服务
				<br />
				3、酒店预订（费用自理）
				<br />
				4、机场接送机（费用自理）
				<br />
			</td>
			<td valign="top">
				<br />
				1天
				<br />
				<br />
				<br />
			</td>
			<td>
				1000元/家
			</td>
		</tr>
	</tbody>
</table>
</div>
  </body>
</html>
