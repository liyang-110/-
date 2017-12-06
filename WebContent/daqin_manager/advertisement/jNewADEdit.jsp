<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zhaopin.dao.factory.AdvertisementModel"%>
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
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js_common.js"></script>
<script type="text/javascript" src="NewADEdit.js"   charset="utf-8"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/swfobject.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/uploadify/jquery.uploadify.min.js"></script>

<script type="text/javascript">
	var gi_pagesize = <%=request.getParameter("pagesize")%>;
	var gi_pagenum = <%=request.getParameter("pagenum")%>;
	var gi_currentnum = <%=request.getParameter("currentnum")%>;
	var id= <%=request.getParameter("id")%>;
	function fileup(){
    	window.open('<%=request.getContextPath()%>/base/file/jUploadFile.jsp?text_new_name=file_id&text_old_name=file_name','附件上传','status=no,menubar=no,toolbar=no,dependent=yes,width=600,height=500,left=230,top=130')
    }
</script>
<script type="text/javascript">
// var cur_path = '<%=request.getContextPath()%>';
var uploadify_onSelectError = function(file, errorCode, errorMsg) {
        var msgText = "上传失败\n";
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                //this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                msgText += "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                msgText += "文件大小超过限制( " + this.settings.fileSizeLimit + " )";
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                msgText += "文件大小为0";
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                msgText += "文件格式不正确，仅限 " + this.settings.fileTypeExts;
                break;
            default:
                msgText += "错误代码：" + errorCode + "\n" + errorMsg;
        }
        alert(msgText);
};
var uploadify_onUploadError = function(file, errorCode, errorMsg, errorString) {
        // 手工取消不弹出提示
        if (errorCode == SWFUpload.UPLOAD_ERROR.FILE_CANCELLED
                || errorCode == SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED) {
            return;
        }
        var msgText = "上传失败\n";
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                msgText += "HTTP 错误\n" + errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
                msgText += "上传文件丢失，请重新上传";
                break;
            case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                msgText += "IO错误";
                break;
            case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                msgText += "安全性错误\n" + errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                msgText += "每次最多上传 " + this.settings.uploadLimit + "个";
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                msgText += errorMsg;
                break;
            case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
                msgText += "找不到指定文件，请重新操作";
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                msgText += "参数错误";
                break;
            default:
                msgText += "文件:" + file.name + "\n错误码:" + errorCode + "\n"
                        + errorMsg + "\n" + errorString;
        }
        alert(msgText);
};
 
var uploadify_onSelect = function(){
 
};
$(function(){
	  $("#logo_file_upload").uploadify({
	    'debug' : false,
	    'queueID' : "uploadify_queue",
	    'swf'  :cur_path+'/assets/uploadify/uploadify.swf',
	    'buttonImage' : cur_path+'/assets/uploadify/select_btn.png',
	    'wmode' : 'transparent',
	    'multi' : false,
	    'fileTypeExts' : '*.png;*.jpg;*.jpeg;*.gif',
	    'fileTypeDesc' : '图片文件',
	    'fileSizeLimit':'1MB',
	    'height':21,
	    'width':46,
	    'uploader'    : cur_path+'/uploadifyupLoad.do?pathSign=1&directory=ad&userid=loader',
	    'cancelImg' : cur_path+'/assets/cancel.png',
	    'folder'    : 'uploads',
	    'auto'      : true,
        'overrideEvents' : [ 'onDialogClose', 'onUploadSuccess', 'onUploadError', 'onSelectError' ],
	    'onSelectError' : uploadify_onSelectError,
	    'onUploadError' : uploadify_onUploadError,
        'onUploadSuccess':function(file, data, response){
			var temp = data.split("|");
				 //console.info(temp);
				 $("#file_id").val(temp[0]);
				 $("#file_name").val(temp[1]);
        }
	  });
});
</script>
</head>

<body>
<form id="fm" method="post"  name="fm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tabright">位置：</td>
		<td width="75%">
				<input id="in_ad_type" name="in_ad_type" class="easyui-validatebox"  style="width:260px;" />
		
		</td>
	</tr>
	<tr>
		<td class="tabright">合同编号：</td>
		<td><input id="in_owner_id" name="in_owner_id" class="easyui-validatebox inputbox" readonly  /></td>
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
		<td class="tabright">地区：</td>
		<td width="75%"><input id="in_area_id" name="in_area_id" class="easyui-validatebox"/></td>
	</tr>
	<tr>
		<td class="tabright">排序：</td>
		<td>
		<input id="in_ad_display" class="easyui-numberspinner" name="in_ad_display" />
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
		</td><td>
		<span class="red"></span>
		</td></tr></table>
		</td>
	</tr>
	<tr>
		<td class="tabright">链接地址：</td>
		<td><input id="in_ad_url" name="in_ad_url" class="easyui-validatebox inputbox"  value="http://"/></td>
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
