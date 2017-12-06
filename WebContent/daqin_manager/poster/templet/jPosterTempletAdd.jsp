<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../include/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"  charset="UTF-8"></script>
 <link href="<%=request.getContextPath()%>/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/umeditor.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="PosterTempletAdd.js"  charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/autouploadfile.js"></script>

<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	$(function(){
  		$('#myEditor').load("templet1.html");
  		
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
		<td class="tabright">名称：</td>
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
<div class="myEditor">
<div class="content-top">
	<p>top</p>
</div>
<div class="content-body">
	<p>body</p>
	<p align="center">这里我可以写一些输入提示</p>
	<h3>公司简介</h3>
	<ul>
		<li>第一项</li>
		<li>第二项</li>
	</ul>
</div>
<div class="content-bottom">
	<p>bottom</p>
</div>
</div>
    	<style>
		.myEditor {
			font-size:14px;
			width:1000px;
			margin:0 auto;
		}
		.myEditor ul li{
			list-style:none;
		}
		.myEditor .content-top{
			display:block;
			height:150px;
			background:#B22D28;
			color:#FFF;
		}
		.myEditor .content-bottom{
			display:block;
			height:100px;
			background:#7F292B;
		}
	</style>
</script>
 </div>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_save" id="btn_save">确定</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" name="btn_return" id="btn_return">取消</a>
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
