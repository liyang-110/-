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
function uploadify_file(file_btn_id,cur_path,fileid_id,filename_id,queue_id,directory,userid){
	$("#"+file_btn_id).uploadify({
	    'debug' : false,
	    'queueID' : queue_id,
	    'swf'  :cur_path+'/assets/uploadify/uploadify.swf',
	    'buttonImage' : cur_path+'/assets/uploadify/select_btn.png',
	    'wmode' : 'transparent',
	    'multi' : false,
	    'fileTypeExts' : '*.png;*.jpg;*.jpeg',
	    'fileTypeDesc' : '图片文件',
	    'fileSizeLimit':'1MB',
	    'height':21,
	    'width':46,
	    'uploader'    : cur_path+'/uploadifyupLoad.do?pathSign=1&directory='+directory+'&userid='+userid,
	    'cancelImg' : cur_path+'/assets/cancel.png',
	    'auto' : true,
        'overrideEvents' : ['onUploadSuccess', 'onUploadError', 'onSelectError' ],
	    'onSelectError' :uploadify_onSelectError,
	    'onUploadError' : uploadify_onUploadError,
        'onUploadSuccess':function(file, data, response){
			var temp = data.split("|");
			$("#"+fileid_id).val(temp[0]);
			$("#"+filename_id).val(temp[1]);
        }
	});
}
/*
<script>
$(function(){
		uploadify_file('logo_file_upload','',"file_id","file_name","uploadify_queue","ad","uploader");
});
</script>

		<table><tr><td>
		<input name="file_name" type="text" readonly id="file_name" style="width: 300px;"/>
		<input type="hidden" name="file_id" id="file_id"/>
		<div id="uploadify_queue"></div>
		</td><td>
		<input id="logo_file_upload" name="logo_file_upload" type="file" />
		</td><td>
		<span class="red">尺寸：195×93像素</span>
		</td></tr></table>
*/