<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
<%@ include file="../include/checkLogin.jsp" %>
<%
	AdvertisementModel AdModel=new AdvertisementModel();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var role_id = "<%=role_id%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="NewADAdd.js"   charset="utf-8"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/autouploadfile.js"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
	$(function(){
			uploadify_file('logo_file_upload',cur_path,"file_id","file_name","uploadify_queue","ad","uploader");
	});
</script>

</head>

<body>
<form id="fm" method="post"  name="fm">
<input type="hidden" id="in_owner_type" name="in_owner_type" value="bargain" />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">位置：</td>
		<td width="75%">
		<input id="in_ad_type" name="in_ad_type" class="easyui-validatebox"  style="width:260px;"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">合同编号：</td>
		<td><input id="in_owner_id" name="in_owner_id" class="easyui-validatebox inputbox"  />
				<span style="color:red;">请填写合同编号或者客户名称，填写后不可修改</span>
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
	<%if("00".equals(role_id)){ %>
	<tr>
		<td class="tabright">地区：</td>
		<td width="75%">	<input  id="in_area_id" name="in_area_id" class="easyui-validatebox"/></td>
	</tr>
	<%}else{ %>
	 <tr style="display:none">
		<td class="tabright">地区：</td>
		<td width="75%">	<input type="hidden" id="in_area_id" name="in_area_id" class="easyui-validatebox"/></td>
	</tr>
	<% } %>
	

	<tr>
		<td class="tabright">排序：</td>
		<td>
		<input id="in_ad_display" class="easyui-numberspinner" name="in_ad_display" value="1"/>
		</td>
	</tr>
	<tr>
		<td class="tabright">广告文本：</td>
		<td><input id="in_title" name="in_title" class="easyui-validatebox inputbox"  /></td>
	</tr>
	<tr>
		<td class="tabright">上传广告位图片：</td>
		<td>
		<table><tr><td>
		<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
		<input type="hidden" name="file_id" id="file_id"/>
		<div id="uploadify_queue"></div>
		</td><td>
		<input id="logo_file_upload" name="logo_file_upload" type="file" />
		</td></tr></table>
		</td>
	</tr>
	<tr>
		<td class="tabright">链接地址：</td>
		<td><input id="in_ad_url" name="in_ad_url" class="easyui-validatebox inputbox" value="http://"/></td>
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
