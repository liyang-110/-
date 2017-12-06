<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/styles/global.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
	var job_fair_id= "<%=request.getParameter("job_fair_id")%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>

<style>
.panel.combo-p { height:120px;}
#person-order-form {
	width:300px;font-size:14px;padding:10px 0 10px 20px;height:260px; overflow:hidden;
	background-color:#F7F7F7;
}
#person-order-form .control-label {display: inline;}
#person-order-form .controls{width:260px;display: inline;}
#person-order-form .form-error {border-color: #b94a48;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);background-color:#EAFDBE;}
.control-group {margin-bottom:0;}
</style>
</head>
<body style="background-color:#F7F7F7;padding:0">
	<div style="text-align:center;margin:auto;">
	<label>
		<h2>操作指南</h2>
	</label>
	<textarea class="textarea" id="agree_textarea"  readonly="readonly" rows="" cols=""  style="background-color:#FFF;margin:auto;cursor:default;height:80%;width:80%;">

	</textarea>
	</div>
	<div style="text-align:center;padding:10px;">
		<button id="send_btn" class="btn btn-success btn-large">关闭</button><span id="send_msg"></span>
	</div>
<script>
$(function () {
		var height =window.screen.availHeight-350;
		$("#agree_textarea").css({width:750,height:height});
		
		var parent = art.dialog.parent,				// 父页面window对象
		api = art.dialog.open.api;	// 			art.dialog.open扩展方法
		if (!api) return;
		api.title('操作指南！');
		$("#send_btn").bind("click",function(){
			art.dialog.close();
		});
		
})();

</script>
</body>
</html>
