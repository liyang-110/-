<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.factory.StudentResumeModel" %>
<%@ page import="it.sauronsoftware.base64.Base64" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="inc/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>上传简历</title>
<script type="text/javascript">
	var cur_path = "<%=request.getContextPath()%>";
</script>
<link type="text/css" rel="stylesheet" href="/member/style/core.css" />
<link type="text/css" rel="stylesheet" href="style/upload_general.css" />
<script src="../js/jquery-easyui/jquery-1.8.0.min.js"></script>
<link href="../js/layer/skins/default.css" rel="stylesheet" />
<script src="../js/layer/artDialog.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="UploadResume.js"></script>
  <script  type="text/javascript" >
var extArray = new Array(".doc", ".docx", ".jpg", ".png");
function LimitAttach(form, file) {
	var allowSubmit = false;
	if(!form.fileName.value){
		alert("请输入简历名称！");
		return;
	}
	if (!file) {
		alert("请选择上传文件，仅支持*.doc,*.docx文件！");
		return;
	}
	while (file.indexOf("\\") != -1)
	file = file.slice(file.indexOf("\\") + 1);
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
		$(form).form("submit",{
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
<script type="text/javascript">
	$(function(){
		$("#menu_1_2").addClass("on");
		$("#menu_1_2 a").addClass("one");
		
	});
</script>
<script src="/statics/artDialog/artDialog.js?skin=green"></script>

<script src="/statics/artDialog/plugins/iframeTools.js"></script>
<script src="/statics/jquery/jquery.cookie.js" type="text/javascript"></script> 
<script type="text/javascript" src="js/artDialog.notice.js?r=su" charset="utf-8"></script>

</head>

<body>
<jsp:include page="inc/header.jsp" flush="true" />
<div class="container">
    <div class="cont">
		<jsp:include page="inc/menu.jsp" flush="true" />
        <div class="right">
        	<div class="right_top">
            	<h1 class="upload">上传简历</h1>
                <div class="xian"></div>

     <form class="register-form" name="addform" id="addform" novalidate="novalidate" 
     			action="../student/uploadResume.do" method="post" enctype="multipart/form-data">
     <input type="hidden" value="student" name="user_type" />
     <input type="hidden" value="true" name="isAjax" />

                <div class="table">
                	<table width="560" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="r_align">简历名称:</td>
                        <td class="l_align">
                        <input class="text" type="text" id="fileName" placeholder="" value="<%=name %>" name="fileName"/>
                        </td>
                      </tr>
                      <tr>
                        <td class="r_align">文件:</td>
                        <td class="l_align">
                        
                        <input  type="file" id="file" placeholder="" name="file"/>
                        <!-- 
                        <a href="#" class="file">选择文件</a>
                         -->
                        </td>
                      </tr>
                      <tr>
                        <td class="r_align">&nbsp;</td>
                        <td class="l_align" style="color:#0c74f6; font-weight:bold;">只能上传* .doc,*.docx文件，大小不能超过2M。</td>
                      </tr>
                      <tr>
                        <td class="r_align">&nbsp;</td>
                        <td class="l_align">
                        <input type="button" id="register_btn" value="上传" class="upload" 
                        	onclick="LimitAttach(this.form, this.form.file.value)" />
                        </td>
                      </tr>
                    </table>
               </div>
    </form>
                </div> 
                <div class="form">
						<table width="750" border="0" cellpadding="5" cellspacing="0">
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
									/*
									String rname=Base64.encode( user.getUserName(),"GBK");
											 rname= URLEncoder.encode( rname,"GBK");
									 */
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
									onclick="editOpen('<%=model.getId()%>',0);" />保密</label></td>
							<td class="bag"><a
								href="<%=request.getContextPath()%>/upload/download.jsp?path=<%=path%>&name=<%=rname%>"
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
            </div>
            <!--right_top完成-->
</div></div>
	
<div style="clear:both;"></div>

<!--footer开始-->
<jsp:include page="inc/footer.jsp" flush="true"  />
<!--footer完成-->
</body>
</html>
