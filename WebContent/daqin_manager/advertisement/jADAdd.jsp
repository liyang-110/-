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
<script type="text/javascript" src="<%=request.getContextPath()%>/daqin_manager/advertisement/ADAdd.js"   charset="utf-8"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" id="in_owner_type" name="in_owner_type" value="school" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">地区：</td>
		<td width="75%"><input id="in_area_id" name="in_area_id" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">文本：</td>
		<td><input id="in_title" name="in_title" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">图片：</td>
		<td><input name="uploadusername" type="hidden"   id="uploadusername" value="loader"/>
					<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
					<input type="hidden" name="file_id" id="file_id"/>
					<input type="hidden" name="uploadmethod" id="uploadmethod" value="false"/>
					<input name="Submit43" type="button" class="sbttn_select" value=" 选择 " onClick="fileup()"/>
					<input name="uploadfileid" type="hidden"   id="uploadfileid" style="width: 200px;"/></td>
	</tr>
	<tr>
		<td class="tabright">排序：</td>
		<td>
		<input id="in_ad_display" class="easyui-numberspinner" name="in_ad_display" value="0" />
		</td>
	</tr>
	<tr>
		<td class="tabright">开始时间：</td>
		<td><input id="in_begindate" name="in_begindate" class="easyui-datebox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">截止时间：</td>
		<td><input id="in_enddate" name="in_enddate" class="easyui-datebox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">链接地址：</td>
		<td><input id="in_ad_url" name="in_ad_url" class="easyui-validatebox inputbox" required="true" value="http://"/></td>
	</tr>
	<tr>
		<td></td>
		<td>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a></td>
	</tr>
</table>
</form>
</body>
</html>
