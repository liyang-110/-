<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.BaseCodeModel"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ include file="../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<!-- ueditor -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- /ueditor -->
<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id ="<%=request.getParameter("id")%>";
	var role_id ="<%=role_id%>";
	var user_code = "<%=user_code%>";
	var cur_path ='<%=request.getContextPath() %>';
</script>
<script type="text/javascript" src="/js/js_common.js"></script>

<script type="text/javascript" src="CardSee.js"  charset="utf-8"></script>
<style type="text/css">
	#fm table .tabright {width:10%;vertical-align: middle;}
	.ztree li {float:left;width:102px;}
</style>
<link rel="stylesheet" href="/statics/Huploadify/Huploadify.css" type="text/css"></link>
<script type="text/javascript" src="/statics/Huploadify/jquery.Huploadify.js" charset="utf-8"></script>
<script type="text/javascript" src="/statics/Huploadify/autouploadfile.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	Huploadify_file('card_img_upload_btn', '' ,"in_card_img","card_img_name","img","uploader",function(d){
		var temp = d.split("|");
		var path = temp[2];
		$("#in_card_img_path").val( path );
		$("#card_pic").attr("src","/"+path );
	});
});
</script>
<style type="text/css">
	.uploadify-button {
		margin:0;
	}
	.cus-edui-sec {
		margin:5px;
		padding:5px;
	}
</style>

</head>

<body>
<form id="fm" method="post"  name="fm">
	<input type="hidden" name="in_r" value="ad" />
	<input type="hidden" name="in_action" value="edit" />
	<input type="hidden" name="in_card_id" value="" /><!--编辑完后提交form  更新 需要card_id  -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">&nbsp;</td>
		<td colspan="1">
			<img id="card_pic" src="" style="width:300px;height:100px;"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">详情页内容：</td>
	</tr>
	<tr>
		<td colspan="2" >
		<div style="width:90%;margin:auto;">
		<%
			String card_content = new com.zhaopin.dao.Model().queryClobToStr("select card_content from tbl_card where card_id='"+request.getParameter("id")+"' ", "card_content");
		%>
		<%=card_content%>
		</div>
		</td>
	</tr>

</table>
</form>
<div style="height:25px;"></div>

</body>
</html>
