<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
<script type="text/javascript" src="JobFairAdd.js"  charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
   	function toOpen(){
		$('#w1').window('open');
		$('#add').attr("src","<%=request.getContextPath()%>/school/jProfessional.jsp");  
	}
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" name="in_add_person" id="in_add_person" value="<%=user_code %>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">招聘会类型：</td>
		<td><input id="in_job_fair_type" name="in_job_fair_type" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">地区：</td>
		<td><input id="in_area_id" name="in_area_id" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td class="tabright">学校：</td>
		<td><input id="in_school_id" name="in_school_id" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td class="tabright">招聘会名称：</td>
		<td><input id="in_job_fair_name" name="in_job_fair_name" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">招聘会主办方：</td>
		<td><input id="in_job_fair_sponsor" name="in_job_fair_sponsor" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">招聘会时间：</td>
		<td><input id="in_job_fair_time" name="in_job_fair_time" class="easyui-datetimebox" showSeconds="false" required="true"/>
				-
				<input id="in_job_fair_overtime" name="in_job_fair_overtime" class="easyui-datetimebox" showSeconds="false"  />
		
		</td>
	</tr>
	<tr>
		<td class="tabright">预订截止时间：</td>
		<td><input id="in_job_fair_endtime" name="in_job_fair_endtime" class="easyui-datetimebox" showSeconds="false" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">招聘会地点：</td>
		<td><input id="in_job_fair_addr" name="in_job_fair_addr" class="easyui-validatebox inputbox" required="true" /></td>
	</tr>
	<tr>
		<td class="tabright">乘车路线：</td>
		<td><input id="in_job_fair_bus_route" name="in_job_fair_bus_route" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">招聘会学历：</td>
		<td><input id="in_job_fair_level" name="in_job_fair_level" class="easyui-validatebox" /></td>
	</tr>
	<tr>
		<td class="tabright">所需专业：</td>
		<td>
		<input id=in_professional name="in_professional" type="hidden" class="easyui-validatebox" />
		<input id=professional_name name="professional_name" type="text" />
		<input  type="button" class="button" value="请选择 " onClick="toOpen()"/></td>
	</tr>
	<tr>
		<td class="tabright">招聘会特色：</td>
		<td><input id="in_job_fair_feature" name="in_job_fair_feature" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">计划单位数：</td>
		<td><input id="in_job_fair_company_num" name="in_job_fair_company_num" class="easyui-numberspinner" data-options="increment:1"  required="true" /></td>
	</tr>
	<tr style="display:none">
		<td class="tabright">招聘会简介：</td>
		<td><textarea  cols="60" rows="7" id="in_job_fair_content" name="in_job_fair_content" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td class="tabright">招聘会邀请函：</td>
		<td><textarea  cols="60" rows="7" id="in_job_fair_invitation" name="in_job_fair_invitation" class="easyui-validatebox"></textarea></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
 	<div id="w1" class="easyui-window" title="专业选择" data-options="modal:true,closed:true" style="width:550px;height:400px;padding:10px;">
		<iframe  frameborder="0" id="add"  scrolling="auto" src="" width="100%" height="300"></iframe>
	</div>
</body>
</html>
