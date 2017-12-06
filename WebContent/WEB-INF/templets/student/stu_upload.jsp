<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.Station"%>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="/static/inc/checkLogin.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<%=com.zhaopin.Config.getSiteKeywords() %>" />
<meta name="description" content="<%=com.zhaopin.Config.getSiteDescription() %>" />
<meta name="author" content="">
<title><%=com.zhaopin.Config.getSiteTitle() %></title>
 
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/common-element.css" rel="stylesheet" type="text/css">
	<link href="/static/css/stu_center(09upload).css" rel="stylesheet" type="text/css">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript">
	var cur_path ="<%=request.getContextPath()%>";
	var student_id="${student.student_id}";
	</script>
    <script src="/static/jquery/1.11.3/jquery.min.js"></script>
    <script src="/static/js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
	<script src="/static/artDialog/artDialog.min.js"></script>
	    <script src="/static/artDialog/artDialog.js?skin=aero" charset="utf-8"></script>
	
	<script src="/static/artDialog/plugins/iframeTools.js"></script>
	<script src="/static/uploadify/swfobject.js" type="text/javascript" ></script>
	<script src="/static/uploadify/jquery.uploadify.min.js" type="text/javascript" ></script>	
	
<script  type="text/javascript" >
var extArray = new Array(".doc", ".docx", ".jpg", ".png");
function LimitAttach(form, file) {
	
	var allowSubmit = false;
		
	if (!file) {
		alert("请选择上传文件，仅支持*.doc,*.docx文件！");
		return;
	}
	while (file.indexOf("\\") != -1)
	file = file.slice(file.indexOf("\\") + 1);
	$("#fileName").val(file);
	ext = file.slice(file.indexOf(".")).toLowerCase();
	for (var i = 0; i < extArray.length; i++) {
		if (extArray[i] == ext) { 
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
		$("form").form("submit",{
			success:function(data){
				$.dialog({id: 'Tips'}).close();
				var re = $.parseJSON(data);
				if( re.ok == 'ok'){
					alert("上传成功!");
					window.location.reload();
				}else{
					alert( re.message );
				}
				
			}
		});
	}else{
		alert("上传简历仅支持*.doc,*.docx文件,\n请重新选择符合条件的文件上传！");
	}
}
</script>

<script type="text/javascript" src="/static/js/Upload.js"></script>

</head>
<body>
<!--main区架构开始-->
<div class="main">
	
	<div class="main_bot">
		
   
     	<div class="main_bot_r">
     
      	<li><img src="/static/images/personal_center/shangchuan.png" width="30" height="30">上传简历</li>
<!--上传  开始-------------------------  --> 	
      	<form class="register-form" name="addform" id="addform" novalidate="novalidate" 
     		  action="../student/uploadResume.do" method="post" enctype="multipart/form-data">
     		<input type="hidden" value="student" name="user_type" />
     		<input type="hidden" value="true" name="isAjax" />
            <div class="table">
				<table width="560" border="0" cellpadding="0" cellspacing="0">
                    <!-- <tr style="padding-top:20px;">
                        <td></td>
                        <td >
                        	<input class="text" type="text" id="fileName" placeholder="" name="fileName"/>
                        </td>
                    </tr> -->
                    <tr style="padding-top:20px;">
                        <td>文件:</td>
                        <td >
                        	<input  type="file" id="file" placeholder="" name="file"/>
                        	<input class="text" type="hidden" id="fileName" placeholder="" name="fileName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="color:#0c74f6; font-weight:bold;">只能上传* .doc,*.docx文件，大小不能超过2M。</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                        <input type="button" id="register_btn" value="上传"  class="button"
                        	onclick="LimitAttach(this.form, this.form.file.value)" />
                        </td>
                    </tr>
				</table>
			</div>
		</form>
		 
<!--上传  结束--------------------------------  -->
      	
<!--展示上传简历 ------------ -->
		<div class="form">
			<table width="650" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td>简历名称</td>
					<td>上传时间</td>
					<td>公开状态</td>
					<td>下载</td>
				</tr>
				<tr class="xian">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
							<%
								StudentResumeModel model = new StudentResumeModel(user);
								if (user != null && model.getName() != null) {
							%>
							<%
								String path = java.net.URLEncoder
											.encode(model.getPath(), "GBK");
									String rname = user.getUserName();
									
							%>
							<td><%=model.getName()%></td>
							<td><%=model.getAddTime()%>（<a href="javascript:;"
								onclick="refreshResume('<%=model.getId()%>');"><span
									style="color:red;">刷新</span>
							</a>）</td>
							<td><label><input type="radio" name="open"
									<%="1".equals(model.getStatus()) ? "checked" : ""%>
									onclick="editOpen('<%=model.getId()%>',1);" />公开</label> <label><input
									type="radio" name="open"
									<%="0".equals(model.getStatus()) ? "checked" : ""%>
									onclick="editOpen('<%=model.getId()%>',0);" />隐藏</label></td>
							<td class="bag">
								<a href="<%=request.getContextPath()%>/upload/download.jsp?path=<%=path%>&name=<%=rname%>"
								   target="_blank">点击下载</a>
							</td>
							<%
								} else {
							%>
							<td colspan="3">还没有上传简历！</td>
							<%
								}
							%>
						</table>
		</div> 
		<!--artDialog 自定义确定取消按钮 -->
		<!-- <div class="controls" style="float: right;">
                        <input class="" style="background-color:#e03919;color:#fff;width:54px; height:30px;border:none;" type="submit" value="确定"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="aui_close_btn" style="background-color:#3b4656;color:#fff;width:54px; height:30px;border:none;" type="button" value="取消"  />
                    </div> -->
		<script type="text/javascript">
  $(function(){
		var parent = art.dialog.parent;				// 父页面window对象
		api = art.dialog.open.api ;// 			art.dialog.open扩展方法
		
		$(".aui_main",parent.document ).css({"padding-top":0});  
		//$(".aui_inner",parent.document ).css({"border":"none"});  
		
		$(".aui_close_btn").click(function(){
			api.close();
		});
  });
</script>  
		</div>
		
    </div>
    <div style="clear:both"></div>
     
</div>    
<!--main区架构结束-->
</body>
</html>