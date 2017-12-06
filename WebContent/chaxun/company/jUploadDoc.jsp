<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.CompanyFilesModel" %>
<%@ page import="it.sauronsoftware.base64.Base64" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/js/js_common.js"></script>

<link href="/js/layer/skins/default.css" rel="stylesheet" />
<script src="/js/layer/artDialog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery-easyui/plugins/jquery.form.js"></script>
<link rel="stylesheet" href="css/main.css" type="text/css"></link>
<script type="text/javascript">
</script>
<style>
	body { background:#FFF;}
</style>
 <script  type="text/javascript" >
	 if( window!=top ){
	 	window.parent.$('body,html').animate({scrollTop:0},200);
	}
	$(function(){
		var ifram = parent.document.getElementById("rightFrm");
		$(ifram).attr("height",600); 
	});
var extArray = new Array(".doc", ".docx", ".jpg", ".png");
function LimitAttach(form, file) {
	var allowSubmit = false;
	if (!file) {
		alert("请选择上传文件，仅支持*.doc,*.docx文件！");
		return;
	}
	while (file.indexOf("\\") != -1){
		file = file.slice(file.indexOf("\\") + 1);
	}
	ext = file.slice(file.indexOf(".")).toLowerCase();
	for (var i = 0; i < extArray.length; i++) {
		if (extArray[i] == ext) { 
			form.fileName.value=file;
			allowSubmit = true; 
			break; 
		}
	}
	if (allowSubmit) {
		$.dialog({
		        id: 'Tips',
		        esc:false,
		        width:200,
		        height:100,
		        title: false,
		        content:'<div>正在上传，请稍候……</div>',
		        cancel: false,
		        fixed: true,
		        lock: true,
		        modal: true,
		        close:false
		});
		$(form).form("submit",{
			success:function(data){
				console.info( data );
				$.dialog({id: 'Tips'}).close();
				var re = $.parseJSON(data);
				if( re.ok == 'ok'){
					$.messager.alert("提示信息","上传成功","info",function(){
						parent.closepage();
					});
				}else{
					alert( re.message );
				}
			}
		});
	}else{
		/*
		alert("对不起，只能上传以下格式的文件:  " 
		+ (extArray.join("  ")) + "\n请重新选择符合条件的文件"
		+ "再上传.");
		*/
		alert("上传简历仅支持*.doc,*.docx文件,\n请重新选择符合条件的文件上传！");
	}
}
</script>
</head>
<body>
<body onload="autoHeight();">
<div style="height:30px;">
</div>
<div class="form-horizontal" id="register_form">
	 <%
	 HashMap<String,String> errors = (HashMap<String,String>)request.getAttribute("errors");
	 if(errors==null) errors=new HashMap<String,String>(); 
	 %>
     <form class="register-form" name="addform" id="addform" novalidate="novalidate" 
     			action="/company/uploadFile.do" method="post" enctype="multipart/form-data">
     <input type="hidden" value="company" name="user_type" />
     <input type="hidden" value="assist" name="buss" />
     <input type="hidden" value="<%=request.getParameter("uid")%>" name="uid"/>
     <input type="hidden" value="true" name="isAjax" /> 

   <input type="hidden" id="fileName" placeholder="" name="fileName"/>
    <div class="control-group">
      <label class="control-label visible-ie8 visible-ie9">招聘简章：</label>
      <div class="controls">
        <div class="input-icon left">
          <input onchanger="alert('abc');" class="m-wrap placeholder-no-fix" type="file" id="file" placeholder="" name="file" />
          <span class="help-inline"></span>
          <div>只能上传* .doc,*.docx文件，大小不能超过2M。</div>
        </div>
        <span><%=errors.get("file")==null?"":errors.get("file")  %></span>
      </div>
    </div>
	<div class="control-group">
                    <div class="controls">
                        <input type="button" id="register_btn" value="上传"
                         onclick="LimitAttach(this.form, this.form.file.value)"
                         class=" btn btn-success"/>
                    </div>
                  </div>
                  </form>
      </div>
</body>
</html>
