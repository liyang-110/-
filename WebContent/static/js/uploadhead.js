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
	     'queueID' : "logo_file_upload_queue",
	    'swf'  :cur_path+'/assets/uploadify/uploadify.swf',
	    'buttonImage' : cur_path+'/assets/uploadify/select_btn.png',
	    'wmode' : 'transparent',
	    'multi' : false,
	    'fileTypeExts' : '*.png;*.jpg;*.jpeg',
	    'fileTypeDesc' : '图片文件',
	    'fileSizeLimit':'1MB',
	    'height':21,
	    'width':46,
	    'uploader'    :  cur_path+'/uploadifyupLoad.do?pathSign=1&directory=logo&userid=loader',
	    'cancelImg'  : cur_path+'/assets/cancel.png',
	    'auto'      : true,
		'formData':{
        },
        'overrideEvents' : ['onUploadSuccess', 'onUploadError', 'onSelectError' ],
	    'onSelectError' : uploadify_onSelectError,
	    'onUploadError' : uploadify_onUploadError,
        'onUploadSuccess':function(file, data, response){
			var temp = data.split("|");
			var ls_url = cur_path+"/member/ajaxForm.do?methodId=fileid_to_path&in_r=su&in_file_id="+temp[0]+"&date=" + new Date();
			$.ajax({
				url:ls_url, 
				type:"post", 
				dataType:"text", 
				success:function (data) {
				if (!data) {
					return false;
				}
				data = decodeURIComponent(data);
				// var re = eval("[" + data + "]");
				var re = $.parseJSON( data );
				if ( re && re.returncode == "ok" &&  re.queryresult ) {
					var queryresult  = re.queryresult;
					if(  re.queryresult[0].ok =='ok'  ) {
						var pic = $("img.head_pic").attr("src");						
						$("img.head_pic").attr("pic", pic );					
						$("img.head_pic").attr("src",cur_path+'/'+queryresult[0].path)					
						// $("#file_upload-button").css("backgroundImage","url("+initdata[0].path+")"); 
						//$("#logo_file_save_btn input").attr("disabled",false);
						//$("#logo_file_upload_btn").hide();
						//$("#logo_file_relaod_btn").show();
						logo_file_save();
					}else if( queryresult[0].ok =='fail'  && queryresult[0].msg ){
						alert( queryresult[0].msg );
					}
				}
			}});
        }
	  });
});
function logo_file_reload()
{
	var pic = $("img.head_pic").attr("pic");
	$("img.head_pic").attr("src", pic );
	$("#logo_file_upload_btn").show();
	$("#logo_file_relaod_btn").hide();
	$("#logo_file_save_btn input").attr("disabled",true);
}
function logo_file_save()
{
	var pic = $("img.head_pic").attr("src");
	var ls_url = cur_path+"/member/ajaxForm.do?fresh=true&methodId=fileid_to_path&in_save=head&in_r=su&date=" + new Date();
	$.ajax({
		url:ls_url, 
		type:"post", 
		dataType:"text",
		data : {in_pic : pic },
		success:function (data) {
		if (!data) {
			return false;
		}
		data = decodeURIComponent(data);
		// var re = eval("[" + data + "]");
		var re = $.parseJSON( data );
		console.info( re );
		if ( re && re.returncode == "ok" &&  re.queryresult ) {
			var queryresult  = re.queryresult;
			if(  re.queryresult[0].ok =='ok'  ) {
				$("#logo_file_upload_btn").show();
				$("#logo_file_relaod_btn").hide();
				$("#logo_file_save_btn input").attr("disabled",true);
				alert( "保存成功！");
			}else if( re.queryresult[0].ok =='fail'  && re.queryresult[0].msg ){
				alert( re.queryresult[0].msg );
			}
		}
	}});
}