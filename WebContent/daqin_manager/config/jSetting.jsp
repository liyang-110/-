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
		<legend>网站显示信息设置</legend>
		网站标题：<br/>
		<textarea  cols="120" rows="1" id="in_site_title" name="in_site_title" class="easyui-validatebox">
		</textarea><br/>
		网站关键字：<br/>
		<textarea  cols="120" rows="1" id="in_site_keywords" name="in_site_keywords" class="easyui-validatebox">
		</textarea><br/>
		网站描述：<br/>
		<textarea  cols="120" rows="3" id="in_site_description" name="in_site_description" class="easyui-validatebox">
		</textarea><br/>
	
		网站页头文字：<br/>
		<textarea  cols="120" rows="1" id="in_site_top" name="in_site_top" class="easyui-validatebox">
		</textarea>
		<br/>
		网站底部信息：<br/>
		<textarea  cols="120" rows="3" id="in_site_bottom" name="in_site_bottom" class="easyui-validatebox">
		</textarea>
		<br/>
</fieldset>
<fieldset style="width:800px;display:none;" >
		<legend>系统消息格式设置</legend>
		企业确认显示内容：<br/>
		<textarea  cols="120" rows="3" id="in_company_content" name="in_company_content" class="easyui-validatebox">
		</textarea>
		<br/>
		学校确认给发送给企业的内容：<br/>
		<textarea  cols="120" rows="3" id="in_school_content" name="in_school_content" class="easyui-validatebox">
		</textarea>
		<br/>
</fieldset>		
		<table><tr><td valign="top" style="display:none;">
		<fieldset style="width:390px;">
		<legend>企业扣点规则</legend>
		发送一条招聘会申请，扣除的点数：
		<input id="in_points1" name="in_points1" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		申请招聘会，审核未通过，企业退回点数：
		<input id="in_points2" name="in_points2" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		被学校邀请的招聘会，通过后，扣除的点数：
		<input id="in_points3" name="in_points3" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		发布专场招聘会，扣除的点数：
		<input id="in_points4" name="in_points4" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		企业信息通过审核，给予的点数：
		<input id="in_points5" name="in_points5" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		企业发布职位，扣除点数：
		<input id="in_points8" name="in_points8" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		企业下载一份简历，扣除点数：
		<input id="in_points9" name="in_points9" class="easyui-numberspinner" data-options="increment:1" />

		</fieldset>
		</td><td valign="top">
		<fieldset style="width:380px;">
		<legend>学校扣点规则</legend>
		发布一场招聘会，扣除的点数：
		<input id="in_points6" name="in_points6" class="easyui-numberspinner" data-options="increment:1" />
		<br/>
		推广招聘会，每邀请一个企业，扣除点数：
		<input id="in_points7" name="in_points7" class="easyui-numberspinner" data-options="increment:1" />
		</fieldset>
		</td></tr></table>
<table>
	<tr>
		<td><br/>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">保存</a>
	</tr>
</table>
</form>
</body>
</html>
