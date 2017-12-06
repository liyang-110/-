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

<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<style>
table.price td,table.price td {
	text-align: left !important;
	vertical-align: middle;
	font-size:14px;
	line-height:120%;
}
table.price thead th {
	padding-left: 0;
	padding-right: 0;
	text-align: center;
	font-size:14px;
}
table.price tbody th {
	width: 50px !important;
}
</style>

  </head>
  
  <body>

<div style="width:650px;margin:0 auto;"  class="main_body">
<table class="table table-striped table-bordered price" width="705">
	<colgroup>
		<col width="110" />
		<col width="460" />
		<col width="80" />
	</colgroup>
	<thead>
		<tr>
			<th>
				服务套餐
			</th>
			<th>
				服务内容
			</th>
			<th>
				需要点数
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th><label><input type="radio" name="fuwu"/>套餐一</label></th>
			<td valign="top">
				1、招聘海报设计,制作(尺寸80*100)；2、招聘海报 现场悬挂
			</td>
			<th>
				40点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu"/>套餐二</label></th>
			<td valign="top">1、文件袋1个；2、简历表50份；3、签字笔2支；4、胶带1卷；5、标准面试通知单1本；6、回形针1盒；7、裁纸刀?1个；8、白板笔1支；9、空白海报纸（尺寸50*70）2张。</td>
			<th>
				50点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu"/>套餐三</label></th>
			<td valign="top">1、套餐二全部服务；2、招聘海报设计、制作；3、招聘海报，现场悬挂。 </td>
			<th>
				100点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu"/>套餐四</label></th>
			<td valign="top"><p>1、套餐三全部服务；2、招聘会横幅制作、悬挂；3、教室桌椅摆放、卫生清理；4、宣讲教室投影，话筒调试；5、纯净水2瓶；6、空白海报2张。<br />
			  </p>
		  </td>
			<th>
				400点
			</th>
		</tr>
		<tr>
			<th><label><input type="radio" name="fuwu"/>套餐五</label></th>
			<td valign="top">
				1、套餐四全部服务;2、专人全程跟踪服务;
				3、酒店预订（费用自理）;4、机场接送机（费用自理）。
				<br />
			</td>
			<th>
				1000点
			</th>
		</tr>
		<tr>
			<th colspan="3"><label><input type="radio" name="fuwu"/>不需要服务</label></th>
		</tr>
	</tbody>
</table>
<script>
(function () {
		var parent = art.dialog.parent;		// 父页面window对象
		var api = art.dialog.open.api;		//art.dialog.open扩展方法
			 $ = function (id) {return document.getElementById(id)};
		if (!api) return;
		// parent.document.title = 'iframe中的javascirpt到此一游';
		// 操作对话框
		api.title('请选择招聘会服务')
			// 自定义按钮
			.button(
				{
					name: '确定',
					callback: function () {
						if (false)
							{
								saveOrder(function(){art.dialog.close();});
							}
						return false;
					},
					focus: true
				},
				{
					name: '取消'
				}
			);
})();
</script>
</div>
  </body>
</html>
