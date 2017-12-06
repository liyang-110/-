<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import ="com.zhaopin.dao.factory.PosterTempletModel" %>
<%@ include file="../../include/checkLogin.jsp" %>
<%
String id=request.getParameter("id");
PosterTempletModel poster=new PosterTempletModel();
String content=poster.getContent(id);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>

<link href="<%=request.getContextPath()%>/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/umeditor.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript" src="PosterTempletEdit.js"  charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/autouploadfile.js"></script>
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id = "<%=request.getParameter("id")%>";
	$(function(){
		uploadify_file('logo_file_upload',cur_path,"in_file_id","file_name","uploadify_queue","ad","uploader");
  	});
	</script>
<style>
		.main-container {
			width:1000px;
			margin:0 auto;
		}
	</style>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">模板名称：</td>
		<td><input id="in_tpl_name" name="in_tpl_name" class="easyui-validatebox inputbox" required="true"/></td>
	</tr>
	<tr>
		<td class="tabright">缩略图：</td><td>
				<table><tr><td>
		<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
		<input type="hidden" name="in_file_id" id="in_file_id"/>
		<div id="uploadify_queue"></div>
		</td><td>
		<input id="logo_file_upload" name="logo_file_upload" type="file" />
		</td></tr></table>
		</td>
	</tr>
</table>
 <div class="main-container">
<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor" name="tpl_content" style="width:1000px;height:100%;">
	<%= content%>
</script>
 </div>
 <div style="text-align:center;">
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
</div>
</form>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor', {
	   toolbar:[
            'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
            'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
            '| justifyleft justifycenter justifyright justifyjustify |',
            ' emotion image ', 'formula',
            '| horizontal print preview','fullscreen'
        ] });
</script>
</body>
</html>
