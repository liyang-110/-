<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="TreeTag" prefix="t" %>
<%@ page import="com.zhaopin.dao.factory.BaseCodeModel" %>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel"%>
<%@ page import="com.zhaopin.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/statics/css/main4.css" />
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script src="<%=request.getContextPath()%>/assets/artDialog/artDialog.js?skin=green"></script>
<script src="<%=request.getContextPath()%>/assets/jquery/jquery.form.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/media/js/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/assets/artDialog/plugins/iframeTools.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jquery-easyui/themes/bootstrap/messager.css" type="text/css"/>
<script type="text/javascript">
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=in_file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/scripts/front.js"></script>
<script type="text/javascript" src="js/jquery-scrollable.js" charset="utf-8"></script>

<style>
.f_login {height:auto;margin:auto;text-align: center;}
.login4 #login4 .input-prepend {margin:auto;width:auto;}
.login4 #login4 .input-prepend input {
  width:220px;
  }
.f_login .controls {width:290px;margin-left:auto;margin-right:auto;}
a.aui_close_btn {
	font-size:39px;font-weight:bolder;color:#C7CBC3;
}
a.aui_close_btn:hover {text-decoration:none;color:#EF4B4B;}
body {
	font-family: 'Microsoft YaHei', 微软雅黑, SimSun, 宋体;
}
.f_login .control-group {
	width: auto;
}
.login4 #login4 {
  width: auto;
  height: auto;
  background-color:transparent;
  border-radius: none;
  padding:0;
  box-shadow:none;
}
</style>
</head>
<body style="background-color:#FBA957;padding:0;margin:0;
background:url(20151114/bg.jpg);">
		<div style="padding:8px 10px 11px 10px;">
		<a href="javascript:;"  class="pull-right aui_close_btn" style="">&times;</a>
			<div style="clear:both;"></div>
		</div>
    	<div class="f_login" style="height:590px;width:1309px;margin:-39px auto 0 auto;">
			<table>
			<tr><td>
				<div style="padding:35px 0;width:359px;height:513px;background:url(20151114/beijing_03.png) no-repeat;">
				<style>
					#contan_left li {margin:0;padding:0;}
					#contan_left li img{ width:210px;height:210px;padding:10px;}
				</style>
				<div style="height:460px;overflow:hidden;">
				<ul id="contan_left" >
            			<li><img src="20151114/11.jpg"/></li>
            			<li><img src="20151114/22.jpg"/></li>
            			<li><img src="20151114/33.jpg"/></li>
            			<li><img src="20151114/four.jpg"/></li>
                </ul>
                </div>
					<script>
		              	$("#contan_left").scrollable({
								direction: "top",
								height: "460",
								scrollCount: 1,
								delay : 1000 
						}); 
					</script>
				</div>
			</td><td>
				<div style="position:relative;width:950px;height:590px;background:url(20151114/right_02.png);">
					<div style="position:absolute;bottom:75px;right:50px;">
					<a href="http://www.211zph.com/netcongress/start.do?id=201511020006962"><img src="20151114/text_07.png"/></a>
					</div>
				</div>
			</td></tr></table>
 		</div><!-- login -->

<script type="text/javascript">
  $(function(){
		var parent = art.dialog.parent				// 父页面window对象
		api = art.dialog.open.api ;// 			art.dialog.open扩展方法
		
		$(".aui_main",parent.document ).css({"padding-top":0});  
		$(".aui_inner",parent.document ).css({"border":"none"});  
		
		$(".aui_close_btn").click(function(){
			api.close();
		});
  });
</script>
<script src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
</body>
</html>
