var Huploadify_Tpl_Simple = '<div id="${fileID}" class="uploadify-queue-item"><div style="display:none;" class="uploadify-progress"><div class="uploadify-progress-bar"></div></div></div>';
function Huploadify_file(file_btn_id,cur_path,fileid_id,filename_id,directory,userid, up_func ){
	var up = $('#'+file_btn_id ).Huploadify({
		auto:true,
		fileTypeExts:'*.png;*.jpg;*.jpeg;*.gif',
		multi:false,
		formData:{userid:userid,directory:directory},
		fileSizeLimit:2048,
		showUploadedPercent:true,
		showUploadedSize:true,
		buttonText:'上传头像',//上传按钮上的文字
		removeTimeout:0,
		itemTemplate:Huploadify_Tpl_Simple,
		uploader:'/uploadheadpic.do?r='+userid,
        onUploadSuccess:function(file, data, response){
			var temp = data.split("|");
			$("#"+fileid_id).val(temp[0]);
			$("#"+filename_id).val(temp[1]);
			if( typeof( up_func )=='function' ){
				up_func( data );
			}
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